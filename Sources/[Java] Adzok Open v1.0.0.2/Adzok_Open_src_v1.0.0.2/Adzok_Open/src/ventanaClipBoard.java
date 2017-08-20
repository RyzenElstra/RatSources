
/**
 *
 * @author AngelCruel
 */
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridLayout;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

public class ventanaClipBoard extends JPanel {

    JTextArea textoIn;
    JTextArea textoOut;
    JButton actualizar, set, clear;

    public ventanaClipBoard() {
        TitledBorder borderRemoto = new TitledBorder(new LineBorder(Color.BLACK));
        setLayout(new GridLayout(2, 1, 10, 10));
        textoIn = new JTextArea();
        JScrollPane s = new JScrollPane();
        s.setViewportView(textoIn);
        actualizar = new JButton("Capturar Portapapeles");

        JPanel b = new JPanel();
        b.add(actualizar);
        JPanel north = new JPanel(new BorderLayout());
        north.add("North", b);
        north.add("Center", s);
        north.setBorder(borderRemoto);
        add(north);

        textoOut = new JTextArea();
        JScrollPane d = new JScrollPane();
        d.setViewportView(textoOut);
        set = new JButton("Establecer texto en portapapeles");
        clear = new JButton("Borrar Portapapeles");
        JPanel c = new JPanel();
        c.add(set);
        c.add(clear);
        JPanel south = new JPanel(new BorderLayout());
        south.add("North", c);
        south.add("Center", d);
        south.setBorder(borderRemoto);
        add(south);
    }
}
