
/**
 *
 * @author AngelCruel
 */
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.*;
import javax.swing.border.*;
import javax.swing.table.*;

public class cliente extends JFrame implements Runnable, ActionListener {

    private JPopupMenu menuContextual;
    private static DefaultTableModel model;
    public static int error = 0;
    private static JTable table;
    private JButton update, reconectar, desconectar, uninstall;
    private static String[] tituloTable;
    private static String[][] datosMaquinas = new String[0][0];
    public int puerto = 0, puerto2 = 0, puerto3 = 0;
    private String pass;
    private TrayIcon trayIcon = null;
    private SystemTray tray;
    private int indice;
    JPanel panel, botones;
    static JTextArea info = new JTextArea(4, 4);
    JButton Puerto, Build, bpass, buy;
    private RecursoClientes recurso;
    private Socket scliente, scliente2, scliente3;
    private ServerSocket servidor, servidor2, servidor3;
    JMenuBar Menu = new JMenuBar();
    JMenu mFile = new JMenu("File");
    JMenuItem exit = new JMenuItem("Exit");
    JMenu mayuda = new JMenu("Help");
    JMenuItem acerca = new JMenuItem("About of..");
    JMenuItem ayuda = new JMenuItem("Help");
    JMenuItem buscar = new JMenuItem("Check for Updates");
    String version = "1.0.0.2";
    int iversion = 1002;
    boolean endh1 = true, endh2 = true, endh3 = true;
    private Thread hilo;
    private puertos puertos;

    public cliente() {
        setIconImage(new ImageIcon(getClass().getResource("resources/icono.png")).getImage());
        addWindowListener(new cerrar(this));
        Menu.add(mFile);
        Menu.add(mayuda);
        mFile.add(exit);
        exit.addActionListener(this);
        mayuda.add(ayuda);
        ayuda.addActionListener(this);
        mayuda.add(buscar);
        buscar.addActionListener(this);
        mayuda.add(acerca);
        acerca.addActionListener(this);
        this.setJMenuBar(Menu);
        crearServidor();

        setTitle("Adzok Open v" + version);
        setSize(640, 480);
        setLocationRelativeTo(null);

        tituloTable = new String[]{"Machine Name", "User Name", "Internal IP", "External IP", "Port", "Version", "Ping"};
        model = new DefaultTableModel(datosMaquinas, tituloTable);
        table = new JTable();
        table.setModel(model);
        table.setSelectionMode(0);
        table.setEnabled(false);
        update = new JButton("Update");
        update.addActionListener(this);
        reconectar = new JButton("Reconnect");
        reconectar.addActionListener(this);
        desconectar = new JButton("Desconnect");
        desconectar.addActionListener(this);
        uninstall = new JButton("Uninstall");
        uninstall.addActionListener(this);

        Build = new JButton("<html>Build<br />Server</html>");
        Build.addActionListener(this);
        Puerto = new JButton("<html>Set<br />Port</html>");
        Puerto.addActionListener(this);
        bpass = new JButton("<html>Set<br />Pass</html>");
        bpass.addActionListener(this);

        buy = new JButton();
        buy.setIcon(new ImageIcon(getClass().getResource("resources/buy.png")));
        buy.setBorder(null);
        buy.setFocusable(false);
        buy.setContentAreaFilled(false);
        buy.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        buy.setBorderPainted(false);
        buy.addActionListener(this);

        crearPanel();

        menuContextual = new JPopupMenu();
        menuContextual.add(update);
        menuContextual.add(reconectar);
        menuContextual.add(desconectar);
        menuContextual.add(uninstall);

        table.addMouseListener(
                new MouseAdapter() {
            public void mousePressed(MouseEvent evento) {
                checkForTriggerEvent(evento);
            }

            public void mouseReleased(MouseEvent evento) {
                int row = table.rowAtPoint(evento.getPoint());
                if (row != -1) {
                    table.changeSelection(row, 0, false, false);
                    checkForTriggerEvent(evento);
                } else {
                    try {
                        table.clearSelection();
                        checkForTriggerEvent(null);
                    } catch (Exception ex) {
                        System.out.println("No a seleccionado nada");
                    }
                }
                indice = row;
            }

            private void checkForTriggerEvent(MouseEvent evento) {
                if (evento.isPopupTrigger()) {
                    menuContextual.show(evento.getComponent(), evento.getX(), evento.getY());
                }
            }
        });

        table.addMouseListener(new MouseAdapter() {
            public void mouseClicked(MouseEvent evento) {
                if (evento.getClickCount() == 2 && evento.getButton() == evento.BUTTON1) {
                    ManejadorCliente manejador = recurso.getManejadorCliente(indice);
                    manejador.guiOpciones.setVisible(true);
                    manejador.guiOpciones.opciones.setSelectedIndex(0);
                }
            }
        });

        setDefaultCloseOperation(JFrame.ICONIFIED);
        cargarSysTray();
        tray.remove(trayIcon);
        setVisible(true);
    }

