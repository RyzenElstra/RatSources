
/**
 *
 * @author AngelCruel
 */
import java.awt.*;
import javax.swing.*;
import javax.swing.event.*;

public class guiOpciones extends JFrame {

    JList opciones;
    DefaultListModel listmodel;
    ventanaEscritorio ventana;
    ventanaCommand command;
    ventanaExplorador explorador;
    ventanaArchivo venArchivo;
    ventanaKeylogger keylogger;
    ventanaCamera cam;
    ventanaProcesos process;
    ventanaMensajes mensajes;
    ventanaLoadShell shell;
    ventanaInformation info;
    ventanaSendKeys keys;
    ventanaClipBoard clipboard;
    ventanaFun fun;
    JPanel tabbedList;
    CardLayout cardLayout;

    public guiOpciones() {
        setSize(1024, 728);

        consGUI();

        setLocationRelativeTo(null);
        setVisible(false);
    }

    public void consGUI() {
        setLayout(new BorderLayout());

        opciones = new JList();
        listmodel = new DefaultListModel();
        listmodel.addElement("● Remote Desktop");
        listmodel.addElement("● Remote Shell");
        listmodel.addElement("● File Browser");
        listmodel.addElement("● Upload and Download");
        listmodel.addElement("● Keylogger");
        listmodel.addElement("● Send Messages");
        listmodel.addElement("● Camera and Microphone");
        listmodel.addElement("● Process List");
        listmodel.addElement("● Load and Run Script");
        listmodel.addElement("● Information System");
        listmodel.addElement("● Send Keys");
        listmodel.addElement("● Clipboard");
        listmodel.addElement("● Fun");
        opciones.setModel(listmodel);
        JScrollPane listScroller = new JScrollPane(opciones);
        add(listScroller, "West");

        tabbedList = new JPanel();
        cardLayout = new CardLayout();
        tabbedList.setLayout(cardLayout);

        ventana = new ventanaEscritorio();
        tabbedList.add("Remote Desktop", ventana);
        command = new ventanaCommand();
        tabbedList.add("Remote Shell", command);
        explorador = new ventanaExplorador();
        tabbedList.add("File Browser", explorador);
        venArchivo = new ventanaArchivo();
        tabbedList.add("Upload and Download", venArchivo);
        keylogger = new ventanaKeylogger();
        tabbedList.add("Keylogger", keylogger);
        mensajes = new ventanaMensajes();
        tabbedList.add("Send Messages", mensajes);
        cam = new ventanaCamera();
        tabbedList.add("Camera and Microphone", cam);
        process = new ventanaProcesos();
        tabbedList.add("Process List", process);
        shell = new ventanaLoadShell();
        tabbedList.add("Load and Run Script", shell);
        info = new ventanaInformation();
        tabbedList.add("Information System", info);
        keys = new ventanaSendKeys();
        tabbedList.add("Send Keys", keys);
        clipboard = new ventanaClipBoard();
        tabbedList.add("Clipboard", clipboard);
        fun = new ventanaFun();
        tabbedList.add("Fun", fun);
        add(tabbedList, "Center");
    }
}
