
/**
 *
 * @author AngelCruel
 */
import java.applet.*;
import java.awt.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.*;

public class conectado extends JDialog implements Runnable {

    JLabel label1;
    JLabel label2;
    AudioClip sinicio;
    Dimension tamaño;

    public conectado(Dimension tamaño, String usuario, String ip) {
        this.tamaño = tamaño;
        sinicio = Applet.newAudioClip(getClass().getResource("resources/return.au"));
        this.setUndecorated(true);
        setSize(160, 130);
        this.getContentPane().setBackground(Color.DARK_GRAY);
        label1 = new JLabel(usuario, JLabel.CENTER);
        label2 = new JLabel(ip, JLabel.CENTER);

        setLayout(new GridLayout(3, 1, 7, 7));
        JLabel la = new JLabel("Connected:", JLabel.CENTER);
        la.setForeground(Color.WHITE);
        la.setBackground(Color.BLACK);
        la.setOpaque(true);
        la.setFont(new Font("Comic Sans", Font.BOLD, 15));
        add(la);
        label1.setForeground(Color.WHITE);
        label1.setBackground(Color.BLACK);
        label1.setOpaque(true);
        label2.setForeground(Color.WHITE);
        label2.setBackground(Color.BLACK);
        label2.setOpaque(true);

        add(label1);
        add(label2);
        setVisible(true);
        setAlwaysOnTop(true);
        setLocation(tamaño.width - 160, tamaño.height);
    }

    @Override
    public void run() {
        try {
            for (int i = 0; i <= 160; i++) {
                setLocation(tamaño.width - 160, tamaño.height - i);
                Thread.sleep(10);
                if (i == 70) {
                    sinicio.play();
                }
            }
            Thread.sleep(2000);
        } catch (InterruptedException ex) {
            Logger.getLogger(conectado.class.getName()).log(Level.SEVERE, null, ex);
        }
        setVisible(false);
    }
}
