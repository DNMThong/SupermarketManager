package component.sidebar;

import javax.swing.*;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.border.EmptyBorder;
import java.awt.*;

public class Sidebar extends JPanel {
	
	public Sidebar() {
		initComponents(null);
	}
	
	public Sidebar(JComponent c) {
		initComponents(c);
//		runClock();
	}
	
	private void initComponents(JComponent c) {
		this.setPreferredSize(new Dimension(300, 1032));
		ImageIcon icon = new ImageIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/404SP.png")).getImage().getScaledInstance(100, 100, Image.SCALE_SMOOTH));

		JButton btnNewButton = new JButton("New button");

		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setPreferredSize(new Dimension(2, 600));
		scrollPane.setBorder(null);

		JLabel lblNewLabel_1 = new JLabel("---Quy Da---");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 16));
		lblNewLabel_1.setHorizontalAlignment(SwingConstants.CENTER);
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
								.addComponent(btnNewButton, GroupLayout.DEFAULT_SIZE, 227, Short.MAX_VALUE)
								.addGap(37))
						.addGroup(Alignment.LEADING, groupLayout.createSequentialGroup()
								.addGap(61)
								.addComponent(lblNewLabel_1, GroupLayout.PREFERRED_SIZE, 178, GroupLayout.PREFERRED_SIZE)
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
								.addComponent(btnNewButton, GroupLayout.PREFERRED_SIZE, 93, GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(ComponentPlacement.RELATED, 33, Short.MAX_VALUE)
								.addComponent(scrollPane, GroupLayout.PREFERRED_SIZE, 600, GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(ComponentPlacement.RELATED)
								.addComponent(lblNewLabel_1, GroupLayout.PREFERRED_SIZE, 45, GroupLayout.PREFERRED_SIZE)
								.addContainerGap())
		);
		panel_1.setLayout(new BorderLayout(5, 0));

		JLabel lblNewLabel = new JLabel("");
		lblNewLabel.setIcon(icon);
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setPreferredSize(new Dimension(80, 14));
		panel_1.add(lblNewLabel, BorderLayout.CENTER);

		Sidebar_Menu panel = new Sidebar_Menu(c);
		scrollPane.setViewportView(panel);

		setLayout(groupLayout);
		this.setVisible(true);
	}
	
	private Dimension dimension() {
		return new Dimension(300, this.getParent() != null ? this.getParent().getHeight() : 0);
	}
	
//	private void runClock() {
//		new Thread(() -> {
//            while(true) {
//                SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss a");
//                timer.setText(format.format(new Date()));
//                try {
//                    Thread.sleep(1000);
//                }catch(Exception e1) {
//                    e1.printStackTrace();
//                }
//            }
//        }).start();
//	}
}
