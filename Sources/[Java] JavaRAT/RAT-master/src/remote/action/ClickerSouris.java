package remote.action;

import java.awt.Robot;
import java.awt.event.MouseEvent;
import java.io.IOException;

/**
 * Implémente une fonction du robot qui permet de cliquer avec une souris sur un point
 * @author Clement Collet & Louis Henri Franc & Mohammed Boukhari
 *
 */
public class ClickerSouris implements ActionVNC
{

	// Parametres :
	// =====================================================================

	private static final long	serialVersionUID	= 1L;
	private final int				m_boutton;
	private final int				click;

	// Constructeur :
	// =====================================================================

	public ClickerSouris(int bouton, int click)
	{
		super();
		m_boutton = bouton;
		this.click = click;
	}

	public ClickerSouris(MouseEvent e)
	{
		this(e.getModifiers(), e.getClickCount());
	}
	
	
	// Methodes :
	// =====================================================================

	@Override
	public Object executer(Robot robot) throws IOException
	{
		// TODO Auto-generated method stub
		for (int i = 0; i < click; i++)
		{
			robot.mousePress(m_boutton);
			robot.mouseRelease(m_boutton);
		}
		return null;
	}

}
