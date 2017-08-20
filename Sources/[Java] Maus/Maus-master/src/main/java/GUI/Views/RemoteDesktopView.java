package GUI.Views;

import GUI.Components.BottomBar;
import GUI.Components.TopBar;
import Server.ClientObject;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;


public class RemoteDesktopView {
    private static ClientObject client;

    private static void setClient(ClientObject client) {
        RemoteDesktopView.client = client;
    }

    public BorderPane getRemoteDesktopView(ClientObject client, Stage stage) {
        setClient(client);
        BorderPane borderPane = new BorderPane();
        borderPane.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        ImageView imageView = new ImageView();
        borderPane.setTop(new TopBar().getTopBarSansOptions(stage));
        borderPane.setCenter(imageView);
        borderPane.setBottom(new BottomBar().getBottomBar());
        return borderPane;
    }
}
