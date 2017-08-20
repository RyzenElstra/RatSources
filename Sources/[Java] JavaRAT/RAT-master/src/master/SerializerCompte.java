package master;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

public class SerializerCompte {

	public static void enregistrer(String args, Compte compte) {
		File fichier = new File(args);
		try {
			fichier.createNewFile();
			if (fichier.canWrite()) {
				try {
					ObjectOutputStream oos = new ObjectOutputStream(
							new FileOutputStream(fichier));
					oos.writeObject(compte);
					oos.flush();
					oos.close();
					System.out.println(" Sauvegarde e f f e c tue e ");
				} catch (IOException e) {
					System.out.println(" Erreur " + e.toString());
				}
			}
		} catch (Exception e) {
			System.out.println(" Erreur : " + e.toString());
		}
	}
}
