package component.table.staff;

import java.awt.Color;
import java.awt.GridLayout;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;

public class StaffInfo extends JPanel {

	private JLabel lbImage;
	private JLabel lbName;
	private JLabel lbRole;
	private JPanel rightPanel;

	public StaffInfo(ModelStaffInfo info) {
		setOpaque(true);
		setBackground(Color.white);
		setBorder(new EmptyBorder(5, 20, 5, 20));
		setLayout(new GridLayout(1, 2, 0, 0));
		
		lbImage = new JLabel();
		lbImage.setIcon(info.getIcon());
		lbImage.setHorizontalAlignment(SwingConstants.CENTER);
		add(lbImage);
		
		rightPanel = new JPanel();
		rightPanel.setOpaque(true);
		rightPanel.setBackground(Color.white);
		rightPanel.setLayout(new GridLayout(2,1));
		lbName = new JLabel(info.getName());
		lbRole = new JLabel(info.getGender() == true  ? "Nam" : "Nữ");
		rightPanel.add(lbName);
		rightPanel.add(lbRole);
		add(rightPanel);
	}
	
	public void setSelectedBackground(Color c) {
		setBackground(c);
		rightPanel.setBackground(c);
	}
}
