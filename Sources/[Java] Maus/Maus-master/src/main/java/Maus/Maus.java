package Maus;

import GUI.Views.MainView;
import Logger.Level;
import Logger.Logger;
import Server.Data.PseudoBase;
import Server.*;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.io.*;
import java.net.URL;
import java.nio.channels.FileLock;

public class Maus extends Application {
    private static Stage primaryStage;
    private static Server server = new Server();
    public static SystemTray systemTray;

    public static Stage getPrimaryStage() {
        return primaryStage;
    }

    public static void main(String[] args) {
        if (lockInstance()) {
            launch(args);
        } else {
            System.exit(0);
        }
    }

    /* Ensure only one instance of Maus is running on a system (server, not client). */
    private static boolean lockInstance() {
        try {
            final File file = new File(System.getProperty("user.home") + "/.lock");
            final RandomAccessFile randomAccessFile = new RandomAccessFile(file, "rw");
            final FileLock fileLock = randomAccessFile.getChannel().tryLock();
            if (fileLock != null) {
                Runtime.getRuntime().addShutdownHook(new Thread(() -> {
                    try {
                        fileLock.release();
                        randomAccessFile.close();
                        file.delete();
                        /*Before Maus is closed - write Maus data to file (server settings, clients, etc.) */
                        try {
                            PseudoBase.writeMausData();
                            Logger.log(Level.INFO, "MausData saved to file. ");
                        } catch (IOException e) {
                            Logger.log(Level.ERROR, e.toString());
                        }
                    } catch (Exception e) {
                        Logger.log(Level.ERROR, e.toString());
                    }
                }));
                return true;
            }
        } catch (Exception e) {
            Logger.log(Level.ERROR, e.toString());
        }
        return false;
    }

    @Override
    public void start(Stage primaryStage) throws IOException, ClassNotFoundException {
        Maus.primaryStage = primaryStage;
        /* Ensure that the necessary files exist */
        new PseudoBase().createMausData();
        /* Load data from files - including client data, server settings, etc. */
        new PseudoBase().loadData();
        /* Set up primary view */
        getPrimaryStage().setTitle(MausSettings.CURRENT_VERSION);

        SwingUtilities.invokeLater(this::addAppToTray);
        Platform.setImplicitExit(false);
        Scene mainScene = new Scene(new MainView().getMainView(), 900, 500);
        mainScene.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        getPrimaryStage().setScene(mainScene);
        getPrimaryStage().getIcons().add(new Image(getClass().getResourceAsStream("/Images/Icons/icon.png")));
        getPrimaryStage().setOnCloseRequest(event -> System.exit(0));

        /* Maus is running! */
        Logger.log(Level.INFO, "Maus is running.");
        getPrimaryStage().initStyle(StageStyle.UNDECORATED);

        /* Set user's IP as Server IP */
        URL whatismyip = new URL("http://checkip.amazonaws.com");
        BufferedReader in = new BufferedReader(new InputStreamReader(
                whatismyip.openStream()));

        String ip = in.readLine();
        MausSettings.CONNECTION_IP = ip;
        getPrimaryStage().show();

        /* Start the server to listen for client connections. */
        Runnable startServer = server;
        new Thread(startServer).start();
    }


    /* Attempt to add Maus to the System Tray - regardless of persistence (handled in TitleBar) */
    private void addAppToTray() {
        try {
           Toolkit.getDefaultToolkit();

            if (!SystemTray.isSupported()) {
                System.out.println("No system tray support, application exiting.");
                Platform.exit();
            }

            systemTray = SystemTray.getSystemTray();
            java.awt.Image image = ImageIO.read(getClass().getResourceAsStream("/Images/Icons/icon.png"));
            TrayIcon trayIcon = new TrayIcon(image);
            trayIcon.setImageAutoSize(true);
            trayIcon.addActionListener(event -> Platform.runLater(this::showStage));

            MenuItem openItem = new MenuItem("Open Maus");
            openItem.addActionListener(event -> Platform.runLater(this::showStage));

            Font defaultFont = Font.decode(null);
            Font boldFont = defaultFont.deriveFont(java.awt.Font.BOLD);
            openItem.setFont(boldFont);

            MenuItem exitItem = new MenuItem("Exit");
            exitItem.addActionListener(event -> {
                Platform.exit();
                systemTray.remove(trayIcon);
                System.exit(0);
            });
            final PopupMenu popup = new PopupMenu();
            popup.add(openItem);
            popup.addSeparator();
            popup.add(exitItem);
            trayIcon.setPopupMenu(popup);
            systemTray.add(trayIcon);
        } catch (Exception e) {
            Logger.log(Level.ERROR, "Unable to access system tray.");
            e.printStackTrace();
        }
    }

    private void showStage() {
        getPrimaryStage().setScene(new Scene(new MainView().getMainView(), 900, 500));
        getPrimaryStage().show();
        getPrimaryStage().toFront();
    }
}