    public void funIniciar() {
        hilo = new Thread(this);
        hilo.start();
    }

    public void mostrar() {
        setVisible(true);
        tray.remove(trayIcon);
        setExtendedState(JFrame.NORMAL);
    }

    public void leerProp() {
        Properties dbProps;
        FileInputStream file;
        try {
            file = new FileInputStream("info.ini");
            dbProps = new Properties();
            dbProps.load(file);
            file.close();

            puerto = Integer.parseInt(dbProps.getProperty("puerto"));
            puerto2 = Integer.parseInt(dbProps.getProperty("puerto2"));
            puerto3 = Integer.parseInt(dbProps.getProperty("puerto3"));
            pass = dbProps.getProperty("pass");
        } catch (Exception e) {
            System.out.println("El archivo no ha sido cargado exitosamente");
        }
    }

    public void escribirProp() {
        Properties dbProps;
        FileInputStream file;
        try {
            file = new FileInputStream("info.ini");
            dbProps = new Properties();
            dbProps.load(file);
            file.close();

            dbProps.setProperty("puerto", String.valueOf(puerto));
            dbProps.setProperty("puerto2", String.valueOf(puerto2));
            dbProps.setProperty("puerto3", String.valueOf(puerto3));
            dbProps.setProperty("pass", pass);

            dbProps.store(new FileOutputStream("info.ini"), null);
        } catch (Exception e) {
            e.printStackTrace();
        }
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

    public void crearServidor() {
        try {
            recurso = RecursoClientes.getInstance();
            try {
                Scanner leer = new Scanner(new File("info.ini"));
            } catch (FileNotFoundException ex) {
                Formatter archivo = new Formatter("info.ini");
                String datos = "puerto = 7777\n\rpuerto2= 0\n\rpuerto3= 0\n\rpass = ";
                archivo.format("%s", datos);
                archivo.flush();
                archivo.close();
            }

            leerProp();
            puertos = new puertos(puerto, puerto2, puerto3);
            puertos.aceptar.addActionListener(this);
            puertos.cancelar.addActionListener(this);
            servidor = new ServerSocket(puerto);
            if (puerto2 != 0) {
                servidor2 = new ServerSocket(puerto2);
                hiloservidor2 hs2 = new hiloservidor2();
                hs2.start();
            } else if (puerto3 != 0) {
                servidor3 = new ServerSocket(puerto3);
                hiloservidor3 hs3 = new hiloservidor3();
                hs3.start();
            }
            info.append("Listening ports: " + puerto + "," + puerto2 + "," + puerto3);
        } catch (UnknownHostException ex) {
            System.out.println("UnknownHostException");
        } catch (IOException ex) {
            System.out.println("IOException");
            JOptionPane.showMessageDialog(null, "The configured ports are in use", "Port Error", JOptionPane.INFORMATION_MESSAGE);
            System.exit(-1);
        }
    }

    public void crearPanel() {
        JScrollPane scroll = new JScrollPane();
        scroll.setViewportView(table);

        JPanel medio = new JPanel(new BorderLayout());
        medio.add("Center", scroll);
        info.setEditable(false);
        info.setRows(8);
        medio.add("South", new JScrollPane(info));

        add(medio, BorderLayout.CENTER);

        panel = new JPanel(new BorderLayout());
        FlowLayout flow = new FlowLayout();
        flow.setAlignment(FlowLayout.LEFT);
        botones = new JPanel(flow);

        TitledBorder border = new TitledBorder(new LineBorder(Color.black), "", TitledBorder.RIGHT, TitledBorder.BOTTOM);

        panel.add("Center", new JSeparator());
        panel.add("South", botones);
        botones.add(buy);
        botones.add(Build);
        botones.add(Puerto);
        botones.add(bpass);
        add(panel, BorderLayout.SOUTH);
    }

    public void run() {
        while (endh1) {
            try {
                scliente = servidor.accept();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
            hiloConectar h = new hiloConectar(scliente);
            h.start();
        }
    }

    public void funConectado(String usuario, String ip) {
        Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
        conectado con = new conectado(screenSize, usuario, ip);
        Thread hilocon = new Thread(con);
        hilocon.start();
    }

    public static void actualizarLista() {
        RecursoClientes temp = RecursoClientes.getInstance();
        model = new DefaultTableModel(datosMaquinas, tituloTable);
        for (int i = 0; i < temp.size(); i++) {
            ManejadorCliente manejador = temp.getManejadorCliente(i);
            Object[] newRow = {manejador.getNombre(), manejador.getNombreUsuario(),
                manejador.getIPinterna(), manejador.getIPexterna(), manejador.getPuerto(),
                manejador.getVersion(), manejador.getPing()};
            model.addRow(newRow);
        }
        table.setModel(model);
    }

    public boolean mensajeOcupado(boolean ocupado, String nombre, String IP) {
        if (ocupado) {
            JOptionPane.showMessageDialog(null, "Is busy on another option, stop the active option."
                    + "\nMultithreading is available in Adzok Pro."
                    + "\nAdzok Pro is available in: http://adzok.com",
                    nombre + " - " + IP, JOptionPane.INFORMATION_MESSAGE);
            return true;
        }
        return false;
    }

    public void actionPerformed(ActionEvent e) {

        if (e.getSource() == update) {
            menuContextual.setVisible(false);
            ManejadorCliente manejador = recurso.getManejadorCliente(indice);
            if (mensajeOcupado(manejador.enProceso, manejador.getNombre(), manejador.getIPexterna())) {
                return;
            }

            manejador.enProceso = manejador.mostrarVentanaUpdate();
        } else if (e.getSource() == reconectar) {
            menuContextual.setVisible(false);
            ManejadorCliente manejador = recurso.getManejadorCliente(indice);
            if (mensajeOcupado(manejador.enProceso, manejador.getNombre(), manejador.getIPexterna())) {
                return;
            }

            manejador.mostrarVentanaReconectar();
        } else if (e.getSource() == desconectar) {
            menuContextual.setVisible(false);
            ManejadorCliente manejador = recurso.getManejadorCliente(indice);
            if (mensajeOcupado(manejador.enProceso, manejador.getNombre(), manejador.getIPexterna())) {
                return;
            }
            manejador.desconectar();
        } else if (e.getSource() == uninstall) {
            menuContextual.setVisible(false);
            ManejadorCliente manejador = recurso.getManejadorCliente(indice);
            if (mensajeOcupado(manejador.enProceso, manejador.getNombre(), manejador.getIPexterna())) {
                return;
            }

            manejador.enProceso = manejador.mostrarVentanaUninstall();
        }  else if (e.getSource() == buy) {
            try {
                try {
                    Desktop.getDesktop().browse(new URI("http://adzok.com/?pg=comprar"));
                } catch (IOException ex) {
                    Logger.getLogger(cliente.class.getName()).log(Level.SEVERE, null, ex);
                }
            } catch (URISyntaxException ex) {
                Logger.getLogger(cliente.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (e.getSource() == Build) {
            new MakeJar();
        }  else if (e.getSource() == puertos.aceptar) {
            puertos.setVisible(false);
            puerto = Integer.valueOf(puertos.tpuerto.getText());
            puerto2 = Integer.valueOf(puertos.tpuerto2.getText());
            puerto3 = Integer.valueOf(puertos.tpuerto3.getText());

            /*
             * try { if (puerto != Integer.valueOf(puertos.tpuerto.getText())) {
             * servidor.close(); servidor = new ServerSocket(puerto); } if
             * (control == true) { servidor2 = new ServerSocket(puerto2);
             * hiloservidor2 hs2 = new hiloservidor2(); hs2.start(); control =
             * false; } if (!(puerto2 ==
             * Integer.valueOf(puertos.tpuerto2.getText())) && puerto2 != 0) {
             * endh2 = false; servidor2 = new ServerSocket(puerto2);
             * hiloservidor2 hs2 = new hiloservidor2(); endh2 = true;
             * hs2.start(); } if (control2 == true) { servidor3 = new
             * ServerSocket(puerto3); hiloservidor3 hs3 = new hiloservidor3();
             * hs3.start(); control = false; } if (!(puerto3 ==
             * Integer.valueOf(puertos.tpuerto3.getText())) && puerto3 != 0 &&
             * servidor3.isClosed()) { servidor3.close(); servidor3 = new
             * ServerSocket(puerto3); } } catch (IOException ex) {
             * Logger.getLogger(cliente.class.getName()).log(Level.SEVERE, null,
             * ex);
             }
             */

            escribirProp();
            info.append("\nWill change ports: " + puerto + "," + puerto2 + "," + puerto3);
            JOptionPane.showMessageDialog(this, "You need to restart the application\nto update the new ports", "Information", JOptionPane.INFORMATION_MESSAGE);
        } else if (e.getSource() == Puerto) {
            puertos.setVisible(true);
        } else if (e.getSource() == puertos.cancelar) {
            puertos.setVisible(false);
        } else if (e.getSource() == bpass) {
            String temp;
            temp = JOptionPane.showInputDialog(this, "Enter the new password", "Change Password", JOptionPane.INFORMATION_MESSAGE);
            if (!temp.equals(null)) {
                pass = temp;
                escribirProp();
            }
        } else if (e.getSource() == exit) {
            menuContextual.setVisible(false);
            System.exit(0);
        } else if (e.getSource() == acerca) {
            menuContextual.setVisible(false);
            new Acercade();
        } else if (e.getSource() == ayuda) {
            menuContextual.setVisible(false);
            new Ayuda();
        } else if (e.getSource() == buscar) {
            menuContextual.setVisible(false);
            Thread h = new Thread(new hiloBuscar());
            h.start();
        }
    }

    private void addManejadorCliente(ManejadorCliente manejador) {
        recurso.addManejadorCliente(manejador);
    }

    public void desconectar() {
        try {
            servidor.close();
            servidor2.close();
            servidor3.close();
        } catch (IOException ex) {
            ex.printStackTrace();
            servidor = null;
            servidor2 = null;
            servidor3 = null;
        }
        endh1 = false;
        endh2 = false;
        endh3 = false;
        hilo = null;
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
                Logger.getLogger(cliente.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    class hiloservidor2 extends Thread {

        public void run() {
            while (endh2) {
                try {
                    scliente2 = servidor2.accept();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
                hiloConectar h = new hiloConectar(scliente2);
                h.start();
            }
        }
    }

    class hiloservidor3 extends Thread {

        public void run() {
            while (endh3) {
                try {
                    scliente3 = servidor3.accept();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
                hiloConectar h = new hiloConectar(scliente3);
                h.start();
            }
        }
    }

    class hiloConectar extends Thread implements ActionListener {

        private boolean conectado = false;
        Ingreso ingreso;
        private Socket cliente;
        private boolean ok = false;
        private String nombre, nombreUsuario;
        private String ipExterna, ipInterna;
        private String versionCliente, ping;
        int puertoCliente = 0;
        private ObjectOutputStream salida;
        private ObjectInputStream entrada;

        public hiloConectar(Socket socket) {
            ingreso = new Ingreso();
            ingreso.aceptar.addActionListener(this);
            ingreso.cancelar.addActionListener(this);
            cliente = socket;
        }

        public void run() {
            try {
                salida = new ObjectOutputStream(cliente.getOutputStream());
                salida.flush();
                entrada = new ObjectInputStream(cliente.getInputStream());

                String ver = (String) descargarInformacion();

                if (ver.equals("v0.0.1")) {
                    gestionarMensaje("Mensaje", pass);

                    nombre = (String) descargarInformacion();
                    if (nombre.equals("Nuevo")) {
                        ingreso.setVisible(true);
                        ingreso.setAlwaysOnTop(true);
                        //PARA LA ESPERA
                        descargarInformacion();
                    }
                    if (ok) {
                        nombre = (String) descargarInformacion();
                    }

                    nombreUsuario = (String) descargarInformacion();
                    ipInterna = (String) descargarInformacion();
                    ipExterna = (String) descargarInformacion();
                    puertoCliente = (Integer) descargarInformacion();
                    versionCliente = (String) descargarInformacion();
                    ping = (String) descargarInformacion();
                    conectado = true;
                } else if (ver.equals("v0.0.2")) {
                    funConc_002();
                }

            } catch (Exception e) {
                System.out.println("Error estableciendo conexion");
                conectado = false;
                ok = false;
            }

            if (conectado) {
                ManejadorCliente manejador = new ManejadorCliente(scliente, entrada, salida);
                manejador.setNombre(nombre);
                manejador.setNombreUsuario(nombreUsuario);
                manejador.setIPexterna(ipExterna);
                manejador.setIPinterna(ipInterna);
                manejador.setPuerto(puertoCliente);
                manejador.setVersion(versionCliente);
                manejador.setPing(ping);
                addManejadorCliente(manejador);
                manejador.start();

                funConectado(nombreUsuario, ipExterna);
                actualizarLista();
            }
            ok = false;
        }

        public void funConc_002() {
            gestionarMensaje("Mensaje", pass);
            
            if (!((String)descargarInformacion()).equals("good")) {
                System.out.println("Contraseña incorrecta");
            	conectado = false;
            	return;
            }
            		
            nombre = (String) descargarInformacion();
            nombreUsuario = (String) descargarInformacion();
            ipInterna = (String) descargarInformacion();
            ipExterna = (String) descargarInformacion();
            puertoCliente = (Integer) descargarInformacion();
            versionCliente = (String) descargarInformacion();
            ping = (String) descargarInformacion();
            conectado = true;
        }

        @Override
        public void actionPerformed(ActionEvent e) {
            if (e.getSource() == ingreso.aceptar) {
                ok = true;
                ingreso.setVisible(false);
                if (ingreso.tnombre.getText().equals("")) {
                    gestionarMensaje("Mensaje", "null");
                } else {
                    gestionarMensaje("Mensaje", ingreso.tnombre.getText());
                }
            } else if (e.getSource() == ingreso.cancelar) {
                ingreso.setVisible(false);
                ok = true;
                gestionarMensaje("Mensaje", "null");
            }
        }

        private void gestionarMensaje(String tipo, Object informacion) {
            mensaje mensaje = new mensaje();
            mensaje.setTipo((String) tipo);
            if (tipo.equals("Mensaje")) {
                mensaje.setMensaje((String) informacion);
            } else if (tipo.equals("Dato")) {
                mensaje.setDato((Integer) informacion);
            }

            enviarMensaje(mensaje);
        }

        public boolean enviarMensaje(mensaje m) {
            try {
                salida.writeObject(m);
                salida.flush();
            } catch (IOException ex) {
                return false;
            }

            return true;
        }

        private Object descargarInformacion() {
            Object objeto = null;
            mensaje mens = null;
            try {
                mens = (mensaje) entrada.readObject();
                if (mens.getTipo().equals("Mensaje")) {
                    objeto = mens.getMensaje();
                } else if (mens.getTipo().equals("Dato")) {
                    objeto = mens.getDato();
                }

            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
            } catch (IOException ex) {
                ex.printStackTrace();
            }

            return objeto;
        }
    }

    class Acercade extends JFrame implements ActionListener {

        JButton aceptar;
        JLabel autor;
        JLabel lversion;
        JLabel titlePag;
        JLabel titleDes;
        JButton descarga, pagina;

        public Acercade() {
            getContentPane().setBackground(Color.DARK_GRAY);
            setTitle("About of...");
            setSize(330, 320);
            setResizable(false);
            setLocationRelativeTo(null);
            setIconImage(new ImageIcon(getClass().getResource("resources/icono.png")).getImage());

            aceptar = new JButton("Accept");
            aceptar.setMnemonic('A');
            aceptar.addActionListener(this);
            autor = new JLabel("<html><b>Author:</b> AngelCruel</html>", JLabel.CENTER);
            autor.setFont(new Font("Serif", Font.PLAIN, 16));
            titlePag = new JLabel("WebSite:", JLabel.CENTER);
            titlePag.setFont(new Font("Serif", Font.BOLD, 16));
            pagina = new JButton("<html><a href=\"http://adzok.com\">http://adzok.com</a></html>");
            pagina.setBorderPainted(false);
            pagina.setFocusable(false);
            pagina.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
            pagina.setFont(new Font("Serif", Font.BOLD, 16));
            pagina.addActionListener(this);
            titleDes = new JLabel("Download Source Code:", JLabel.CENTER);
            titleDes.setFont(new Font("Serif", Font.BOLD, 16));
            descarga = new JButton("<html><a href=\"http://sourceforge.net/projects/adzok\">http://sourceforge.net/projects/adzok</a></html>");
            descarga.setBorderPainted(false);
            descarga.setFocusable(false);
            descarga.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
            descarga.setFont(new Font("Serif", Font.BOLD, 16));
            descarga.addActionListener(this);
            lversion = new JLabel("<html><b>Version: </b>" + version + "</html>", JLabel.CENTER);
            lversion.setFont(new Font("Serif", Font.PLAIN, 16));

            JPanel datos = new JPanel(new GridLayout(7, 1, 5, 5));
            datos.add(autor);
            datos.add(titlePag);
            datos.add(pagina);
            datos.add(titleDes);
            datos.add(descarga);
            datos.add(lversion);

            getContentPane().add("Center", datos);
            JPanel boton = new JPanel();
            boton.setBackground(Color.DARK_GRAY);
            boton.add(aceptar);
            getContentPane().add("South", boton);
            JPanel ptitulo = new JPanel(new BorderLayout());
            JLabel titulo = new JLabel("A d z o k", JLabel.CENTER);
            titulo.setFont(new Font("Serif", Font.ITALIC, 32));
            titulo.setForeground(Color.DARK_GRAY);
            JLabel titulo2 = new JLabel("O p e n", JLabel.CENTER);
            titulo2.setFont(new Font("Serif", Font.ITALIC, 32));
            titulo2.setForeground(Color.DARK_GRAY);
            ptitulo.setBackground(Color.BLACK);
            ptitulo.add("North", titulo);
            ptitulo.add("Center", titulo2);
            JPanel raya = new JPanel();
            raya.setBackground(Color.DARK_GRAY);
            ptitulo.add("South", raya);
            getContentPane().add("North", ptitulo);

            setVisible(true);
        }

        public void actionPerformed(ActionEvent e) {
            if (e.getSource() == aceptar) {
                setVisible(false);
            }
            if (e.getSource() == descarga) {
                try {
                    Desktop.getDesktop().browse(new URI("http://sourceforge.net/projects/adzok"));
                } catch (IOException ex) {
                    Logger.getLogger(cliente.class.getName()).log(Level.SEVERE, null, ex);
                } catch (URISyntaxException ex) {
                    Logger.getLogger(cliente.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (e.getSource() == pagina) {
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

    class Ayuda extends JFrame implements ActionListener {

        JButton aceptar;
        JTextArea ayuda;

        public Ayuda() {
            getContentPane().setBackground(Color.LIGHT_GRAY);
            setTitle("Help Adzok Open");
            setSize(640, 480);
            setLocationRelativeTo(null);
            setIconImage(new ImageIcon(getClass().getResource("resources/icono.png")).getImage());

            aceptar = new JButton("Accept");
            aceptar.setMnemonic('A');
            aceptar.addActionListener(this);

            ayuda = new JTextArea("\nAdzok Open es monotarea, esto significa que para cambiar de una opción a otra primero debe"
                    + " detener la opción activa y/ó esperar a que termine la transferencia. En la \"función subir y bajar archivos\""
                    + " no funciona el boton detener, solo queda esperar a que termine la transferencia."
                    + "\n\nAl ser monotarea Adzok Open tiene ciertas limitaciones: "
                    + "\n- Limite de 56 MB al subir y bajar archivos."
                    + "\n- No se puede cancelar una transferencia."
                    + "\n- No funcionan las barras de progreso."
                    + "\n"
                    + "\nREMOTE SHELL:\n"
                    + "\nPara ejecutar aplicaciones desde la función Remote Shell hay 2 formas:\n"
                    + "\n- exe nombrejecutable (si esta en el mismo directorio que el ejecutable)."
                    + "\n- exed direccionejecutable (para ejecutar un archivo en la direccion que se ingrese).\n"
                    + "\nSi se hace de esa forma no se quedara bloqueado la shell remota del servidor esperando "
                    + "que se cierre la aplicaión ejecutada en el servidor remoto para continuar."
                    + "\n\nNota: No poner comandos que requieran confirmación por que no lo soporta."
                    + "\n"
                    + "\nSUBIR Y BAJAR ARCHIVOS:\n"
                    + "\n- \"Remote Dir:\" aca se ingresa la dirección del archivo remoto que se quiere bajar. "
                    + "Los archivos bajados del server remoto se guardan en una carpeta con el mismo nombre que "
                    + "tiene el server, esta carpeta se encuentra en el mismo directorio que se ejecuta el cliente (Adzok_Open_vX.X.X.X.jar).\n"
                    + "\n- Los archivos subidos al server remoto se guardan en la direción "
                    + "que se ingresa en \"Destination Dir:\". Si se deja en blanco se subira a la "
                    + "carpeta TEMP del usuario activo."
                    + "\n");
            ayuda.setFont(new Font("Serif", Font.BOLD, 16));
            ayuda.setLineWrap(true);
            ayuda.setWrapStyleWord(true);
            ayuda.setEditable(false);
            JPanel datos = new JPanel(new GridLayout(1, 1));
            datos.setBackground(Color.LIGHT_GRAY);
            datos.add(new JScrollPane(ayuda));

            getContentPane().add("Center", datos);
            JPanel boton = new JPanel();
            boton.setBackground(Color.LIGHT_GRAY);
            boton.add(aceptar);
            getContentPane().add("South", boton);
            JPanel ptitulo = new JPanel(new BorderLayout());
            JLabel titulo = new JLabel("A d z o k", JLabel.CENTER);
            titulo.setFont(new Font("Serif", Font.ITALIC, 32));
            titulo.setForeground(Color.DARK_GRAY);
            JLabel titulo2 = new JLabel("O p e n", JLabel.CENTER);
            titulo2.setFont(new Font("Serif", Font.ITALIC, 32));
            titulo2.setForeground(Color.DARK_GRAY);
            ptitulo.setBackground(Color.BLACK);
            ptitulo.add("North", titulo);
            ptitulo.add("Center", titulo2);
            JPanel raya = new JPanel();
            raya.setBackground(Color.DARK_GRAY);
            ptitulo.add("South", raya);
            getContentPane().add("North", ptitulo);

            setVisible(true);
        }

        public void actionPerformed(ActionEvent e) {
            if (e.getSource() == aceptar) {
                setVisible(false);
            }
        }
    }

    class hiloBuscar extends Thread {

        public void run() {
            String ver = null;
            try {
                URL url = new URL("http://adzok.com/version.txt");
                BufferedReader stream = new BufferedReader(new InputStreamReader(url.openStream()));
                ver = stream.readLine();
                stream.close();

                if (Integer.valueOf(ver) > iversion) {
                    int opc = JOptionPane.showConfirmDialog(null, "New version is available free\n ï¿½Want to download??", "Download", JOptionPane.OK_CANCEL_OPTION);
                    if (opc == JOptionPane.OK_OPTION) {
                        try {
                            try {
                                Desktop.getDesktop().browse(new URI("http://sourceforge.net/projects/adzok"));
                            } catch (IOException ex) {
                                Logger.getLogger(cliente.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        } catch (URISyntaxException ex) {
                            Logger.getLogger(cliente.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                } else {
                    JOptionPane.showMessageDialog(null, "Not found a new version of this software", "Download", WIDTH);
                }
            } catch (MalformedURLException ex) {
                ex.printStackTrace();
            } catch (IOException ex) {
                JOptionPane.showMessageDialog(null, "Sorry Server Web unavailable", "Download", WIDTH);
            }
        }
    }
}
