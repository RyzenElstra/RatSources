package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.BorderFactory;
import javax.swing.DropMode;
import javax.swing.ImageIcon;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.Timer;

import net.herorat.features.process.Process;
import net.herorat.features.servers.Server;
import net.herorat.network.Network;
import net.herorat.utils.Utils;


public class PanelProcess extends JPanel
{
	private static final long serialVersionUID = 5554527594694870999L;
	
	private JLabel label_select;
	public JComboBox<String> combo_select;
	public String combo_selected_item = "";
	
	public TableModel model_process;
	
	private JPopupMenu menu_dropdown;
	
	private JTable table_process;
	private JScrollPane scroll_process;
	
	private Server server;
	
	private Timer timer_refresh = new Timer(10000, new ActionListener() {
		public void actionPerformed(ActionEvent e)
		{
			for(int i=model_process.getRowCount() - 1; i>=0; i--) model_process.removeRow(i);
			if (server != null) Process.send(server);
		}
	});
	
	public PanelProcess()
	{
		initComponents();
		display();
	}

	private void initComponents()
	{
		setLayout(new BorderLayout(5, 0));
		createSelect();
		createDropDown();
		createModel();
		createTable();
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
					server = Network.findWithCombo(combo_selected_item);
					
					for(int i=model_process.getRowCount() - 1; i>=0; i--) model_process.removeRow(i);
					
					if (server != null)
					{
						Process.send(server);
						for (int i=0; i<server.array_process.size(); i++) model_process.addRow(server.array_process.get(i));
					}
					
					timer_refresh.start();
				}
				else if (combo_select.getSelectedIndex() == 0)
				{
					combo_selected_item = "";
					for(int i=model_process.getRowCount() - 1; i>=0; i--) model_process.removeRow(i);
					
					timer_refresh.stop();
				}
			}
		});
	}
	
	private void createDropDown()
	{
		menu_dropdown = new JPopupMenu();
		
		JMenuItem item = new JMenuItem();
		item.setText("Kill");
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/kill.png"))));
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				String id = table_process.getValueAt(table_process.getSelectedRow(), 1).toString();
				Server server = Network.findWithCombo(combo_selected_item);
				if (server != null)
				{
					model_process.removeRow(table_process.getSelectedRow());
					Process.sendKill(server, id);
				}
			}
		});
		menu_dropdown.add(item);
	}
	
	private void createModel()
	{
		model_process = new TableModel(new String[] { "Name", "PID", "Session", "Size" });
	}
	
	private void createTable()
	{
		table_process = new JTable();
		scroll_process = new JScrollPane();
		
		table_process.setModel(model_process);
		table_process.setComponentPopupMenu(menu_dropdown);
		table_process.setDropMode(DropMode.ON);
		table_process.setSelectionMode(0);
		table_process.setRowHeight(20);
		table_process.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent evt) {}
			public void mousePressed(MouseEvent evt)
			{
				int t = (int) (evt.getPoint().getY() / 20.0D);
				table_process.getSelectionModel().setSelectionInterval(t, t);
			}
		});
		scroll_process.setViewportView(table_process);
		add(scroll_process);
		
		table_process.getColumn("PID").setMaxWidth(64);
		table_process.getColumn("PID").setMinWidth(64);
		
		table_process.getTableHeader().setReorderingAllowed(false);
	}
}