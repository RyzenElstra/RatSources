
/**
 *
 * @author AngelCruel
 */
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class ventanaKeylogger extends JPanel implements ItemListener {

    JButton guardar, salir;
    JTextArea textoIn;
    JCheckBox off;

    public ventanaKeylogger() {
        setLayout(new BorderLayout());
        guardar = new JButton("Save");
        salir = new JButton("STOP Keylogger");
        salir.setForeground(Color.RED);
        textoIn = new JTextArea(25, 80);
        textoIn.setEditable(false);
        textoIn.setLineWrap(true);
        textoIn.setWrapStyleWord(true);
        off = new JCheckBox("OffLine Keylogger");
        off.addItemListener(this);

        add("Center", new JScrollPane(textoIn));

        FlowLayout flow = new FlowLayout();
        JPanel panelInferior = new JPanel(flow);
        panelInferior.add(guardar);
        panelInferior.add(salir);
        panelInferior.add(off);
        add("South", panelInferior);

    }

    @Override
    public void itemStateChanged(ItemEvent e) {
        if (e.getSource() == off) {
            if (off.isSelected()) {
                JOptionPane.showMessageDialog(null, "Only available in Adzok Pro for more information visit: http://adzok.com", "Info", JOptionPane.INFORMATION_MESSAGE);
            };
        }
    }
}
