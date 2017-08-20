package GUI;

import GUI.Components.BottomBar;
import GUI.Components.ClientList;
import Maus.Maus;
import Server.ClientObject;
import Server.Data.PseudoBase;
import Server.Data.Repository;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.Scene;
import javafx.scene.control.TableView;
import javafx.scene.layout.Pane;

import static GUI.Components.ClientList.getTableView;

public class Controller implements Repository {

    /* Reloads the table to ensure Offline/Online status is accurate. */
    public static void updateTable() {
        ObservableList<ClientObject> list = FXCollections.observableArrayList();
        list.addAll(PseudoBase.getMausData().values());
        getTableView().setItems(list);
        TableView tableView = getTableView();
        tableView.refresh();
    }

    /* Refreshes the number of connections based on MausData size. */
    public static void updateStats() {
        Platform.runLater(() -> BottomBar.getConnectionsLabel().setText("  Connections: " + CONNECTIONS.size()));
    }

    /* Changes the primary view to the provided scene. */
    public static void changePrimaryStage(Pane newScene) {
        Maus.getPrimaryStage().setScene(new Scene(newScene, 900, 500));
    }
}
