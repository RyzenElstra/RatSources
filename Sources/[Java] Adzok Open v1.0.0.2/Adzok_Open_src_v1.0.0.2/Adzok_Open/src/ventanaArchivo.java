
/**
 *
 * @author AngelCruel
 */
import java.awt.*;

import javax.swing.*;
import javax.swing.border.LineBorder;

public class ventanaArchivo extends JPanel {

    JLabel sDireccion, bDireccion;
    JButton scancelar, saceptar, bcancelar, baceptar;
    JProgressBar sprogreso, bprogreso;
    JPanel subirPanel, bajarPanel;
    JTextField tsDireccion, tbDireccion;
    JTextArea info = new JTextArea(4, 4);

    public ventanaArchivo() {
        setLayout(new BorderLayout());
        scancelar = new JButton("Cancel");
        saceptar = new JButton("Upload");
        sprogreso = new JProgressBar();
        sprogreso.setStringPainted(true);
        sprogreso.setString("0% ProgressBar only works in Adzok Pro");

        JPanel centro = new JPanel(new FlowLayout());
        JPanel p = new JPanel(new BorderLayout());
        p.setBorder(BorderFactory.createTitledBorder(new LineBorder(Color.black), "Upload File"));
        p.add("Center", sprogreso);
        p.add("East", scancelar);
        p.add("South", saceptar);

        JPanel norte = new JPanel(new FlowLayout());
        sDireccion = new JLabel("Destination Dir:");
        norte.add(sDireccion);
        tsDireccion = new JTextField(100);
        tsDireccion.setColumns(20);
        norte.add(new JScrollPane(tsDireccion));
        p.add("North", norte);
        centro.add(p);

        bcancelar = new JButton("Cancel");
        baceptar = new JButton("Download");
        bprogreso = new JProgressBar();
        bprogreso.setStringPainted(true);
        bprogreso.setString("0% Progress bar only works in Adzok Pro");

        JPanel p2 = new JPanel(new BorderLayout());
        p2.setBorder(BorderFactory.createTitledBorder(new LineBorder(Color.black), "Download File"));
        p2.add("Center", bprogreso);
        p2.add("East", bcancelar);
        p2.add("South", baceptar);

        JPanel norte2 = new JPanel(new FlowLayout());
        bDireccion = new JLabel("Remote Dir:");
        norte2.add(bDireccion);
        tbDireccion = new JTextField(100);
        tbDireccion.setColumns(20);
        norte2.add(new JScrollPane(tbDireccion));
        p2.add("North", norte2);
        centro.add(p2);

        add("North", centro);
        info.setEditable(false);
        add("Center", new JScrollPane(info));
    }

    public void setValorProgreso(int valor) {
        sprogreso.setValue(valor);
    }

    public void nuevoProgreso(int nuevo) {
        sprogreso.setValue(1);
    }
}
