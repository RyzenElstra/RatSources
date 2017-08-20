
/**
 *
 * @author AngelCruel
 */
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.security.*;
import java.util.jar.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.ZipEntry;
import javax.crypto.*;
import javax.crypto.spec.*;
import javax.swing.*;

public class puertos extends JFrame {

    JPanel panel, botones;
    JButton aceptar, cancelar;
    JLabel puerto, puerto2, puerto3;
    JTextField tpuerto, tpuerto2, tpuerto3;

    public puertos(int p, int p2, int p3) {
    	setIconImage(new ImageIcon(getClass().getResource("resources/icono.png")).getImage());
        setTitle("Set Ports");
        setSize(250, 250);
        setResizable(false);
        setLocationRelativeTo(null);

        panel = new JPanel(new GridLayout(6, 1, 5, 5));
        panel.setBorder(BorderFactory.createEmptyBorder(5, 5, 5, 5));

        puerto = new JLabel("Port 1: ");
        puerto.setFont(new Font("Serif", Font.BOLD, 20));
        panel.add(puerto);
        tpuerto = new JTextField(30);
        tpuerto.setText(String.valueOf(p));
        panel.add(tpuerto);

        puerto2 = new JLabel("Port 2:");
        puerto2.setFont(new Font("Serif", Font.BOLD, 20));
        panel.add(puerto2);
        tpuerto2 = new JTextField(30);
        tpuerto2.setText(String.valueOf(p2));
        panel.add(tpuerto2);

        puerto3 = new JLabel("Port 3: ");
        puerto3.setFont(new Font("Serif", Font.BOLD, 20));
        panel.add(puerto3);
        tpuerto3 = new JTextField(30);
        tpuerto3.setText(String.valueOf(p3));
        panel.add(tpuerto3);

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
        setVisible(false);
    }
}
