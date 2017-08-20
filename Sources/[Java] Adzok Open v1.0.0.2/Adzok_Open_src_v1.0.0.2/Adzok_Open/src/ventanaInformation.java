
/**
 *
 * @author AngelCruel
 */
import java.awt.BorderLayout;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

public class ventanaInformation extends JPanel {

    JTable lista;
    String tituloTable[];
    public DefaultTableModel model;
    private String[][] datos = new String[0][0];

    public ventanaInformation() {
        setLayout(new BorderLayout());
        tituloTable = new String[]{" ", " "};
        model = new DefaultTableModel(datos, tituloTable);
        lista = new JTable();
        lista.setModel(model);
        lista.setEnabled(false);
        lista.setSelectionMode(0);
        lista.setShowGrid(false);

        JScrollPane scroll = new JScrollPane();
        scroll.setViewportView(lista);

        add("Center",scroll);
    }
}
