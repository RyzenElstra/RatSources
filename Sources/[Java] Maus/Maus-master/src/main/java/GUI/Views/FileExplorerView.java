package GUI.Views;

import GUI.Components.BottomBar;
import GUI.Components.FileContextMenu;
import GUI.Components.TopBar;
import GUI.Styler;
import Logger.Level;
import Logger.Logger;
import Server.ClientObject;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.Tooltip;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseButton;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

import java.io.IOException;


public class FileExplorerView {
    private static ClientObject client;

    private static void setClient(ClientObject client) {
        FileExplorerView.client = client;
    }

    private static String getExtensionImage(String s) {
        String extension = "";
        int i = s.lastIndexOf('.');
        if (i > 0) {
            extension = s.substring(i + 1);
        }
        /* Ignore the hideous switch statement, I will fix it later. */
        switch (extension) {
            case "":
                return "folder.png";
            case "ae":
                return "ae.png";
            case "br":
                return "br.png";
            case "cdr":
                return "cdr.png";
            case "csh":
                return "csh.png";
            case "css":
                return "css.png";
            case "csv":
                return "csv.png";
            case "dll":
                return "dll.png";
            case "doc":
            case "docx":
                return "doc.png";
            case "dw":
                return "dw.png";
            case "eps":
                return "eps.png";
            case "exe":
                return "exe.png";
            case "fla":
                return "fla.png";
            case "flac":
                return "flac.png";
            case "flv":
                return "flv.png";
            case "gif":
                return "gif.png";
            case "html":
                return "html.png";
            case "jpeg":
                return "jpeg.png";
            case "jpg":
                return "jpg.png";
            case "mkv":
                return "mkv.png";
            case "mobi":
                return "mobi.png";
            case "mov":
                return "mov.png";
            case "mp3":
                return "mp3.png";
            case "mpg":
                return "mpg.mp3";
            case "ot":
                return "ot.png";
            case "otf":
                return "otf.png";
            case "pdf":
                return "pdf.png";
            case "php":
                return "php.png";
            case "png":
                return "png.png";//lol
            case "ppt":
                return "ppt.png";
            case "ps":
                return "ps.png";
            case "psd":
                return "psd.png";
            case "rar":
                return "rar.png";
            case "rtf":
                return "rtf.png";
            case "svg":
                return "svg.png";
            case "tar":
                return "tar.png";
            case "tif":
                return "tif.png";
            case "ttf":
                return "ttf.png";
            case "txt":
                return "txt.png";
            case "wav":
                return "wav.png";
            case "wma":
                return "wma.png";
            case "xls":
                return "xls.png";
            case "zip":
                return "zip.png";
                /*Whew.*/
            default:
                return "file.png";
        }
    }

    public BorderPane getFileExplorerView(String pathName, String[] files, Stage stage, ClientObject client) {
        setClient(client);
        BorderPane borderPane = new BorderPane();
        borderPane.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        borderPane.setTop(new TopBar().getTopBarSansOptions(stage));
        borderPane.setCenter(getFileExplorerViewCenter(pathName, files));
        borderPane.setBottom(new BottomBar().getBottomBar());
        return borderPane;
    }

    private ScrollPane getFileExplorerViewCenter(String pathName, String[] files) {
        pathName = pathName.replace("\\", "/");
        Button directoryUp = new Button("Up a directory");
        directoryUp.setOnAction(e -> {
            try {
                client.clientCommunicate("DIRECTORYUP");
            } catch (IOException e1) {
                Logger.log(Level.ERROR, e1.toString());
            }
        });
        Label title = (Label) Styler.styleAdd(new Label("Current Directory:"), "title");
        Label pathLabel = (Label) Styler.styleAdd(new Label(pathName), "label-bright");
        pathLabel.setWrapText(true);
        HBox pathNameBox = Styler.hContainer(5, Styler.vContainer(10, title, pathLabel, directoryUp));
        pathNameBox.setPrefHeight(100);
        pathNameBox.setPrefWidth(200);
        pathNameBox.setPadding(new Insets(5, 5, 5, 5));

        FlowPane flow = new FlowPane();
        flow.getChildren().add(pathNameBox);
        flow.setPadding(new Insets(10, 50, 10, 50));
        flow.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        flow.setId("file-pane");
        flow.setVgap(10);
        flow.setHgap(10);
        flow.setAlignment(Pos.CENTER);
        HBox icons[] = new HBox[files.length];
        int rot = 0;
        for (String s : files) {
            HBox hBox = new HBox();
            hBox.setAlignment(Pos.CENTER);
            hBox.setPrefWidth(100);
            hBox.setPrefHeight(100);
            hBox.setId("file-icon");
            hBox.setPadding(new Insets(5, 5, 5, 5));
            VBox vBox = new VBox(5);
            vBox.setAlignment(Pos.CENTER);
            Label label;
            label = (Label) Styler.styleAdd(new Label(s), "label-bright");
            Tooltip t = new Tooltip(s);
            Tooltip.install(hBox, t);
            vBox.getChildren().addAll(new ImageView(new Image("/Images/Icons/FileExplorer/" + getExtensionImage(s))), label);
            hBox.getChildren().add(vBox);
            hBox.setOnMouseClicked(event -> {
                if (event.getButton().equals(MouseButton.SECONDARY)) {
                    if (getExtensionImage(s).contains("folder.png")) {
                        FileContextMenu.getDirectoryMenu(hBox, s, event, client);
                    } else {
                        FileContextMenu.getFileContextMenu(hBox, s, event, client);
                    }
                }
            });
            icons[rot] = hBox;
            flow.getChildren().add(icons[rot]);
            rot++;
        }
        ScrollPane scroll = new ScrollPane();
        scroll.setId("scroll-pane");
        scroll.setHbarPolicy(ScrollPane.ScrollBarPolicy.AS_NEEDED);    // Horizontal scroll bar
        scroll.setVbarPolicy(ScrollPane.ScrollBarPolicy.AS_NEEDED);    // Vertical scroll bar
        scroll.setContent(flow);
        scroll.viewportBoundsProperty().addListener((ov, oldBounds, bounds) -> {
            flow.setPrefWidth(bounds.getWidth());
            flow.setPrefHeight(bounds.getHeight());
        });
        return scroll;
    }

}
