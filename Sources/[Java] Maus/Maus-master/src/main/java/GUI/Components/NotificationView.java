package GUI.Components;

import GUI.Styler;
import Server.ClientObject;
import Server.MausSettings;
import javafx.animation.PauseTransition;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;
import javafx.stage.Screen;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javafx.util.Duration;

public class NotificationView {
    private Label notificationText;

    public static void openNotification(String text) {
        Stage stage = new Stage();
        stage.setWidth(300);
        stage.setHeight(125);
        Rectangle2D primaryScreenBounds = Screen.getPrimary().getVisualBounds();
        NotificationView notificationView = new NotificationView();
        stage.setScene(new Scene(notificationView.getNotificationView(), 300, 125));
        stage.setResizable(false);
        stage.setAlwaysOnTop(true);
        stage.setX(primaryScreenBounds.getMinX() + primaryScreenBounds.getWidth() - 300);
        stage.setY(primaryScreenBounds.getMinY() + primaryScreenBounds.getHeight() - 125);
        stage.initStyle(StageStyle.UNDECORATED);
        notificationView.getNotificationText().setWrapText(true);
        notificationView.getNotificationText().setAlignment(Pos.CENTER);
        notificationView.getNotificationText().setPadding(new Insets(0, 5, 0, 20));
        notificationView.getNotificationText().setText(text);
        stage.show();
        PauseTransition delay = new PauseTransition(Duration.seconds(5));
        delay.setOnFinished(event -> stage.close());
        delay.play();
    }

    public static void openNotification(ClientObject client) {
        Stage stage = new Stage();
        stage.setWidth(300);
        stage.setHeight(125);
        Rectangle2D primaryScreenBounds = Screen.getPrimary().getVisualBounds();
        NotificationView notificationView = new NotificationView();
        stage.setScene(new Scene(notificationView.getNotificationView(), 300, 125));
        stage.setResizable(false);
        stage.setAlwaysOnTop(true);
        stage.setX(primaryScreenBounds.getMinX() + primaryScreenBounds.getWidth() - 300);
        stage.setY(primaryScreenBounds.getMinY() + primaryScreenBounds.getHeight() - 125);
        stage.initStyle(StageStyle.UNDECORATED);
        notificationView.getNotificationText().setWrapText(true);
        notificationView.getNotificationText().setAlignment(Pos.CENTER);
        notificationView.getNotificationText().setPadding(new Insets(0, 5, 0, 20));
        notificationView.getNotificationText().setText("New Connection: " + client.getIP() + " (" + client.getNickName() + ")");
        stage.show();
        PauseTransition delay = new PauseTransition(Duration.seconds(5));
        delay.setOnFinished(event -> stage.close());
        delay.play();
    }

    private Label getNotificationText() {
        return notificationText;
    }

    private VBox getNotificationView() {
        VBox vBox = new VBox(5);
        vBox.setId("notification");
        vBox.setAlignment(Pos.CENTER);
        VBox.setVgrow(vBox, Priority.ALWAYS);
        Image alert = new Image(getClass().getResourceAsStream("/Images/Icons/alert.png"));
        ImageView imageView = new ImageView(alert);
        notificationText = new Label("");
        notificationText = (Label) Styler.styleAdd(notificationText, "label-light");
        vBox.getChildren().addAll(imageView, notificationText);
        vBox.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        if (MausSettings.SOUND) {
            Media notify = new Media(getClass().getResource("/audio/notify.mp3").toExternalForm());
            MediaPlayer mediaPlayer = new MediaPlayer(notify);
            mediaPlayer.play();
        }
        Styler.styleAdd(vBox, "notification");
        return vBox;
    }
}
