package remote.action;

import java.awt.Robot;
import java.awt.event.MouseEvent;
import java.io.IOException;

/**
 * Implemente une fonction du robot qui permet de bouger la souris
 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
 *
 */
public class BougerSouris implements ActionVNC
{

	// Parametres :
	// =====================================================================
	private static final long	serialVersionUID	= 1L;
	private final int				m_posX;
	private final int				m_posY;

	public BougerSouris(int pos_x, int pos_y)
	{
		super();
		this.m_posX = pos_x;
		this.m_posY = pos_y;
	}

	public BougerSouris(MouseEvent e)
	{
		this((int) e.getPoint().getX(), (int) e.getPoint().getY());
	}

	@Override
	public Object executer(Robot robot) throws IOException
	{
		robot.mouseMove(m_posX, m_posY);

		return null;
	}

}
