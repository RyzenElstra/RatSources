package net.herorat.gui;

import javax.swing.table.DefaultTableModel;

public class TableModel extends DefaultTableModel
{
	private static final long serialVersionUID = -8028960364799050324L;

	public TableModel(String[] columns)
	{
		for(String column : columns)
		{
			this.addColumn(column);
		}
	}

	public boolean isCellEditable(int row, int column)
	{
		return false;
	}
}
