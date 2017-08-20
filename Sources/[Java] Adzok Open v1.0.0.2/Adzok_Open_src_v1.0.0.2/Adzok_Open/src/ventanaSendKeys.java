
/**
 *
 * @author AngelCruel
 */
import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class ventanaSendKeys extends JPanel {

    JTextField texto;
    JLabel label;
    JButton sends;
    String[] nombres = new String[]{"F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12",
        "ENTER", "BACK", "ESC", "TAB", "SUP", "INSERT", "INICIO", "FIN", "UP", "DOWN", "LEFT", "RIGTH"};
    JButton[] botones = new JButton[nombres.length];

    public ventanaSendKeys() {
        setLayout(new BorderLayout());
        JPanel c = new JPanel(new FlowLayout());
        JPanel panelBotones = new JPanel(new GridLayout(6, 6));
        for (int i = 0; i < nombres.length; i++) {
            botones[i] = new JButton(nombres[i]);
            panelBotones.add(botones[i]);
        }
        c.add(panelBotones);

        JPanel n = new JPanel(new FlowLayout());
        JPanel norte = new JPanel(new GridLayout(3, 1));
        label = new JLabel("Ingrese las teclas a enviar:");
        texto = new JTextField(30);
        sends = new JButton("Enviar Teclas");
        norte.add(label);
        norte.add(texto);
        norte.add(sends);
        n.add(norte);

        add("North", n);
        add("Center", c);
    }
}
