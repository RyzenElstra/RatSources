package remote.action;

import java.awt.Dimension;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * Classe qui redéfinit la classe de l'interface RemoteActions. Utilise le robot pour creer une capture d'ecran.  
 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
 *
 */
public class ScreenShot implements ActionVNC
{

	// Parametres :
	// =====================================================================

	private static byte[]	size	= null;

	// Accesseurs :
	// =====================================================================

	public static byte[] getsize()
	{

		return size;
	}

	// Methodes :
	// =====================================================================

	public BufferedImage executer(Robot robot) throws IOException
	{
		// TODO Auto-generated method stub
		Dimension dimension = Toolkit.getDefaultToolkit().getScreenSize();
		BufferedImage screenshot = robot.createScreenCapture(new Rectangle(
				dimension.width, dimension.height));
		BufferedImage img = robot.createScreenCapture(new Rectangle(
				dimension.width, dimension.height));

		return img;

	}

}
