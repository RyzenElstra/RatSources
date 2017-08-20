package send.specific.object;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.ObjectInputStream;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

/**
 * Permet de recevoir une image
 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
 *
 */

public class receivedImage {
	public static ImageIcon receivedImage(ObjectInputStream ois,
			boolean sauvegarde) throws ClassNotFoundException, IOException {
											
	
		
		ImageIcon imageIcon = (ImageIcon) ois.readObject();
		System.out.println("[debug] receivedImage :Nouvelle image recu");
		Image image = imageIcon.getImage();

		BufferedImage buffered = (BufferedImage) image;
		try {
		    // save to file
		    File outputfile = new File("saved.jpg");
		    ImageIO.write(buffered, "jpg", outputfile);
		} catch (IOException e) {
		    e.printStackTrace();
		}
		
		return imageIcon;

	}
}
