package gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.swing.JFileChooser;
import javax.swing.filechooser.FileFilter;

import master.Connexion;
import constante.Constante;

/**
/* Classe Héritant de MJinternalFrame qui ouvre une JFileChooser qui choisit quel fichier envoyé sur le fichier de l'esclave
/* Si un CMD a déjà été ouvert, l'envoi dans le dossier actuelle du CMD 
/* @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
/*/
public class MFileInternalFrame extends MJInternalFrame
{

	class ExtensionFileFilter extends FileFilter
	{
		String	description;

		String	extensions[];

		public ExtensionFileFilter(String description, String extension)
		{
			this(description, new String[]
			{ extension });
		}

		public ExtensionFileFilter(String description, String extensions[])
		{
			if (description == null)
			{
				this.description = extensions[0] + "{ " + extensions.length + "} ";
			}
			else
			{
				this.description = description;
			}
			this.extensions = (String[]) extensions.clone();
			toLower(this.extensions);
		}

		public boolean accept(File file)
		{
			if (file.isDirectory())
			{
				return true;
			}
			else
			{
				String path = file.getAbsolutePath().toLowerCase();
				for (int i = 0, n = extensions.length; i < n; i++)
				{
					String extension = extensions[i];
					if ((path.endsWith(extension) && (path.charAt(path.length()
							- extension.length() - 1)) == '.')) { return true; }
				}
			}
			return false;
		}

		public String getDescription()
		{
			return description;
		}

		private void toLower(String array[])
		{
			for (int i = 0, n = array.length; i < n; i++)
			{
				array[i] = array[i].toLowerCase();
			}
		}
	}

	/**
	 * Fenetre héritant de MJInternalFrame, ouvre une fenetre permettant de choisir un fichier à envoyer
	 * @param title
	 * @param connexion
	 * @param nframe
	 */
	public MFileInternalFrame(String title, final Connexion connexion, int nframe)
	{
		super(title, connexion, nframe);
		JFileChooser fileChooser = new JFileChooser();
		fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
		FileFilter jpegFilter = new ExtensionFileFilter(null, new String[]
		{ "txt", "bat" });
		fileChooser.addChoosableFileFilter(jpegFilter);

		final MJInternalFrame mjif = this;
		super.add(fileChooser);
		super.pack();
		super.setVisible(true);
		ActionListener listener = new ActionListener()
		{
			public void actionPerformed(ActionEvent actionEvent)
			{
				JFileChooser theFileChooser = (JFileChooser) actionEvent
						.getSource();

				String command = actionEvent.getActionCommand();

				if (command.equals(JFileChooser.APPROVE_SELECTION))
				{
					File selectedFile = theFileChooser.getSelectedFile();
					if (selectedFile.isFile() && selectedFile.canRead())
					{
						try
						{
							connexion.sendfile(selectedFile);
						}
						catch (Exception e)
						{
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}

					connexion.getCompte().getFenetrePrincipale()
							.deletePublic(mjif, Constante.code_envoyer);

				}
				else if (command.equals(JFileChooser.CANCEL_SELECTION))
				{
					System.out.println("Quitter");
				}
			}
		};
		fileChooser.addActionListener(listener);
	}

}
