package gui;

import master.Connexion;
import master.Connexion.Affichage;

/**
 *
 * Classe Heritant de MJinternalFrame qui ouvre la VNC
 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
 *
 */
public class MVNCJInternalFrame extends MJInternalFrame{
	private Affichage affichage;
	
	
	public MVNCJInternalFrame(String title, Connexion connexion, int nframe) {
		super(title, connexion, nframe);
		System.out.println("[debug] MVNCJInternalFrame: Constructeur");
		affichage=new Affichage();
		
		//getContentPane().add(affichage);
		//affichage.setVisible(true);
	}
}
