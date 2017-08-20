package GUI.Views;


import GUI.Components.BottomBar;
import GUI.Components.TopBar;
import GUI.Styler;
import Logger.Level;
import Logger.Logger;
import Maus.ClientBuilder;
import Maus.Maus;
import Server.Data.PseudoBase;
import Server.MausSettings;
import javafx.geometry.Insets;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;

import java.io.IOException;

class ClientBuilderView {

    private CheckBox persistent;
    private CheckBox autoSpread;

    BorderPane getClientBuilderView() {
        BorderPane borderPane = new BorderPane();
        borderPane.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        borderPane.setTop(new TopBar().getTopBar(Maus.getPrimaryStage()));
        borderPane.setLeft(clientBuilderSettingsLeft());
        borderPane.setCenter(clientBuilderSettingsCenter());
        borderPane.setBottom(new BottomBar().getBottomBar());
        return borderPane;
    }

    private HBox clientBuilderSettingsLeft() {
        HBox hBox = Styler.hContainer(20);
        hBox.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        hBox.setId("clientBuilder");
        hBox.setPadding(new Insets(20, 20, 20, 20));
        Label title = (Label) Styler.styleAdd(new Label("Client Builder"), "title");
        persistent = new CheckBox("Persistent");
        autoSpread = new CheckBox("Auto-Spread");
        hBox.getChildren().add(Styler.vContainer(20, title, persistent, autoSpread));
        return hBox;
    }

    private HBox clientBuilderSettingsCenter() {
        HBox hBox = Styler.hContainer(20);
        hBox.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        hBox.setId("clientBuilder");
        hBox.setPadding(new Insets(20, 20, 20, 20));
        Label title = (Label) Styler.styleAdd(new Label(" "), "title");

        Label serverIPLabel = (Label) Styler.styleAdd(new Label("Server IP: "), "label-bright");
        TextField serverIP = new TextField("" + MausSettings.CONNECTION_IP);
        HBox serverIPBox = Styler.hContainer(serverIPLabel, serverIP);
        serverIP.setEditable(true);

        Label portLabel = (Label) Styler.styleAdd(new Label("Port: "), "label-bright");
        TextField port = new TextField("" + MausSettings.PORT);
        HBox portBox = Styler.hContainer(portLabel, port);
        port.setEditable(true);
        port.textProperty().addListener(((observable, oldValue, newValue) -> {
            if (!newValue.matches("\\d*")) {
                port.setText(newValue.replaceAll("[^\\d]", ""));
            }
        }));

        Label clientNameLabel = (Label) Styler.styleAdd(new Label("Client Name: "), "label-bright");
        TextField clientName = new TextField("Client");
        HBox clientNameBox = Styler.hContainer(clientNameLabel, clientName);
        clientName.setEditable(true);

        Button buildClient = new Button("Build");
        buildClient.setPrefWidth(150);
        buildClient.setPrefHeight(50);
        buildClient.setOnAction(event -> {
            if ((!serverIP.getText().equals("")) && !serverIP.getText().equals(MausSettings.CONNECTION_IP)) {
                MausSettings.CONNECTION_IP = (serverIP.getText());
            }
            if ((!port.getText().equals("")) && Integer.parseInt(port.getText()) != MausSettings.PORT) {
                MausSettings.PORT = (Integer.parseInt(port.getText()));
            }
            try {
                if (autoSpread.isSelected()) {
                    ClientBuilder.autoSpread = true;
                }
                if (persistent.isSelected()) {
                    ClientBuilder.isPersistent = true;
                }
                PseudoBase.writeMausData();
            } catch (IOException e) {
                Logger.log(Level.ERROR, e.toString());
            }
            if ((!clientName.getText().equals(""))) {
                ClientBuilder clientBuilder = new ClientBuilder(clientName.getText());
                try {
                    clientBuilder.run();
                } catch (IOException e) {
                    Logger.log(Level.ERROR, e.toString());
                }
            }
        });
        hBox.getChildren().add(Styler.vContainer(20, title, serverIPBox, portBox, clientNameBox, buildClient));
        return hBox;
    }
}
