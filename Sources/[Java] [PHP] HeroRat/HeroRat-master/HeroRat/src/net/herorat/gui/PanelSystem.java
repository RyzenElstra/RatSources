package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import net.herorat.features.servers.Server;
import net.herorat.features.system.System;
import net.herorat.network.Network;


public class PanelSystem extends JPanel
{
	private static final long serialVersionUID = 5391500086140935512L;
	
	private JLabel label_select;
	public JComboBox<String> combo_select;
	public String combo_selected_item = "";
	
	private JScrollPane scroll_output;
	public JTextArea area_output;

	public PanelSystem()
	{
		initComponents();
		display();
	}
	
	private void initComponents()
	{
		setLayout(new BorderLayout(5, 0));
		createSelect();
		createOutput();
	}
	
	private void display()
	{
		setVisible(true);
	}
	
	private void createSelect()
	{
		label_select = new JLabel("Select an user: ");
		combo_select = new JComboBox<String>( Network.getServerList(false) );
		
		JPanel top_panel = new JPanel();
		top_panel.setLayout(new BorderLayout(5, 0));
		top_panel.setBorder(BorderFactory.createEmptyBorder(0, 2, 5, 2));
		top_panel.add(label_select, BorderLayout.LINE_START);
		top_panel.add(combo_select);
		add(top_panel, BorderLayout.NORTH);
		
		combo_select.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				String selection = String.valueOf(combo_select.getSelectedItem());
				if (combo_select.getSelectedIndex() != 0 && !selection.equals(combo_selected_item))
				{
					combo_selected_item = selection;
					area_output.setText("Loading ...");
					Server server = Network.findWithCombo(combo_selected_item);
					if (server != null) System.send(server);
				}
				else if (combo_select.getSelectedIndex() == 0)
				{
					combo_selected_item = "";
					area_output.setText("");
				}
			}
		});
	}
	
	private void createOutput()
	{
		scroll_output = new JScrollPane();
		area_output = new JTextArea();
		area_output.setColumns(55);
		area_output.setRows(22);
		area_output.setEditable(false);
		scroll_output.setViewportView(area_output);
		add(scroll_output, BorderLayout.CENTER);
	}
}