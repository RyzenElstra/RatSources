package master;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;

public class DeserializerCompte {

	private static ObjectInputStream ois;
	
	/**
	 * Permet de charger un compte
	 * @param args
	 * @return
	 */
	public static Compte charger(String args) {
		Compte compte = null;
		File fichier = new File(args);
		try {
			if (!fichier.canRead()) {
				System.out.println("Problème de fichier\n");
			}
			ois = new ObjectInputStream(new FileInputStream(fichier));
			compte = (Compte) ois.readObject();

		} catch (IOException e) {
			System.out.println(" Erreur lors de la lecture du fichier. ");
		} catch (ClassNotFoundException e) {
			System.out.println(" Erreur d ’objet.");
		}
		return (compte);
	}
}
