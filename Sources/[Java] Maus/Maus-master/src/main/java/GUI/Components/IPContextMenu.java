package GUI.Components;

import GUI.Controller;
import GUI.Views.RemoteDesktopView;
import GUI.Views.SendCommandView;
import Server.ClientObject;
import Server.Data.PseudoBase;
import Server.Data.Repository;
import javafx.scene.Scene;
import javafx.scene.control.ContextMenu;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuItem;
import javafx.scene.control.TableCell;
import javafx.scene.input.Clipboard;
import javafx.scene.input.ClipboardContent;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

import java.io.IOException;

class IPContextMenu implements Repository {
    static void getIPContextMenu(TableCell n, MouseEvent e) {
        ClientObject clientObject = ((ClientObject) n.getTableView().getSelectionModel().getSelectedItem());
        ContextMenu cm = new ContextMenu();
        Menu mi1 = new Menu("Perform Action...");
        MenuItem sb1 = new MenuItem("File Explorer");
        sb1.setOnAction(event -> {
            if (clientObject != null && clientObject.getClient().isConnected() && clientObject.getOnlineStatus().equals("Online")) {
                try {
                    clientObject.clientCommunicate("FILELIST");
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
        });
        MenuItem sb2 = new MenuItem("Send Command");
        sb2.setOnAction(event -> {
            Stage stage = new Stage();
            stage.initStyle(StageStyle.UNDECORATED);
            stage.setMinWidth(300);
            stage.setMinWidth(300);
            stage.setScene(new Scene(new SendCommandView().getSendCommandView(stage), 400, 400));
            stage.show();
            SendCommandView.getsendCommandButton().setOnAction(a -> {
                if (clientObject != null && clientObject.getClient().isConnected() && clientObject.getOnlineStatus().equals("Online")) {
                    try {
                        clientObject.clientCommunicate("CMD " + SendCommandView.getTextField().getText());
                    } catch (IOException e1) {
                        e1.printStackTrace();
                    }
                }
            });
        });
        MenuItem sb3 = new MenuItem("Remote Desktop");
        sb3.setOnAction(event -> {
            Stage stage = new Stage();
            stage.initStyle(StageStyle.UNDECORATED);
            stage.setMinWidth(300);
            stage.setMinWidth(300);
            stage.setScene(new Scene(new RemoteDesktopView().getRemoteDesktopView(clientObject, stage), 400, 400));
            stage.show();
        });
        mi1.getItems().addAll(sb1, sb2, sb3);
        MenuItem mi2 = new MenuItem("Copy IP");
        mi2.setOnAction(event -> {
            final Clipboard clipboard = Clipboard.getSystemClipboard();
            final ClipboardContent content = new ClipboardContent();
            content.putString(n.getText());
            clipboard.setContent(content);
        });
        MenuItem mi3 = new MenuItem("Uninstall Server");
        mi3.setOnAction(event -> {
            if (clientObject != null && clientObject.getClient().isConnected() && clientObject.getOnlineStatus().equals("Online")) {
                try {
                    clientObject.clientCommunicate("EXIT");
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
            assert clientObject != null;
            PseudoBase.getMausData().remove(clientObject.getIP());
            CONNECTIONS.remove(clientObject.getIP());
            Controller.updateStats();
            Controller.updateTable();
        });
        cm.getItems().addAll(mi1, mi2, mi3);
        cm.show(n, e.getScreenX(), e.getScreenY());
    }
}
