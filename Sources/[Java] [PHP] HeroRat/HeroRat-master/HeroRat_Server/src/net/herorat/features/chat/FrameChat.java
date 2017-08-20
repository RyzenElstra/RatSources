package net.herorat.features.chat;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.AbstractAction;
import javax.swing.ActionMap;
import javax.swing.BorderFactory;
import javax.swing.InputMap;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.KeyStroke;
import javax.swing.border.TitledBorder;

import net.herorat.features.chat.Chat;


public class FrameChat extends JFrame
{
	private static final long serialVersionUID = 5391500086140935512L;
	
	private JScrollPane scroll_chat;
	public JTextArea area_chat;
	
	private JScrollPane scroll_input;
	private JTextArea area_input;
	private JButton button_input;

	public FrameChat()
	{
		initComponents();
		display();
	}
	
	private void initComponents()
	{
		setTitle("Chat");
		setPreferredSize(new Dimension(500, 400));
		setMinimumSize(new Dimension(500, 400));
		setLayout(new BorderLayout(5, 0));
		createOutput();
		createInput();
	}
	
	private void display()
	{
		setVisible(true);
		pack();
	}
	
	private void createOutput()
	{
		scroll_chat = new JScrollPane();
		area_chat = new JTextArea();
		area_chat.setColumns(55);
		area_chat.setRows(10);
		area_chat.setEditable(false);
		area_chat.setLineWrap(true);
		scroll_chat.setViewportView(area_chat);
		add(scroll_chat, BorderLayout.CENTER);
	}
	
	private void createInput()
	{	
		scroll_input = new JScrollPane();
		area_input = new JTextArea();
		area_input.setRows(4);
		area_input.setLineWrap(true);
		scroll_input.setViewportView(area_input);

		InputMap input = area_input.getInputMap();
		KeyStroke enter = KeyStroke.getKeyStroke("ENTER");
		KeyStroke shiftEnter = KeyStroke.getKeyStroke("shift ENTER");
		input.put(shiftEnter, "insert-break");
		input.put(enter, "text-submit");
		
		ActionMap actions = area_input.getActionMap();
		actions.put("text-submit", new AbstractAction() {
			private static final long serialVersionUID = -6749249301370344488L;

			public void actionPerformed(ActionEvent e)
			{
				sendChatMsg();
			}
		});

		area_input.requestFocusInWindow();
		
		button_input = new JButton("Send");
		button_input.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				sendChatMsg();
			}
		});
		
		JPanel bottom_panel = new JPanel();
		TitledBorder titled = new TitledBorder("Message");
		bottom_panel.setBorder(titled);
		bottom_panel.setLayout(new BorderLayout(5, 0));
		bottom_panel.setBorder(BorderFactory.createEmptyBorder(10, 2, 5, 2));
		bottom_panel.add(scroll_input);
		bottom_panel.add(button_input, BorderLayout.LINE_END);
		add(bottom_panel, BorderLayout.SOUTH);
	}
	
	private void sendChatMsg()
	{
		if (!area_input.getText().equals(""))
		{
			Chat.buffer_chat.append("Me: " + area_input.getText() + "\n");
			Chat.send(area_input.getText());
			area_chat.setText(Chat.buffer_chat.toString());
			area_input.setText("");
		}
	}
}