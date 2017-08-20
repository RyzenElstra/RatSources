package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.KeyStroke;

import net.herorat.features.file.File;
import net.herorat.features.servers.Server;


public class FrameEditor extends JFrame
{
	private static final long serialVersionUID = -2070144033810521695L;
	
	private JMenuBar menu_panel;
	private JMenuItem item_save;
	
	private Server server;
	private String file;
	private String content;
	
	private JScrollPane scroll_edit;
	private JTextArea area_edit;

	public FrameEditor(Server server, String file, String content)
	{
		super("Editor - " + file);
		this.server = server;
		this.file = file;
		this.content = content;
		
		initComponents();
		display();
		this.setMinimumSize(new Dimension(400, 400));
		centerWindow();
	}
	
	private void initComponents()
	{
		createMenu();
		createEditZone();
	}
	
	private void display()
	{
		pack();
		setVisible(true);
	}
	
	private void centerWindow()
	{
		int bounds_top = Toolkit.getDefaultToolkit().getScreenSize().height / 2;
		int bounds_left = Toolkit.getDefaultToolkit().getScreenSize().width / 2;
		int half_height = this.getSize().height / 2;
		int half_width = this.getSize().width / 2;
		this.setLocation(bounds_left - half_width, bounds_top - half_height);
	}
	
	private void createMenu()
	{
		this.menu_panel = new JMenuBar();
		this.item_save = new JMenuItem("Save changes");
		this.item_save.setAccelerator(KeyStroke.getKeyStroke("ctrl S"));
		this.item_save.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				File.sendSave(server, file, area_edit.getText());
				JOptionPane.showOptionDialog(null, "Changes have been saved!", "Saved", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, (Object[]) null, (Object) null);
			}
		});
		
		this.menu_panel.add(this.item_save);
		setJMenuBar(this.menu_panel);
	}
	
	private void createEditZone()
	{
		this.scroll_edit = new JScrollPane();
		this.area_edit = new JTextArea();
		this.area_edit.setColumns(55);
		this.area_edit.setRows(22);
		this.scroll_edit.setViewportView(this.area_edit);
		add(this.scroll_edit, BorderLayout.CENTER);
		
		this.area_edit.setText(this.content);
	}
}