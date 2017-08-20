
/**
 *
 * @author AngelCruel
 */
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class ventanaCommand extends JPanel {
    
    JButton enviar, salir;
    JTextField textoOut;
    JTextArea textoIn;
    
    public ventanaCommand() {
        setLayout(new BorderLayout());
        
        enviar = new JButton("Send");
        salir = new JButton("STOP Remote Shell");
        salir.setForeground(Color.RED);
        textoIn = new JTextArea(30, 30);
        textoIn.setEditable(false);
        add("Center", new JScrollPane(textoIn));
        textoOut = new JTextField(50);
        
        FlowLayout flow = new FlowLayout();
        JPanel panelInferior = new JPanel(flow);
        panelInferior.add(textoOut);
        panelInferior.add(enviar);
        panelInferior.add(salir);
        add("South", panelInferior);
    }
}
