package GUI;

import javafx.scene.Node;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;

/* Styler provides methods and components useful for quickly creating UI elements or accessing shared resources. */
public class Styler {
    /* Adds a CSS style class to a Node. */
    public static Node styleAdd(Node node, String styleName) {
        node.getStyleClass().add(styleName);
        return node;
    }

    /* Returns a VBox with the provided nodes added to it. */
    public static VBox vContainer(Node... nodes) {
        VBox vBox = new VBox();
        VBox.setVgrow(vBox, Priority.ALWAYS);
        vBox.setMaxWidth(Double.MAX_VALUE);
        for (Node r : nodes) {
            vBox.getChildren().add(r);
        }
        return vBox;
    }

    /* Returns a VBox with the provided nodes added to it, spaced by an int. */
    public static VBox vContainer(int spacing, Node... nodes) {
        VBox vBox = new VBox(spacing);
        VBox.setVgrow(vBox, Priority.ALWAYS);
        vBox.setMaxWidth(Double.MAX_VALUE);
        for (Node r : nodes) {
            vBox.getChildren().add(r);
        }
        return vBox;
    }

    /* Returns a HBox with the provided nodes added to it, spaced by an int. */
    public static HBox hContainer(int spacing, Node... nodes) {
        HBox hBox = new HBox(spacing);
        HBox.setHgrow(hBox, Priority.ALWAYS);
        hBox.setMaxWidth(Double.MAX_VALUE);
        for (Node r : nodes) {
            hBox.getChildren().add(r);
        }
        return hBox;
    }

    /* Returns a HBox with the provided nodes added to it. */
    public static HBox hContainer(Node... nodes) {
        HBox hBox = new HBox();
        HBox.setHgrow(hBox, Priority.ALWAYS);
        hBox.setMaxWidth(Double.MAX_VALUE);
        for (Node r : nodes) {
            hBox.getChildren().add(r);
        }
        return hBox;
    }

}
