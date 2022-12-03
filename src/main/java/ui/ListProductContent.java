package ui;

import component.table.product.ListProductTable;
import component.Button;
import utils.ImageUtil;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;

public class ListProductContent extends JPanel {
	
	private ListProductTable tb;

	public ListProductContent() {
		initComponent();
		
//		fillTable();
	}
	
	public static void main(String[] args) {
		JFrame f = new JFrame();
		f.setSize(800, 800);
		MainContent m = new MainContent("Sản phẩm");
		m.addContent(new ListProductContent());
		f.setContentPane(m);
		
		f.setVisible(true);
	}
	
	public void initComponent() {
		setLayout(new BorderLayout(0, 0));
		
		JPanel panel = new JPanel();
		panel.setPreferredSize(new Dimension(10, 90));
		add(panel, BorderLayout.NORTH);
		SpringLayout sl_panel = new SpringLayout();
		panel.setLayout(sl_panel);
		
		JLabel lbSubTitle = new JLabel("Danh sách sản phẩm");
		lbSubTitle.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbSubTitle.setBorder(new EmptyBorder(5, 5, 0, 5));
		lbSubTitle.setHorizontalAlignment(SwingConstants.CENTER);
		lbSubTitle.setVerticalAlignment(SwingConstants.TOP);
		sl_panel.putConstraint(SpringLayout.NORTH, lbSubTitle, 10, SpringLayout.NORTH, panel);
		sl_panel.putConstraint(SpringLayout.WEST, lbSubTitle, 10, SpringLayout.WEST, panel);
		sl_panel.putConstraint(SpringLayout.SOUTH, lbSubTitle, 50, SpringLayout.NORTH, panel);
		panel.add(lbSubTitle);
		
		JPanel panel_1 = new JPanel();
		sl_panel.putConstraint(SpringLayout.WEST, panel_1, 241, SpringLayout.WEST, panel);
		sl_panel.putConstraint(SpringLayout.EAST, lbSubTitle, -6, SpringLayout.WEST, panel_1);
		sl_panel.putConstraint(SpringLayout.NORTH, panel_1, 40, SpringLayout.NORTH, panel);
		sl_panel.putConstraint(SpringLayout.SOUTH, panel_1, -10, SpringLayout.SOUTH, panel);
		panel.add(panel_1);
		panel_1.setLayout(new GridLayout(1, 0, 0, 0));
		
		JLabel lbSample = new JLabel("SearchBox");
		lbSample.setHorizontalAlignment(SwingConstants.CENTER);
		panel_1.add(lbSample);
		
		Button btnToInsertProduct = new Button();
		btnToInsertProduct.setIcon(ImageUtil.read(this.getClass().getResource("/icon/close_24px.png"), 24, 24));
		btnToInsertProduct.setText("Thêm sản phẩm");
		btnToInsertProduct.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnToInsertProduct.setIconTextGap(8);
		btnToInsertProduct.setForeground(Color.WHITE);
		btnToInsertProduct.setColor(new Color(27, 89, 248));
		btnToInsertProduct.setColorOver(new Color(60, 112, 239));	
		btnToInsertProduct.setColorClick(new Color(38, 69, 237));
		btnToInsertProduct.setFocusPainted(false);
		btnToInsertProduct.setBorderPainted(false);
		btnToInsertProduct.setBorderColor(btnToInsertProduct.getBackground());
		btnToInsertProduct.setRadius(20);
		sl_panel.putConstraint(SpringLayout.EAST, panel_1, -30, SpringLayout.WEST, btnToInsertProduct);
		sl_panel.putConstraint(SpringLayout.WEST, btnToInsertProduct, -200, SpringLayout.EAST, panel);
		sl_panel.putConstraint(SpringLayout.NORTH, btnToInsertProduct, 0, SpringLayout.NORTH, panel_1);
		sl_panel.putConstraint(SpringLayout.SOUTH, btnToInsertProduct, -10, SpringLayout.SOUTH, panel);
		sl_panel.putConstraint(SpringLayout.EAST, btnToInsertProduct, -22, SpringLayout.EAST, panel);
		panel.add(btnToInsertProduct);
		
		JLabel lbProductCount = new JLabel("Sản phẩm: 34");
		lbProductCount.setBorder(new EmptyBorder(0, 10, 0, 10));
		sl_panel.putConstraint(SpringLayout.NORTH, lbProductCount, 6, SpringLayout.SOUTH, lbSubTitle);
		sl_panel.putConstraint(SpringLayout.WEST, lbProductCount, 10, SpringLayout.WEST, panel);
		sl_panel.putConstraint(SpringLayout.SOUTH, lbProductCount, -10, SpringLayout.SOUTH, panel);
		sl_panel.putConstraint(SpringLayout.EAST, lbProductCount, -41, SpringLayout.WEST, panel_1);
		lbProductCount.setFont(new Font("Tahoma", Font.PLAIN, 12));
		panel.add(lbProductCount);
		
		JPanel panel_2 = new JPanel();
		panel_2.setBorder(new EmptyBorder(10, 20, 5, 20));
		add(panel_2, BorderLayout.CENTER);
		panel_2.setLayout(new GridLayout(1, 0, 0, 0));
		
		JScrollPane scrollPane = new JScrollPane();
		panel_2.add(scrollPane);
		tb = new ListProductTable(new ListProductTable.ListProductTableRes() {
			@Override
			public void setAmountProduct(int amount) {
				lbProductCount.setText("Sản phẩm: "+amount);
			}
		});
		scrollPane.setViewportView(tb);
		// TODO Auto-generated constructor stub
	}
	
//	public List<SanPham> getListSP(String condition) {
//		List<SanPham> list = new ArrayList<>();
//		if (condition == null) {
//			list = 
//		}
//	}
}
