package master;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;

import loggingSystem.Log;

/**
 * Classe principale
 * @author lh
 *
 */
public class Server extends Thread
{
	// Parametres :
	// =====================================================================

	private static Compte		m_compte;
	public static Log				m_log;
	private static final int	m_PORT	= 443;
	private Vector<Socket>		m_listConnexion;
	private ServerSocket			m_serverSocket;

	
	public static void main(String args[])
	{
		Server server = new Server();
		server.run();
	}

	// Constructeur :
	// =====================================================================

	public Server()
	{
		m_log = new Log();
		initialiserCompte();
		m_listConnexion = new Vector<Socket>();

	}

	// Methodes :
	// =====================================================================

	/**
	 * Instancie un nouveau compte, peut etre utilisé pour changer le nom du compte
	 */
	public void initialiserCompte()
	{
		String compte="Compte";
		m_log.enregistrerFichier("********************** Nouveau Compte :"
				+ compte);
		m_compte = new Compte(compte); /*
													* DeserializerCompte.charger(compte)
													*/

	}

	
	/**
	 * Ouvre un serveur et attend des nouvelles connections
	 */
	@Override
	public void run()
	{
		Socket s = null;
		try
		{
			m_serverSocket = new ServerSocket(m_PORT);
			if (m_serverSocket.isClosed())
				return;
			//	Thread.sleep(1000);
			while (true)
			{
				s = m_serverSocket.accept();
				validerConnexion(s);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	private boolean validerConnexion(Socket s) throws ClassNotFoundException,
			IOException
	{
		if (m_compte.ajouterSocket(s))
			m_listConnexion.addElement(s);
		return true;
	}

}
