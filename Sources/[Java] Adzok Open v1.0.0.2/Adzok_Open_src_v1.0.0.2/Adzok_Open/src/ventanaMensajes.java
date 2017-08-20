
/**
 *
 * @author AngelCruel
 */
import java.awt.*;
import java.awt.event.KeyEvent;
import javax.swing.*;
import javax.swing.border.LineBorder;

public class ventanaMensajes extends JPanel {

    ButtonGroup group = new ButtonGroup();
    JRadioButton inf = new JRadioButton("Information");
    JRadioButton err = new JRadioButton("Error");
    JRadioButton warn = new JRadioButton("Warning");
    JLabel titulo, mensaje;
    JTextField ttitulo, tmensaje;
    JButton enviar;

    public ventanaMensajes() {

        JPanel principal = new JPanel(new GridLayout(4, 1));
        titulo = new JLabel("Title:          ");
        titulo.setHorizontalAlignment(JLabel.CENTER);
        mensaje = new JLabel("Message: ");
        mensaje.setHorizontalAlignment(JLabel.CENTER);
        ttitulo = new JTextField(30);
        tmensaje = new JTextField(30);

        JPanel panelTitulo = new JPanel();
        panelTitulo.add(titulo);
        panelTitulo.add(ttitulo);

        JPanel panelMensaje = new JPanel();
        panelMensaje.add(mensaje);
        panelMensaje.add(tmensaje);

        JPanel sup = new JPanel(new GridLayout(2, 2, 0, 0));
        sup.add(panelTitulo);
        sup.add(panelMensaje);

        JPanel cen = new JPanel();
        group.add(inf);
        inf.setSelected(true);
        group.add(err);
        group.add(warn);
        inf.setMnemonic(KeyEvent.VK_I);
        cen.add(inf);
        err.setMnemonic(KeyEvent.VK_E);
        cen.add(err);
        warn.setMnemonic(KeyEvent.VK_W);
        cen.add(warn);

        enviar = new JButton("Send");
        JPanel infe = new JPanel();
        infe.add(enviar);

        principal.setBorder(BorderFactory.createTitledBorder(new LineBorder(Color.black), ""));

        principal.add("North", sup);
        principal.add("Center", cen);
        principal.add("South", infe);
        add(principal);
    }
}
