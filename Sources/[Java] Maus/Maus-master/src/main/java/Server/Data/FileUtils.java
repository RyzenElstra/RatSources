package Server.Data;

import Maus.Maus;

import java.io.*;
import java.net.URISyntaxException;

public class FileUtils {

    /* Pulls files outside of a .jar */
    static public void ExportResource(String resourceName) throws Exception {
        new File(Maus.class.getProtectionDomain().getCodeSource().getLocation().toURI().getPath()).getParentFile().getPath().replace('\\', '/');
        File r = new File(System.getProperty("user.home") + "/Maus/Client/");
        r.mkdir();
        try (InputStream stream = Maus.class.getResourceAsStream(resourceName);
             OutputStream resStreamOut = new FileOutputStream(System.getProperty("user.home") + "/Maus/Client/Client.class")) {
            if (stream == null) {
                throw new Exception("Cannot get resource \"" + resourceName + "\" from Jar file.");
            }
            int readBytes;
            byte[] buffer = new byte[4096];
            while ((readBytes = stream.read(buffer)) > 0) {
                resStreamOut.write(buffer, 0, readBytes);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /* Copies a file to another location */
    public static void copyFile(String filea, String fileb) {
        InputStream inStream;
        OutputStream outStream;

        try {
            File afile = new File(filea);
            File bfile = new File(fileb);

            inStream = new FileInputStream(afile);
            outStream = new FileOutputStream(bfile);

            byte[] buffer = new byte[1024];

            int length;
            //copy the file content in bytes
            while ((length = inStream.read(buffer)) > 0) {
                outStream.write(buffer, 0, length);
            }

            inStream.close();
            outStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /* Deletes temporary files created by Maus */
    public static void deleteFiles() {
        File dir = new File(System.getProperty("user.home").replace("\\", "/") + "/Maus/Client");
        File fil = new File(System.getProperty("user.home").replace("\\", "/") + "/Maus/Client/Client.class");
        try {
            String d = new File(Maus.class.getProtectionDomain().getCodeSource().getLocation().toURI().getPath()).getParentFile().getPath().replace('\\', '/');
            File dir2 = new File(d + "/Client/");
            File fil2 = new File(d + "/Client/Client.class");
            fil2.delete();
            dir2.delete();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        fil.delete();
        dir.delete();
    }
}
