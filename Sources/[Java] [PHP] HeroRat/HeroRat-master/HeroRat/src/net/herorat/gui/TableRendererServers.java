package net.herorat.gui;

import javax.swing.*;
import java.awt.*;
import javax.swing.table.*;

import net.herorat.utils.Utils;

class TableRendererServers extends JLabel implements TableCellRenderer
{
	private static final long serialVersionUID = -6887696817002715067L;
	
	public TableRendererServers()
	{
		setOpaque(true);
	}
	
	public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column)
	{
		if (column == 0 && value != null)
		{
			setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/flags/" + value.toString().toLowerCase() + ".gif"))));
			setBorder(BorderFactory.createEmptyBorder(0,5,0,5));
			setText(value.toString().substring(0, 2).toUpperCase());
		}
		else if (column == 3 && value != null)
		{
			if (value.toString().toLowerCase().contains("win"))
			{
				setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/windows.gif"))));
			}
			else if (value.toString().toLowerCase().contains("nux"))
			{
				setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/linux.png"))));
			}
			else if ((value.toString().toLowerCase().contains("mac")))
			{
				setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/mac.png"))));
			}
			setBorder(BorderFactory.createEmptyBorder(0,5,0,5));
			setText(value.toString());
		}
		else if (column == 5 && value != null)
		{
			setBorder(BorderFactory.createEmptyBorder(0,5,0,5));
			setText(value.toString());
			if (Integer.parseInt(value.toString()) < 100)
			{
				setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/ping4.gif"))));
			}
			else if (Integer.parseInt(value.toString()) < 200)
			{
				setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/ping3.gif"))));
			}
			else if (Integer.parseInt(value.toString()) < 400)
			{
				setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/ping2.gif"))));
			}
			else if (Integer.parseInt(value.toString()) < 700)
			{
				setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/ping1.gif"))));
			}
			else
			{
				setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/ping0.gif"))));
			}
		}
		else if (value != null)
		{
			setBorder(BorderFactory.createEmptyBorder(0,5,0,5));
			setText(value.toString());
		}
		if(isSelected)
		{
			setBackground(table.getSelectionBackground());
			setForeground(table.getSelectionForeground());
		}
		else
		{
			if (row % 2 == 1)
			{
				setBackground(new Color(220, 220, 220));
				setForeground(Color.BLACK);
			}
			else
			{
				setBackground(table.getBackground());
				setForeground(table.getForeground());
			}
		}
		return this;
	}
}