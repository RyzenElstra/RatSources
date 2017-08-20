
/**
 *
 * @author AngelCruel
 */
import java.awt.Color;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.*;

public class Inicio extends JFrame {

    public Inicio() {
        setTitle("Adzok Open");
        setSize(700, 260);
        setLocationRelativeTo(null);
        setUndecorated(true);
        JLabel label = new JLabel();
        label.setIcon(new ImageIcon(getClass().getResource("resources/InicioOpen.png")));
        label.setHorizontalAlignment(JLabel.CENTER);
        label.setVerticalAlignment(JLabel.CENTER);
        label.setBackground(Color.BLACK);
        label.setOpaque(true);
        add(label);

        setVisible(true);
        try {
            Thread.sleep(2000);
        } catch (InterruptedException ex) {
            Logger.getLogger(License.class.getName()).log(Level.SEVERE, null, ex);
        }
        new License();
        setVisible(false);
    }

    public static void main(String args[]) {
        new Inicio();
    }
}
