package GUI.Components;

import GUI.Controller;
import GUI.Styler;
import GUI.Views.MainView;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;


public class TopBar {

    public VBox getTopBar(Stage stage) {
        Image image = new Image(getClass().getResourceAsStream("/Images/logo.png"));
        ImageView imageView = new ImageView(image);

        VBox vBox = new VBox();
        vBox.setAlignment(Pos.CENTER);
        Label label = (Label) Styler.styleAdd(new Label("Dashboard"), "label-light");
        vBox.getChildren().addAll(new ImageView(new Image(getClass().getResourceAsStream("/Images/Icons/icon.png"))), label);
        vBox.setPadding(new Insets(5, 10, 0, 5));
        vBox.setId("homeButton");


        VBox vBox1 = new VBox();
        vBox1.setAlignment(Pos.CENTER);
        vBox1.getChildren().add(new ImageView(new Image(getClass().getResourceAsStream("/Images/logo.png"))));
        vBox1.setPadding(new Insets(5, 10, 5, 5));

        HBox hBox = Styler.hContainer(new HBox(), vBox, vBox1);
        vBox.setOnMouseClicked(event -> Controller.changePrimaryStage(new MainView().getMainView()));
        imageView.setFitWidth(100);
        imageView.setFitHeight(50);
        return Styler.vContainer(new VBox(), new TitleBar().getMenuBar(stage), hBox);
    }

    public VBox getTopBarSansOptions(Stage stage) {
        Image image = new Image(getClass().getResourceAsStream("/Images/logo.png"));
        ImageView imageView = new ImageView(image);

        VBox vBox1 = new VBox();
        vBox1.setAlignment(Pos.CENTER);
        vBox1.getChildren().add(new ImageView(new Image(getClass().getResourceAsStream("/Images/logo.png"))));
        vBox1.setPadding(new Insets(5, 10, 5, 5));

        HBox hBox = Styler.hContainer(new HBox(), vBox1);
        imageView.setFitWidth(100);
        imageView.setFitHeight(50);
        return Styler.vContainer(new VBox(), new TitleBar().getMenuBar(stage), hBox);
    }
}
