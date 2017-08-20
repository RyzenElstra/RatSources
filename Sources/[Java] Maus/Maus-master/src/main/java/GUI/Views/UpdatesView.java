package GUI.Views;

import GUI.Components.BottomBar;
import GUI.Components.NotificationView;
import GUI.Components.TopBar;
import GUI.Styler;
import Maus.Maus;
import javafx.application.Platform;
import javafx.geometry.Insets;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.text.Text;

import java.io.IOException;
import java.net.URL;
import java.util.Scanner;


class UpdatesView {
    private BorderPane updatesView = new BorderPane();

    BorderPane getUpdatesView() {
        updatesView.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        HBox hBox1 = getUpdatesPanel();
        HBox hBox = getAboutPanel();
        hBox.setId("updatesView");
        hBox1.setId("updatesView");
        hBox.setPadding(new Insets(0, 0, 0, 10));
        updatesView.setTop(new TopBar().getTopBar(Maus.getPrimaryStage()));
        updatesView.setLeft(hBox);
        updatesView.setCenter(hBox1);
        updatesView.setBottom(new BottomBar().getBottomBar());
        return updatesView;
    }

    private HBox getAboutPanel() {
        Label title = (Label) Styler.styleAdd(new Label("Maus 2.0b"), "title");
        Text desc = (Text) Styler.styleAdd(new Text("Maus is a lightweight remote administrative tool " +
                "written in Java \nby a single developer. Maus is intended to present necessary \nfeatures in an attractive and " +
                "easy to use UI."), "");
        Button checkUpdates = new Button("Check for Updates");
        checkUpdates.setOnMouseClicked(event -> {
            Platform.runLater(() -> NotificationView.openNotification("Update Check Complete"));

            HBox hBox = getUpdatesPanel();
            hBox.setId("updatesView");
            updatesView.setCenter(hBox);
        });
        return Styler.hContainer(Styler.vContainer(10, title, desc, checkUpdates));
    }

    private HBox getUpdatesPanel() {
        TextArea updates = new TextArea();
        updates.setPrefWidth(600);
        updates.setEditable(false);
        try {
            updates.setText(new Scanner(new URL("https://raw.githubusercontent.com/Ghosts/Maus/master/Changelog.txt").openStream(), "UTF-8").useDelimiter("\\A").next());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Styler.hContainer(updates);
    }

}
