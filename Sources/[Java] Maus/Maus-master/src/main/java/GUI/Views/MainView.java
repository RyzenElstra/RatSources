package GUI.Views;


import GUI.Components.BottomBar;
import GUI.Components.TopBar;
import GUI.Controller;
import GUI.Styler;
import Maus.Maus;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;

public class MainView {

    private FlowPane getIconFlow() {
        FlowPane flow = new FlowPane();
        flow.setPadding(new Insets(10, 50, 10, 50));
        flow.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        flow.setId("iconFlow");
        flow.setVgap(15);
        flow.setHgap(15);

        HBox icons[] = new HBox[8];
        for (int i = 0; i < 7; i++) {
            HBox hBox = new HBox();
            hBox.setAlignment(Pos.CENTER);
            hBox.setPadding(new Insets(10, 10, 10, 10));
            hBox.setPrefWidth(115);
            hBox.setId("icon");

            VBox vBox = new VBox(10);
            vBox.setAlignment(Pos.CENTER);
            Label label;
            switch (i) {
                case 0:
                    label = (Label) Styler.styleAdd(new Label("Clients"), "label-bright");
                    vBox.getChildren().addAll(new ImageView(new Image(getClass().getResourceAsStream("/Images/Icons/clients.png"))), label);
                    hBox.getChildren().add(vBox);
                    icons[0] = hBox;
                    icons[0].setOnMouseClicked(event -> Controller.changePrimaryStage(new ClientView().getClientView()));
                    break;
                case 1:
                    label = (Label) Styler.styleAdd(new Label("Build"), "label-bright");
                    vBox.getChildren().addAll(new ImageView(new Image(getClass().getResourceAsStream("/Images/Icons/build.png"))), label);
                    hBox.getChildren().addAll(vBox);
                    icons[1] = hBox;
                    icons[1].setOnMouseClicked(event -> Controller.changePrimaryStage(new ClientBuilderView().getClientBuilderView()));
                    break;
                case 2:
                    label = (Label) Styler.styleAdd(new Label("Mutate"), "label-bright");
                    vBox.getChildren().addAll(new ImageView(new Image(getClass().getResourceAsStream("/Images/Icons/mutate.png"))), label);
                    hBox.getChildren().addAll(vBox);
                    icons[2] = hBox;
                    break;
                case 3:
                    label = (Label) Styler.styleAdd(new Label("Beacon"), "label-bright");
                    vBox.getChildren().addAll(new ImageView(new Image(getClass().getResourceAsStream("/Images/Icons/beacon.png"))), label);
                    hBox.getChildren().addAll(vBox);
                    icons[3] = hBox;
                    break;
                case 4:
                    label = (Label) Styler.styleAdd(new Label("Statistics"), "label-bright");
                    vBox.getChildren().addAll(new ImageView(new Image(getClass().getResourceAsStream("/Images/Icons/statistics.png"))), label);
                    hBox.getChildren().addAll(vBox);
                    icons[4] = hBox;
                    icons[4].setOnMouseClicked(event -> Controller.changePrimaryStage(new StatisticsView().getStatisticsView()));
                    break;
                case 5:
                    label = (Label) Styler.styleAdd(new Label("Updates"), "label-bright");
                    vBox.getChildren().addAll(new ImageView(new Image(getClass().getResourceAsStream("/Images/Icons/updates.png"))), label);
                    hBox.getChildren().addAll(vBox);
                    icons[5] = hBox;
                    icons[5].setOnMouseClicked(event -> Controller.changePrimaryStage(new UpdatesView().getUpdatesView()));
                    break;
                case 6:
                    label = (Label) Styler.styleAdd(new Label("Settings"), "label-bright");
                    vBox.getChildren().addAll(new ImageView(new Image(getClass().getResourceAsStream("/Images/Icons/settings.png"))), label);
                    hBox.getChildren().addAll(vBox);
                    icons[6] = hBox;
                    icons[6].setOnMouseClicked(event -> Controller.changePrimaryStage(new SettingsView().getSettingsView()));
                    break;
                case 7:
                    break;
                default:
                    break;
            }
            flow.getChildren().add(icons[i]);
        }
        return flow;
    }

    public BorderPane getMainView() {
        BorderPane borderPane = new BorderPane();
        borderPane.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        borderPane.getStyleClass().add("root");
        borderPane.setTop(new TopBar().getTopBar(Maus.getPrimaryStage()));
        borderPane.setCenter(getIconFlow());
        borderPane.setBottom(new BottomBar().getBottomBar());
        return borderPane;
    }

}
