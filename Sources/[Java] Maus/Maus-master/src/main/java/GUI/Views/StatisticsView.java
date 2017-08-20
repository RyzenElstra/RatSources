package GUI.Views;

import GUI.Components.BottomBar;
import GUI.Components.TopBar;
import GUI.Styler;
import Maus.Maus;
import Server.Data.Repository;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.scene.chart.PieChart;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;

import java.util.HashMap;


class StatisticsView implements Repository {
    private BorderPane statisticsView = new BorderPane();
    private HashMap<String, Integer> operatingSystems = new HashMap<>();

    BorderPane getStatisticsView() {
        statisticsView.getStylesheets().add(getClass().getResource("/css/global.css").toExternalForm());
        HBox systemPanel = getSystemPanel();
        systemPanel.setId("statisticsView");
        systemPanel.setPadding(new Insets(0, 0, 0, 10));

        HBox statPanel = new HBox();
        statPanel.setId("statisticsView");
        statPanel.setPadding(new Insets(0, 0, 0, 10));

        statisticsView.setTop(new TopBar().getTopBar(Maus.getPrimaryStage()));
        statisticsView.setLeft(systemPanel);
        statisticsView.setCenter(statPanel);
        statisticsView.setBottom(new BottomBar().getBottomBar());
        return statisticsView;
    }

    private HBox getSystemPanel() {
        ObservableList<PieChart.Data> pieChartData =
                FXCollections.observableArrayList();
        CONNECTIONS.forEach((string, clientObject) -> {
            if (clientObject.getSYSTEM_OS() != null) {
                if (operatingSystems.containsKey(clientObject.getSYSTEM_OS())) {
                    operatingSystems.put(clientObject.getSYSTEM_OS(), operatingSystems.get(clientObject.getSYSTEM_OS()) + 1);
                } else {
                    operatingSystems.put(clientObject.getSYSTEM_OS(), 1);
                }
            }
        });
        operatingSystems.forEach((string, integer) -> {
            pieChartData.add(new PieChart.Data(string, CONNECTIONS.size() / integer));
        });
        final PieChart chart = new PieChart(pieChartData);
        chart.setLegendVisible(false);
        chart.setTitle("Operating Systems");
        chart.setMaxSize(300, 300);
        return Styler.hContainer(Styler.vContainer(10, chart));
    }


}
