package ui;

import component.Button;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;

public class DSPNContent extends JPanel {

	/**
	 * Create the panel.
	 */
	public DSPNContent() {
		
		initComponent();
	}
	
	public static void main(String[] args) {
		JFrame f = new JFrame();
		f.setSize(1000, 800);
		MainContent m = new MainContent("Kho");
		m.addContent(new DSPNContent());
		f.getContentPane().add(m);
		f.setVisible(true);
	}

	private void initComponent() {
		setLayout(new BorderLayout(0, 0));
		
		JPanel panel = new JPanel();
		panel.setPreferredSize(new Dimension(10, 160));
		add(panel, BorderLayout.NORTH);
		SpringLayout sl_panel = new SpringLayout();
		panel.setLayout(sl_panel);
		
		JLabel lblNewLabel = new JLabel("Danh sách phiếu nhập");
		sl_panel.putConstraint(SpringLayout.NORTH, lblNewLabel, 10, SpringLayout.NORTH, panel);
		sl_panel.putConstraint(SpringLayout.WEST, lblNewLabel, 10, SpringLayout.WEST, panel);
		sl_panel.putConstraint(SpringLayout.EAST, lblNewLabel, -10, SpringLayout.EAST, panel);
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 20));
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		panel.add(lblNewLabel);
		
		JPanel panel_1 = new JPanel();
		sl_panel.putConstraint(SpringLayout.SOUTH, lblNewLabel, -6, SpringLayout.NORTH, panel_1);
		sl_panel.putConstraint(SpringLayout.EAST, panel_1, 0, SpringLayout.EAST, lblNewLabel);
		sl_panel.putConstraint(SpringLayout.WEST, panel_1, 10, SpringLayout.WEST, panel);
		sl_panel.putConstraint(SpringLayout.NORTH, panel_1, 76, SpringLayout.NORTH, panel);
		sl_panel.putConstraint(SpringLayout.SOUTH, panel_1, -10, SpringLayout.SOUTH, panel);
		
		panel.add(panel_1);
		SpringLayout sl_panel_1 = new SpringLayout();
		panel_1.setLayout(sl_panel_1);
		
		JPanel panel_2 = new JPanel();
		sl_panel_1.putConstraint(SpringLayout.NORTH, panel_2, 10, SpringLayout.NORTH, panel_1);
		sl_panel_1.putConstraint(SpringLayout.WEST, panel_2, 10, SpringLayout.WEST, panel_1);
		sl_panel_1.putConstraint(SpringLayout.SOUTH, panel_2, 64, SpringLayout.NORTH, panel_1);
		sl_panel_1.putConstraint(SpringLayout.EAST, panel_2, 319, SpringLayout.WEST, panel_1);
		panel_1.add(panel_2);
		SpringLayout sl_panel_2 = new SpringLayout();
		panel_2.setLayout(sl_panel_2);
		
		JLabel lblNewLabel_1 = new JLabel("Phiếu nhập");
		sl_panel_2.putConstraint(SpringLayout.NORTH, lblNewLabel_1, 0, SpringLayout.NORTH, panel_2);
		sl_panel_2.putConstraint(SpringLayout.WEST, lblNewLabel_1, 0, SpringLayout.WEST, panel_2);
		sl_panel_2.putConstraint(SpringLayout.SOUTH, lblNewLabel_1, 21, SpringLayout.NORTH, panel_2);
		sl_panel_2.putConstraint(SpringLayout.EAST, lblNewLabel_1, 230, SpringLayout.WEST, panel_2);
		panel_2.add(lblNewLabel_1);
		
		JComboBox comboBox = new JComboBox();
		comboBox.setPreferredSize(new Dimension(30, 26));
		sl_panel_2.putConstraint(SpringLayout.WEST, comboBox, -230, SpringLayout.EAST, lblNewLabel_1);
		sl_panel_2.putConstraint(SpringLayout.SOUTH, comboBox, -5, SpringLayout.SOUTH, panel_2);
		sl_panel_2.putConstraint(SpringLayout.EAST, comboBox, 79, SpringLayout.EAST, lblNewLabel_1);
		panel_2.add(comboBox);
		
		Button btnInsert = new Button();
		btnInsert.setBorderPainted(false);
		btnInsert.setRadius(30);
		sl_panel_1.putConstraint(SpringLayout.NORTH, btnInsert, 36, SpringLayout.NORTH, panel_1);
		sl_panel_1.putConstraint(SpringLayout.WEST, btnInsert, -183, SpringLayout.EAST, panel_1);
		sl_panel_1.putConstraint(SpringLayout.SOUTH, btnInsert, 0, SpringLayout.SOUTH, panel_2);
		sl_panel_1.putConstraint(SpringLayout.EAST, btnInsert, -10, SpringLayout.EAST, panel_1);
		panel_1.add(btnInsert);
		
		JTabbedPane tabbedPane = new JTabbedPane(JTabbedPane.TOP);
		tabbedPane.setBorder(new EmptyBorder(0, 15, 0, 15));
		add(tabbedPane, BorderLayout.CENTER);
		
		JPanel panel_3 = new JPanel();
		tabbedPane.addTab("New tab", null, panel_3, null);
		panel_3.setLayout(new BorderLayout(0, 0));
		
		JPanel panel_6 = new JPanel();
		panel_6.setPreferredSize(new Dimension(10, 40));
		panel_3.add(panel_6, BorderLayout.SOUTH);
		SpringLayout sl_panel_6 = new SpringLayout();
		panel_6.setLayout(sl_panel_6);
		
		Button button_1 = new Button();
		button_1.setBorderPainted(false);
		button_1.setRadius(18);
		sl_panel_6.putConstraint(SpringLayout.NORTH, button_1, 10, SpringLayout.NORTH, panel_6);
		sl_panel_6.putConstraint(SpringLayout.WEST, button_1, -154, SpringLayout.EAST, panel_6);
		sl_panel_6.putConstraint(SpringLayout.SOUTH, button_1, 30, SpringLayout.NORTH, panel_6);
		sl_panel_6.putConstraint(SpringLayout.EAST, button_1, -10, SpringLayout.EAST, panel_6);
		panel_6.add(button_1);
		
		Button button_2 = new Button();
		button_2.setBorderPainted(false);
		button_2.setRadius(18);
		sl_panel_6.putConstraint(SpringLayout.NORTH, button_2, 10, SpringLayout.NORTH, panel_6);
		sl_panel_6.putConstraint(SpringLayout.WEST, button_2, -137, SpringLayout.WEST, button_1);
		sl_panel_6.putConstraint(SpringLayout.SOUTH, button_2, 0, SpringLayout.SOUTH, button_1);
		sl_panel_6.putConstraint(SpringLayout.EAST, button_2, -17, SpringLayout.WEST, button_1);
		panel_6.add(button_2);
		
		JScrollPane scrollPane = new JScrollPane();
		panel_3.add(scrollPane, BorderLayout.CENTER);
		
		JPanel panel_4 = new JPanel();
		tabbedPane.addTab("New tab", null, panel_4, null);
		panel_4.setLayout(new BorderLayout(0, 0));
		
		JPanel panel_6_1 = new JPanel();
		panel_6_1.setPreferredSize(new Dimension(10, 40));
		panel_4.add(panel_6_1, BorderLayout.SOUTH);
		SpringLayout sl_panel_6_1 = new SpringLayout();
		panel_6_1.setLayout(sl_panel_6_1);
		
		Button button_3 = new Button();
		button_3.setBorderPainted(false);
		button_3.setRadius(18);
		sl_panel_6_1.putConstraint(SpringLayout.NORTH, button_3, 10, SpringLayout.NORTH, panel_6_1);
		sl_panel_6_1.putConstraint(SpringLayout.WEST, button_3, -120, SpringLayout.EAST, panel_6_1);
		sl_panel_6_1.putConstraint(SpringLayout.SOUTH, button_3, 30, SpringLayout.NORTH, panel_6_1);
		sl_panel_6_1.putConstraint(SpringLayout.EAST, button_3, -10, SpringLayout.EAST, panel_6_1);
		panel_6_1.add(button_3);
		
		Button button_4 = new Button();
		button_4.setBorderPainted(false);
		button_4.setRadius(18);
		sl_panel_6_1.putConstraint(SpringLayout.NORTH, button_4, 10, SpringLayout.NORTH, panel_6_1);
		sl_panel_6_1.putConstraint(SpringLayout.WEST, button_4, -127, SpringLayout.WEST, button_3);
		sl_panel_6_1.putConstraint(SpringLayout.SOUTH, button_4, 0, SpringLayout.SOUTH, button_3);
		sl_panel_6_1.putConstraint(SpringLayout.EAST, button_4, -17, SpringLayout.WEST, button_3);
		panel_6_1.add(button_4);
		
		JScrollBar scrollBar = new JScrollBar();
		panel_4.add(scrollBar, BorderLayout.CENTER);
		
		JPanel panel_5 = new JPanel();
		add(panel_5, BorderLayout.SOUTH);
	}
}
