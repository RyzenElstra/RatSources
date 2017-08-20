
/**
 *
 * @author AngelCruel
 */
import java.awt.BorderLayout;
import javax.swing.*;

public class ventanaLoadShell extends JPanel {

    JTextArea texto;
    JLabel nombre;
    JTextField tnombre;
    JCheckBox ejecutar;
    JButton generar;

    public ventanaLoadShell() {
        setLayout(new BorderLayout());
        texto = new JTextArea();
        texto.setWrapStyleWord(true);
        texto.setLineWrap(true);

        nombre = new JLabel("Nombre del archivo:", JLabel.CENTER);
        tnombre = new JTextField(20);
        ejecutar = new JCheckBox("Ejecutar Script");
        generar = new JButton("Generar Script");

        JPanel down = new JPanel();
        down.add(nombre);
        down.add(tnombre);
        down.add(ejecutar);
        down.add(ejecutar);
        down.add(generar);

        add("Center", texto);
        add("South", down);
    }
}