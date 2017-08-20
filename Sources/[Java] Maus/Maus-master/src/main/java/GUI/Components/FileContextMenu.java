package GUI.Components;

import Logger.Level;
import Logger.Logger;
import Maus.Maus;
import Server.ClientObject;
import javafx.scene.control.ContextMenu;
import javafx.scene.control.MenuItem;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.stage.DirectoryChooser;

import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;

public class FileContextMenu {
    public static String selectedDirectory;

    public static void getFileContextMenu(HBox fileIcon, String fileName, MouseEvent e, ClientObject client) {
        ContextMenu cm = new ContextMenu();
        MenuItem sb1 = new MenuItem("Delete File");
        MenuItem sb2 = new MenuItem("Download File");
        sb2.setOnAction(event -> {
            DirectoryChooser directoryChooser = new DirectoryChooser();
            directoryChooser.setTitle("Select download location");
            File selectedDirectory =
                    directoryChooser.showDialog(Maus.getPrimaryStage());
            FileContextMenu.selectedDirectory = selectedDirectory.getAbsolutePath();
            try {
                client.clientCommunicate("DOWNLOAD");
                client.clientCommunicate(fileName);
            } catch (IOException e1) {
                Logger.log(Level.ERROR, e1.toString());
            }
        });
        cm.getItems().addAll(sb1, sb2);
        cm.show(fileIcon, e.getScreenX(), e.getScreenY());
    }

    public static void getDirectoryMenu(HBox fileIcon, String fileName, MouseEvent e, ClientObject client) {
        ContextMenu cm = new ContextMenu();
        MenuItem sb2 = new MenuItem("Open Folder");
        sb2.setOnAction(event -> {
            try {
                client.clientCommunicate("CHNGDIR");
                DataOutputStream dos = new DataOutputStream(client.getClient().getOutputStream());
                dos.writeUTF(fileName);
            } catch (IOException e1) {
                Logger.log(Level.ERROR, e1.toString());
            }
        });
        cm.getItems().addAll(sb2);
        cm.show(fileIcon, e.getScreenX(), e.getScreenY());
    }
}
