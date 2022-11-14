package ui;

import com.formdev.flatlaf.FlatIntelliJLaf;
import component.sidebar.Sidebar;

import javax.swing.*;
import java.awt.*;

@SuppressWarnings("serial")
public class MainFrame extends JFrame {
	
	private final JPanel contentPane = new JPanel();
	
	public static void main(String[] args) {
//		JFrame j = new MainFrame();
//        GraphicsEnvironment graphics =
//                  GraphicsEnvironment.getLocalGraphicsEnvironment();
//                  GraphicsDevice device = graphics.getDefaultScreenDevice();
//        device.setFullScreenWindow(j);
		new MainFrame();
	}
	
	public MainFrame() {
		initComponents();
		FlatIntelliJLaf.setup();
//		addSidebar();
	}
	
	
	private void initComponents() {
//		MainContent panel = new MainContent();
		Sidebar sidebarPane = new Sidebar(null);
		this.setContentPane(contentPane);
		sidebarPane.setBackground(new Color(31, 174, 255));

		this.setExtendedState(JFrame.MAXIMIZED_BOTH);
		this.setVisible(true);
		this.setLocationRelativeTo(null);
//		this.setResizable(false);

		// content panel properties
		contentPane.setLayout(new BorderLayout());
		contentPane.add(sidebarPane, BorderLayout.WEST);
//		contentPane.add(panel, BorderLayout.CENTER);

//		panel.setVisible(true);
	}

	private void addSidebar() {
		System.out.println("=== Resources: " + this.getClass().getResource("../icon/title/sun.png"));
	}
}
