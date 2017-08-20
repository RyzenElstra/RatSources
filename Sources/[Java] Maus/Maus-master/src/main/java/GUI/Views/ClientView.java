package GUI.Views;

import GUI.Components.BottomBar;
import GUI.Components.ClientList;
import GUI.Components.TopBar;
import GUI.Styler;
import Maus.Maus;
import javafx.scene.layout.BorderPane;

class ClientView {
    BorderPane getClientView() {
        BorderPane borderPane = new BorderPane();
        borderPane.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        borderPane.getStyleClass().add("root");
        borderPane.setTop(new TopBar().getTopBar(Maus.getPrimaryStage()));
        borderPane.setCenter(Styler.vContainer(new ClientList().getClientList()));
        borderPane.setBottom(new BottomBar().getBottomBar());
        return borderPane;
    }
}
