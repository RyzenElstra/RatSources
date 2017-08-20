package master;

import gui.FenetrePrincipal;
import gui.MJInternalFrame;

import java.awt.EventQueue;
import java.io.IOException;
import java.io.Serializable;
import java.net.Socket;
import java.util.Vector;

public class Compte implements Serializable
{

	// Parametres :
	// =====================================================================

	private static int			COMPTENUMERO		= 1;
	private static final long	serialVersionUID	= 1L;
	private Vector<Connexion>	m_listConnexion;			// Liste des connexions auquel le
	// compte a accès
	private String					_nomCompte;				// Nom Compte
	private FenetrePrincipal	fp;

	
	
	// Constructeur :
	// =====================================================================

	/**
	 * Compte serializable, permet d'enregistrer sa session contenant les esclaves
	 * @param nomCompte	: le nom du compte
	 */
	public Compte(String nomCompte)
	{
		m_listConnexion = new Vector<>();
		_nomCompte = nomCompte;

		EventQueue.invokeLater(new Runnable()
		{
			public void run()
			{
				try
				{
					fp = new FenetrePrincipal(); // Demarre la GUI

				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
			}
		});

	}

	
	
	

	// Accesseurs :
	// =====================================================================

	public FenetrePrincipal getFenetrePrincipale()
	{
		return fp;
	}

	/**
	 * Recupere la liste des connexions
	 * @return liste des connexions
	 */
	public Vector<Connexion> getListConnexion()
	{
		return m_listConnexion;
	}

	// Methodes :
	// =====================================================================

	/**
	 * Methode appelé par une connection quand la connection est interrompu avec l'esclave
	 * Le compte supprime la connection et se charge d'envoyer les informations au modèle
	 * @param co: la connection a supprimer
	 */
	public void removeConnection(Connexion co)
	{
		if (m_listConnexion.contains(co))
		{
			m_listConnexion.removeElement(co);
			try
			{
				Vector<MJInternalFrame> mjIF = fp.getFrameIndexConnection(co);		// Recupere l'ensemble des fenetres ouvertes pour la connection
				for (int i = mjIF.size() - 1; i >= 0; i--)
				{
					MJInternalFrame mj = mjIF.elementAt(i);						// Parcours a l'envers pour pouvoir supprimer les elements
					// Et en meme temps parcourir le vecteur
					fp.deletePublic(mj, -1);									// Supprime les fenetres avec le code -1
				}
				co.get_so().shutdownInput();										// Ferme le socket
				co.get_so().shutdownOutput();
				co.getSo().close();
			}
			catch (IOException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		fp.setJlist(m_listConnexion);											// Met a jour la JList
	}
	
	
	/**
	 * Fonction appelée lors de la connection d'un nouveau esclave
	 * @param so	                   : le socket de connection
	 * @return						   
	 * @throws ClassNotFoundException	
	 * @throws IOException
	 */
	public boolean ajouterSocket(Socket so) throws ClassNotFoundException,
			IOException
	{
		for (Connexion connexion : m_listConnexion)
		{
			if (connexion.getSo() == so)
			{
				Server.m_log.enregistrerFichier("Connexion deja existente");
				return false;
			}
		}

		m_listConnexion.addElement(new Connexion(so, this));
		fp.setJlist(m_listConnexion);
		return true;
	}
}