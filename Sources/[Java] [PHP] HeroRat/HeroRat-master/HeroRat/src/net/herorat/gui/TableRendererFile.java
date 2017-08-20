package net.herorat.gui;

import javax.swing.*;

import java.awt.*;

import javax.swing.table.*;

import net.herorat.utils.Utils;

class TableRendererFile extends JLabel implements TableCellRenderer
{
	private static final long serialVersionUID = -6887696817002715067L;
	
	public TableRendererFile()
	{
		setOpaque(true);
	}
	
	public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column)
	{
		if (column == 0)
		{
			setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/" + value.toString().toLowerCase() + ".gif"))));
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