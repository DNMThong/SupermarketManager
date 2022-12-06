package component.table.product;

import java.awt.Color;
import java.awt.GridLayout;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;

public class ProductInfo extends JPanel {

	private JLabel lbImage;
	private JLabel lbName;
	private JLabel lbCode;
	private JPanel rightPanel;

	public ProductInfo(ModelProductInfo info) {
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
		lbCode = new JLabel(info.getSup());
		rightPanel.add(lbName);
		rightPanel.add(lbCode);
		add(rightPanel);
	}
	
	public void setSelectedBackground(Color c) {
		setBackground(c);
		rightPanel.setBackground(c);
	}
}
