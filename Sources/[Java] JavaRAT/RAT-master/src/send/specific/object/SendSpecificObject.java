package send.specific.object;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Random;
/**
 * 
 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
 *
 */
public class SendSpecificObject {


	

	/**
	 * Fonction qui permet d'envoyer un fichier sur le flux de sortie
	 * @param nomfichier : le nom du fichier (nom sous forme canonique)
	 * @param path       : le chemin dans lequel se trouve le chemin
	 * @param oos 		 : le flux de sortie
	 * @return			 : retourne true si tout s'est bien passés
	 * @throws IOException
	 */
	public static boolean sendTxt(String nomfichier,String path,ObjectOutputStream oos) throws IOException
	{
		
		Path f = Paths.get(path);
		Integer number = new Random().nextInt(2000) + 200;		
		byte[] content = Files.readAllBytes(f);
		oos.writeObject(number);
		oos.flush();
		oos.writeObject(nomfichier);
		oos.flush();
		oos.writeObject(content);
		oos.flush();
		return true;
	}
	
	
}
