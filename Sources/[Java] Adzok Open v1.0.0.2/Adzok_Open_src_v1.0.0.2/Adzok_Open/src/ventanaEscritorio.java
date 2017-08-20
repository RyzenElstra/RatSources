
/**
 *
 * @author AngelCruel
 */
import javax.swing.*;
import java.awt.*;

public class ventanaEscritorio extends JPanel {

    JSlider resoluciones;
    JLabel foto, labelCalidad, labelTamano, mseg;
    JTextField textoCalidad, tmseg;
    String calidades[] = {"White and Black", "Color"};
    JProgressBar progreso;
    JComboBox comboCalidad;
    JButton single, start, stop;
    JCheckBox save, gif, mouse;

    public ventanaEscritorio() {
        setLayout(new BorderLayout());
        foto = new JLabel();

        labelCalidad = new JLabel("Quality:", JLabel.CENTER);
        labelCalidad.setFont(new Font("Times New Roman", Font.BOLD, 16));
        comboCalidad = new JComboBox(calidades);
        labelTamano = new JLabel("Size:", JLabel.CENTER);
        labelTamano.setFont(new Font("Times New Roman", Font.BOLD, 16));
        textoCalidad = new JTextField();
        textoCalidad.setHorizontalAlignment(JTextField.CENTER);
        textoCalidad.setEditable(false);
        single = new JButton("Single");
        start = new JButton("Start");
        stop = new JButton("Stop");
        stop.setEnabled(false);
        mseg = new JLabel("FPS (ms)", JLabel.CENTER);
        tmseg = new JTextField("200");
        progreso = new JProgressBar(0, 100);
        progreso.setOrientation(1);
        progreso.setSize(1000, 1000);

        JPanel panelProgreso = new JPanel(new BorderLayout());
        panelProgreso.setBorder(BorderFactory.createEmptyBorder(5, 10, 0, 10));
        panelProgreso.add(progreso);
        JPanel panelIzquierdo = new JPanel(new BorderLayout());
        panelIzquierdo.setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 5));

        JPanel panelAux = new JPanel();
        panelAux.setLayout(new BoxLayout(panelAux, BoxLayout.Y_AXIS));

        JPanel izqSup = new JPanel(new GridLayout(8, 1, 30, 10));
        izqSup.add(labelCalidad);
        izqSup.add(comboCalidad);
        izqSup.add(labelTamano);
        izqSup.add(textoCalidad);
        mouse = new JCheckBox("Mouse enable");
        izqSup.add(mouse);

        izqSup.add(mseg);
        izqSup.add(tmseg);
        panelAux.add(izqSup);

        JPanel izqInf = new JPanel(new GridLayout(8, 1, 30, 10));
        izqInf.add(single);
        izqInf.add(start);
        izqInf.add(stop);
        panelAux.add(izqInf);

        panelIzquierdo.add("West", panelProgreso);
        panelIzquierdo.add("Center", panelAux);

        JPanel inferior = new JPanel(new BorderLayout());
        resoluciones = new JSlider(0, 100, 100);
        resoluciones.setPaintTicks(true);
        resoluciones.setMajorTickSpacing(10);
        resoluciones.setMinorTickSpacing(1);
        resoluciones.setPaintLabels(true);
        resoluciones.setSnapToTicks(true);
        inferior.add("South", resoluciones);

        JPanel botonesInf = new JPanel();
        save = new JCheckBox("Save capture");
        gif = new JCheckBox("Change jpeg/png");
        botonesInf.add(save);
        botonesInf.add(gif);
        inferior.add("Center", botonesInf);

        add("Center", new JScrollPane(foto));
        add("West", new JPanel().add(panelIzquierdo));
        add("South", inferior);
    }
}
