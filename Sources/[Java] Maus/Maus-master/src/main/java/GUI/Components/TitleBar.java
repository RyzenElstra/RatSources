package GUI.Components;

import GUI.Styler;
import Logger.Level;
import Logger.Logger;
import Maus.Maus;
import Server.MausSettings;
import javafx.application.Platform;
import javafx.geometry.Insets;
import javafx.scene.control.Label;
import javafx.scene.control.MenuBar;
import javafx.scene.layout.HBox;
import javafx.stage.Stage;

import java.util.Random;

class TitleBar {

    HBox getMenuBar(Stage stage) {
        MenuBar menuBar = new MenuBar();
        menuBar.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        menuBar.getStyleClass().add("background");

        Label maus = (Label) Styler.styleAdd(new Label("\uD83D\uDC2D " + MausSettings.CURRENT_VERSION), "option-button");
        maus.setPadding(new Insets(5, 10, 5, 10));
        maus.setOnMouseClicked(event -> {
            String[] MausEasterEgg = {
                    MausSettings.CURRENT_VERSION,
                    "):",
                    "Where's the cheese?",
                    "#NotaRAT",
                    "Please consider donating to Wikipedia",
                    "Du haben keine Freunde",
                    ":)",
                    "Just don't get this shit detected",
                    "Stop clicking here",
                    "*CRASH*",
                    "Whiskers",
                    "BlackShades V.5",
                    "1 bot = 1 prayer",
                    "Why did you click here in the first place?",
                    "Maus only continues if I get community feedback!",
                    "INF3CTED!!11oneone!1oen",
                    "Deditated Wam",
                    "Meow",
                    "┌(=^‥^=)┘",
                    "(^._.^)ﾉ",
                    "\uD83D\uDC31",
                    "\uD83D\uDCA5",
                    "❤ ❤ ❤",
                    "\uD83D\uDC08",
                    "\uD83D\uDC01",
                    "\uD83D\uDC2D",
                    "Cat got your tongue?",
                    "Purrrr",
                    "Luminosity Maus 1.5",
                    "Spreche du Deutsche?",
                    "Carrier pigeons are faster",
                    "Duct Tape is more stable than this shit",
                    "Cat got your tongue?",
                    "Stay Tuned!",
                    "We're in BETA!",
            };
            Random rn = new Random();
            int rnn = rn.nextInt(MausEasterEgg.length);
            maus.setText(MausEasterEgg[rnn]);
        });

        Label minimize = (Label) Styler.styleAdd(new Label("_"), "option-button");
        minimize.setPadding(new Insets(5, 10, 5, 10));
        minimize.setOnMouseClicked(event -> stage.setIconified(true));

        Label exit = (Label) Styler.styleAdd(new Label("X"), "option-button");
        exit.setPadding(new Insets(5, 10, 5, 10));
        exit.setOnMouseClicked(event -> {
            if (stage.equals(Maus.getPrimaryStage())) {
                Logger.log(Level.INFO, "Exit event detected. ");
                /* Only hide stage if Maus is set to be background persistent */
                if (MausSettings.BACKGROUND_PERSISTENT) {
                    Maus.getPrimaryStage().hide();
                } else {
                    Platform.exit();
                    Maus.systemTray.remove(Maus.systemTray.getTrayIcons()[0]);
                    System.exit(0);
                }
            } else {
                stage.close();
            }
        });

        HBox sep = Styler.hContainer();
        sep.setId("drag-bar");
        final Delta dragDelta = new Delta();
        sep.setOnMousePressed(mouseEvent -> {
            dragDelta.x = stage.getX() - mouseEvent.getScreenX();
            dragDelta.y = stage.getY() - mouseEvent.getScreenY();
        });
        sep.setOnMouseDragged(mouseEvent -> {
            stage.setX(mouseEvent.getScreenX() + dragDelta.x);
            stage.setY(mouseEvent.getScreenY() + dragDelta.y);
        });

        HBox hBox = Styler.hContainer(5, maus, sep, minimize, exit);
        hBox.setId("drag-bar");
        return hBox;
    }

    class Delta {
        double x, y;
    }

}
