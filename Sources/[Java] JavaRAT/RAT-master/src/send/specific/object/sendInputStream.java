package send.specific.object;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 * Classe implementé pour la lecture du flux de sortie du terminal
 * Recupere l'inputStream du Process lancé dans Terminal 
 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
 *
 */
public class sendInputStream implements Runnable {

	private String finale;
	private final InputStream inputStream;

	public sendInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	private BufferedReader getBufferedReader(InputStream is) {
		return new BufferedReader(new InputStreamReader(is));
	}

	public String getFinale() {
		return this.finale;
	}

	@Override
	public void run() {
		BufferedReader br = getBufferedReader(inputStream);
		String ligne = "";
		finale = "";
		try {
			while ((ligne = br.readLine()) != null) {
				finale += ligne + "\n";
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
