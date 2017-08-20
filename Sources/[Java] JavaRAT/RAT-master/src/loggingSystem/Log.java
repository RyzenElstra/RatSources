package loggingSystem;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * 		Classe permet de gérer les différents flux de messages de fonctionnement du keylogger
 * 		@author lh
 *
 */

public class Log
{

	// Parametres :
	// =====================================================================

	private static Path				cheminactuel	= Paths.get("");

	private static File				file;
	private static final String	nomfichier		= cheminactuel.toAbsolutePath()
																		.toString()
																		+ System
																				.getProperty("file.separator")
																		+ "Log"
																		+ System
																				.getProperty("file.separator")
																		+ "log.txt";
	private static PrintWriter		pw;


	// Constructeur :
	// =====================================================================

	public Log()
	{
		super();
		file = new File(nomfichier);

		try
		{
			pw = new PrintWriter(new BufferedWriter(new FileWriter(nomfichier,
					true)));
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



	// Methodes :
	// =====================================================================

	/**
	 * Ajoute au fichier le message string
	 * @param string
	 */
	public void enregistrerFichier(String string)
	{
		synchronized (file)
		{
			pw.println(string);
			pw.flush();
		}
	}

	/*
	 * Ferme le fichier
	 */
	public void fermerFichier()
	{
		pw.flush();
		pw.close();
	}
}