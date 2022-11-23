package ui;

import utils.DateUtil;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.util.Date;

public class MainContent extends JPanel {

	private JLabel lbTitle;
	private JLabel lbDot;

	private JLabel lbTop;

	private JLabel lbTimer;

	private JLabel lbDate;

	public MainContent(String title) {
		
		initComponents();
		execute(title);
		displayTime();
	}
	
	public void initComponents() {
		setLayout(new BorderLayout(0, 0));
		
		JPanel panel = new JPanel();
		panel.setBackground(Color.WHITE);
		panel.setBorder(UIManager.getBorder("TextField.border"));
		panel.setPreferredSize(new Dimension(10, 120));
		panel.setMaximumSize(new Dimension(32767, 200));
		add(panel, BorderLayout.NORTH);
		
		lbTitle = new JLabel("");

		
		JPanel panel_1 = new JPanel();
		panel_1.setBackground(Color.WHITE);
		panel_1.setBorder(new EmptyBorder(2, 5, 2, 5));
		panel_1.setMaximumSize(panel_1.getPreferredSize());
		panel_1.setPreferredSize(new Dimension(150, 14));
		panel_1.setLayout(new GridLayout(2, 0, 0, 0));
		
		JPanel panel_2 = new JPanel();
		panel_2.setBackground(Color.WHITE);
		panel_1.add(panel_2);
		panel_2.setLayout(new BorderLayout(0, 0));
		
		lbTop = new JLabel();
		panel_2.add(lbTop);
		
		JPanel panel_3 = new JPanel();
		panel_3.setBackground(Color.WHITE);
		panel_3.setMaximumSize(new Dimension(150, 32767));
		panel_1.add(panel_3);
		panel_3.setLayout(new BorderLayout(0, 0));
		
		lbDate = new JLabel("14 November 2022");
		panel_3.add(lbDate, BorderLayout.WEST);
		
		lbDot = new JLabel("");
		panel_3.add(lbDot, BorderLayout.CENTER);
		
		lbTimer = new JLabel("13:13:55 PM");

		panel_3.add(lbTimer, BorderLayout.EAST);
		SpringLayout sl_panel = new SpringLayout();
		sl_panel.putConstraint(SpringLayout.NORTH, lbTitle, 26, SpringLayout.NORTH, panel);
		sl_panel.putConstraint(SpringLayout.WEST, lbTitle, 249, SpringLayout.WEST, panel);
		sl_panel.putConstraint(SpringLayout.SOUTH, lbTitle, -27, SpringLayout.SOUTH, panel);
		sl_panel.putConstraint(SpringLayout.EAST, lbTitle, -249, SpringLayout.EAST, panel);
		sl_panel.putConstraint(SpringLayout.NORTH, panel_1, 26, SpringLayout.NORTH, panel);
		sl_panel.putConstraint(SpringLayout.WEST, panel_1, 1, SpringLayout.EAST, lbTitle);
		sl_panel.putConstraint(SpringLayout.SOUTH, panel_1, -27, SpringLayout.SOUTH, panel);
		sl_panel.putConstraint(SpringLayout.EAST, panel_1, -10, SpringLayout.EAST, panel);
		panel.setLayout(sl_panel);
		panel.add(lbTitle);
		panel.add(panel_1);
	}

	public void execute(String title) {
		ImageIcon icon = new ImageIcon(new ImageIcon(getClass().getResource("../icon/title/sun.png")).getImage().getScaledInstance(24, 24, Image.SCALE_SMOOTH));
		ImageIcon icon2 = new ImageIcon(new ImageIcon(getClass().getResource("../icon/title/sun.png")).getImage().getScaledInstance(6, 6, Image.SCALE_SMOOTH));

		lbTitle.setText(title);
		lbTitle.setFont(new Font("Tahoma", Font.BOLD, 38));
		lbTitle.setHorizontalAlignment(SwingConstants.CENTER);
		lbTitle.setHorizontalTextPosition(SwingConstants.LEADING);

		lbTop.setText("Good Morning");
		lbTop.setBorder(new EmptyBorder(0, 0, 0, 10));
		lbTop.setFont(new Font("Jost", Font.ITALIC, 13));
		lbTop.setIconTextGap(8);
		lbTop.setIcon(icon);
		lbTop.setHorizontalAlignment(SwingConstants.RIGHT);

		lbDot.setHorizontalAlignment(SwingConstants.CENTER);
		lbDot.setIcon(icon2);
		lbDot.setPreferredSize(new Dimension(15, 14));
		lbDot.setMaximumSize(new Dimension(20, 14));

		lbDate.setText("18 November 2022");
		lbDate.setFont(new Font("Jost", Font.PLAIN, 12));
		lbDate.setPreferredSize(new Dimension(120, 14));
		lbDate.setHorizontalAlignment(SwingConstants.RIGHT);

		lbTimer.setText("8:36 AM");
		lbTimer.setFont(new Font("Jost", Font.PLAIN, 12));
		lbTimer.setPreferredSize(new Dimension(80, 14));
	}

	public void displayTime() {
		new Thread(() -> {
			while(true) {
				Date date = new Date();
				lbDate.setText(DateUtil.toString(date,"dd MMMM yyyy"));
				lbTimer.setText(DateUtil.toString(date,"hh:mm a"));
				lbTop.setText(greet(date.getHours()));
				try {
					Thread.sleep(1000);
				}catch(Exception e1) {
					e1.printStackTrace();
				}
			}
		}).start();
	}

	public String greet(int hours) {
		if(hours<6) {
			return "Please go to sleep";
		}else if(hours<12) {
			return "Good morning";
		}else if(hours<18) {
			return "Good afternoon";
		}else {
			return "Good evening";
		}
	}
}
