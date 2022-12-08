package component.sidebar;

import component.Button;
import ui.MainContent;
import ui.POS;

import javax.swing.*;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Sidebar extends JPanel {
	private JPanel containerContent = null;
	private MainContent contentPanel;
	
	public Sidebar() {
		initComponents(null);
	}
	
	public Sidebar(JComponent c) {
		initComponents(c);
		this.containerContent = (JPanel) c;
//		runClock();
	}
	
	private void initComponents(JComponent c) {
		this.setPreferredSize(new Dimension(300, 0));
		ImageIcon icon = new ImageIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/404SP.png")).getImage().getScaledInstance(250, 250, Image.SCALE_SMOOTH));

		Button btnPOS = new Button();
		btnPOS.setForeground(Color.white);
		btnPOS.setRadius(40);
		btnPOS.setBackground(Color.red);
		btnPOS.setFont(new Font("Tahoma", Font.BOLD, 36));
		btnPOS.setText("POS");
		btnPOS.setBorderPainted(false);
		btnPOS.setFocusPainted(false);
		btnPOS.setCursor(new Cursor(Cursor.HAND_CURSOR));
		btnPOS.addActionListener(new handleClickBtnPOS());

		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setPreferredSize(new Dimension(2, 600));
		scrollPane.setBorder(null);

		JLabel lbMadeBy = new JLabel("--- Nhóm 1 ---");
		lbMadeBy.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 16));
		lbMadeBy.setHorizontalAlignment(SwingConstants.CENTER);
		this.setBackground(Color.BLUE);

		JPanel panel_1 = new JPanel();
		panel_1.setOpaque(false);
		panel_1.setBackground(Color.WHITE);
		panel_1.setBorder(new EmptyBorder(5, 10, 5, 10));
		GroupLayout groupLayout = new GroupLayout(this);
		groupLayout.setHorizontalGroup(
				groupLayout.createParallelGroup(Alignment.TRAILING)
						.addGroup(Alignment.LEADING, groupLayout.createSequentialGroup()
								.addGap(37)
								.addComponent(btnPOS, GroupLayout.DEFAULT_SIZE, 227, Short.MAX_VALUE)
								.addGap(37))
						.addGroup(Alignment.LEADING, groupLayout.createSequentialGroup()
								.addGap(61)
								.addComponent(lbMadeBy, GroupLayout.PREFERRED_SIZE, 178, GroupLayout.PREFERRED_SIZE)
								.addContainerGap(62, Short.MAX_VALUE))
						.addComponent(panel_1, GroupLayout.DEFAULT_SIZE, 300, Short.MAX_VALUE)
						.addGroup(Alignment.LEADING, groupLayout.createSequentialGroup()
								.addContainerGap()
								.addComponent(scrollPane, GroupLayout.DEFAULT_SIZE, 280, Short.MAX_VALUE)
								.addContainerGap())
		);
		groupLayout.setVerticalGroup(
				groupLayout.createParallelGroup(Alignment.TRAILING)
						.addGroup(groupLayout.createSequentialGroup()
								.addContainerGap()
								.addComponent(panel_1, GroupLayout.PREFERRED_SIZE, 167, GroupLayout.PREFERRED_SIZE)
								.addGap(34)
								.addComponent(btnPOS, GroupLayout.PREFERRED_SIZE, 93, GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(scrollPane, GroupLayout.DEFAULT_SIZE, 611, Short.MAX_VALUE)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(lbMadeBy, GroupLayout.PREFERRED_SIZE, 45, GroupLayout.PREFERRED_SIZE)
								.addGap(0))
		);
		panel_1.setLayout(new BorderLayout(5, 0));

		JLabel lbLogo = new JLabel("");
		lbLogo.setIcon(icon);
		lbLogo.setHorizontalAlignment(SwingConstants.CENTER);
		lbLogo.setPreferredSize(new Dimension(80, 14));
		panel_1.add(lbLogo, BorderLayout.CENTER);

		Sidebar_Menu panel = new Sidebar_Menu(c);
		scrollPane.setViewportView(panel);

		setLayout(groupLayout);
		this.setVisible(true);
	}

	class handleClickBtnPOS implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			System.out.println(123);
			if (contentPanel != null) {
				contentPanel.removeAll();
				contentPanel.revalidate();
				contentPanel.repaint();
			}
			contentPanel = new MainContent("Bán hàng");
			contentPanel.addContent(new POS());
			if (containerContent != null) {
				containerContent.removeAll();
				containerContent.revalidate();
				containerContent.repaint();
				containerContent.add(contentPanel, BorderLayout.CENTER);
				containerContent.revalidate();
				containerContent.repaint();
			}
		}
	}
}
