
/**
 *
 * @author AngelCruel
 */
import java.awt.Color;
import java.awt.GridLayout;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

public class ventanaFun extends JPanel {

    JRadioButton apagar, reiniciar;
    ButtonGroup group = new ButtonGroup();
    JLabel tiempo, visit, shell;
    JTextField tseg, mensaje, textVisit, textShell;
    JCheckBox mostrar, forzar;
    JButton shutdown, cancel, buttonVisit, buttonShell;

    public ventanaFun() {
        JPanel panelApagar = new JPanel(new GridLayout(9, 1));
        apagar = new JRadioButton("Apagar Maquina");
        reiniciar = new JRadioButton("Reiniciar Maquina");
        group.add(apagar);
        group.add(reiniciar);
        tiempo = new JLabel("Tiempo de espera (segundo):");
        tseg = new JTextField();
        mostrar = new JCheckBox("Mostrar mensaje");
        mensaje = new JTextField();
        forzar = new JCheckBox("Forzar apagado(cerrar todas las aplicaciones)");
        shutdown = new JButton("Apagar");
        cancel = new JButton("Cancelar Apagado");

        panelApagar.add(apagar);
        panelApagar.add(reiniciar);
        panelApagar.add(tiempo);
        panelApagar.add(tseg);
        panelApagar.add(mostrar);
        panelApagar.add(mensaje);
        panelApagar.add(forzar);
        panelApagar.add(shutdown);
        panelApagar.add(cancel);
        TitledBorder borderRemoto = new TitledBorder(new LineBorder(Color.BLACK), "Apagado Programado", TitledBorder.LEFT, TitledBorder.DEFAULT_POSITION);
        panelApagar.setBorder(borderRemoto);
        add(panelApagar);

        JPanel visitWEB = new JPanel(new GridLayout(3, 1));
        visit = new JLabel("Ingrese aqui la pagina WEB a visitar:");
        textVisit = new JTextField();
        buttonVisit = new JButton("Visitar pagina WEB");
        visitWEB.add(visit);
        visitWEB.add(textVisit);
        visitWEB.add(buttonVisit);
        TitledBorder borderWEB = new TitledBorder(new LineBorder(Color.BLACK), "Visitar WEB", TitledBorder.LEFT, TitledBorder.DEFAULT_POSITION);
        visitWEB.setBorder(borderWEB);
        add(visitWEB);

        JPanel panelShell = new JPanel(new GridLayout(3, 1));
        shell = new JLabel("Ingrese aqui el comando a ejecutar:");
        textShell = new JTextField();
        buttonShell = new JButton("Ejecutar comando");
        panelShell.add(shell);
        panelShell.add(textShell);
        panelShell.add(buttonShell);
        TitledBorder borderShell = new TitledBorder(new LineBorder(Color.BLACK), "Ejecutar Shell", TitledBorder.LEFT, TitledBorder.DEFAULT_POSITION);
        panelShell.setBorder(borderShell);
        add(panelShell);
    }
}
