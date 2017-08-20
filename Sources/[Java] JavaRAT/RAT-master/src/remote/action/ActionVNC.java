package remote.action;

import java.awt.Robot;
import java.io.IOException;
import java.io.Serializable;

/**
 * Interface pour tous les objets qui concernent la VNC
 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
 */
public interface ActionVNC extends Serializable {

	Object executer(Robot robot) throws IOException;

}
