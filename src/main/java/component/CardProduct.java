package component;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.ImageIcon;
import javax.swing.SpringLayout;
import javax.swing.JLabel;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.SwingConstants;

import utils.ImageUtil;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;

public class CardProduct extends JPanel {
	private String name;
	private int price;
	private String supplier;
	private ImageIcon imageProduct;

	/**
	 * Create the panel.
	 */
	public CardProduct() {
//		initUI();
	}
	
	public CardProduct(String name, int price, String supplier,ImageIcon imageProduct) {
		this.name = name;
		this.price = price;
		this.supplier = supplier;
		this.imageProduct = imageProduct;
		initUI();
	}



	public void initUI() {
		setOpaque(false);
		setSize(200,300);
		setBackground(Color.WHITE);
		
		JLabel lblImage = new JLabel();
		lblImage.setHorizontalAlignment(SwingConstants.CENTER);
		lblImage.setIcon(imageProduct);
		
		Button btnAdd = new Button();
		btnAdd.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnAdd.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btnAdd.setForeground(Color.white);
		btnAdd.setText("Thêm");
		btnAdd.setRadius(30);
		btnAdd.setColor(new Color(31,174,255));
		btnAdd.setColorOver(new Color(90,193,251));
		btnAdd.setColorClick(new Color(31,174,255));
		btnAdd.setBorderColor(Color.white);
		
		JLabel lblName = new JLabel(name);
		lblName.setHorizontalAlignment(SwingConstants.CENTER);
		
		JLabel lblPrice = new JLabel(price+"");
		lblPrice.setHorizontalAlignment(SwingConstants.TRAILING);
		
		JLabel lblSupplier = new JLabel(supplier);
		GroupLayout groupLayout = new GroupLayout(this);
		groupLayout.setHorizontalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addGap(10)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addComponent(lblImage, GroupLayout.PREFERRED_SIZE, 180, Short.MAX_VALUE)
						.addComponent(lblName, GroupLayout.DEFAULT_SIZE, 180, Short.MAX_VALUE)
						.addGroup(groupLayout.createSequentialGroup()
							.addComponent(lblSupplier, GroupLayout.DEFAULT_SIZE, 79, Short.MAX_VALUE)
							.addGap(22)
							.addComponent(lblPrice, GroupLayout.DEFAULT_SIZE, 79, Short.MAX_VALUE))
						.addComponent(btnAdd, GroupLayout.DEFAULT_SIZE, 180, Short.MAX_VALUE))
					.addGap(10))
		);
		groupLayout.setVerticalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addGap(10)
					.addComponent(lblImage, GroupLayout.PREFERRED_SIZE, 133, Short.MAX_VALUE)
					.addGap(6)
					.addComponent(lblName, GroupLayout.DEFAULT_SIZE, 42, Short.MAX_VALUE)
					.addGap(6)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addComponent(lblSupplier, GroupLayout.DEFAULT_SIZE, 24, Short.MAX_VALUE)
						.addComponent(lblPrice, GroupLayout.DEFAULT_SIZE, 24, Short.MAX_VALUE))
					.addGap(38)
					.addComponent(btnAdd, GroupLayout.DEFAULT_SIZE, 31, Short.MAX_VALUE)
					.addGap(10))
		);
		setLayout(groupLayout);
	}
	
	public static void main(String[] args) {
		JFrame j = new JFrame();
		j.setSize(200,350);
		j.getContentPane().add(new CardProduct());
		j.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		j.setVisible(true);
	}
	
	 @Override
     protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Dimension arcs = new Dimension(30,30); //Border corners arcs {width,height}, change this to whatever you want
        int width = getWidth();
        int height = getHeight();
        Graphics2D graphics = (Graphics2D) g;
        graphics.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        //Draws the rounded panel with borders.
        graphics.setColor(getBackground());
        graphics.fillRoundRect(0, 0, width-1, height-1, arcs.width, arcs.height);//paint background
        graphics.setColor(Color.white);
        graphics.drawRoundRect(0, 0, width-1, height-1, arcs.width, arcs.height);//paint border
	 }

}
