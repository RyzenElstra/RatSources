
/**
 *
 * @author AngelCruel
 */
import java.awt.Color;
import java.awt.Cursor;
import java.awt.Desktop;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.*;
import javax.swing.border.LineBorder;

public class ventanaExplorador extends JPanel implements ActionListener {

    JButton boton;

    public ventanaExplorador() {
        JPanel panel = new JPanel(new GridLayout(4, 1, 10, 10));

        JLabel label = new JLabel("Function \"File Browser\"", JLabel.CENTER);
        label.setFont(new Font("Serif", Font.BOLD, 18));
        panel.add(label);

        JLabel label2 = new JLabel("is only available in Adzok Pro", JLabel.CENTER);
        label2.setFont(new Font("Serif", Font.BOLD, 18));
        panel.add(label2);

        JLabel label3 = new JLabel("for more information visit:", JLabel.CENTER);
        label3.setFont(new Font("Serif", Font.BOLD, 18));
        panel.add(label3);

        boton = new JButton("<html><a href=\"http://adzok.com\">http://adzok.com</a></html>");
        boton.setFont(new Font("Serif", Font.PLAIN, 18));
        boton.setBorderPainted(false);
        boton.setOpaque(false);
        boton.setFocusable(false);
        boton.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        boton.addActionListener(this);
        boton.setContentAreaFilled(false);
        panel.add(boton);

        panel.setBorder(BorderFactory.createTitledBorder(new LineBorder(Color.black), ""));
        add(panel);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == boton) {
            try {
                Desktop.getDesktop().browse(new URI("http://adsocks.sytes.net"));
            } catch (IOException ex) {
                Logger.getLogger(ventanaExplorador.class.getName()).log(Level.SEVERE, null, ex);
            } catch (URISyntaxException ex) {
                Logger.getLogger(ventanaExplorador.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
