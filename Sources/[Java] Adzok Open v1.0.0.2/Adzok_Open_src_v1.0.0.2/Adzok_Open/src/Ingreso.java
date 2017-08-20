
/**
 *
 * @author AngelCruel
 */
import java.awt.*;
import javax.swing.*;

public class Ingreso extends JFrame {

    JPanel panel, botones;
    JButton aceptar, cancelar;
    JLabel nombre;
    JTextField tnombre;

    public Ingreso() {
        setTitle("New Connection");
        setSize(340, 150);
        setResizable(false);
        setLocationRelativeTo(null);

        panel = new JPanel(new GridLayout(2, 2, 10, 10));
        panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        nombre = new JLabel("Machine Name:");
        nombre.setFont(new Font("Serif", Font.BOLD, 20));
        panel.add(nombre);
        tnombre = new JTextField(10);
        panel.add(tnombre);
        add(panel, BorderLayout.CENTER);

        FlowLayout f = new FlowLayout();
        f.setAlignment(FlowLayout.CENTER);
        f.setHgap(20);
        botones = new JPanel(f);
        aceptar = new JButton("Accept");
        botones.add(aceptar);
        cancelar = new JButton("Cancel");
        botones.add(cancelar);
        add(botones, BorderLayout.SOUTH);
    }
}