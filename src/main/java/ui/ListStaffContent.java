package ui;

import component.table.staff.ListStaffTable;
import component.Button;
import utils.ImageUtil;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;

public class ListStaffContent extends JPanel {
	
	private ListStaffTable tb;

	public ListStaffContent() {
		initComponent();
		
//		fillTable();
	}
	
	public static void main(String[] args) {
		JFrame f = new JFrame();
		f.setSize(800, 800);
		MainContent m = new MainContent("Nhân viên");
		m.addContent(new ListStaffContent());
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
		
		JLabel lbSubTitle = new JLabel("Danh sách nhân viên");
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
		
		Button btnToInsert = new Button();
		btnToInsert.setIcon(ImageUtil.read(this.getClass().getResource("/icon/close_24px.png"), 24, 24));
		btnToInsert.setText("Thêm nhân viên");
		btnToInsert.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnToInsert.setIconTextGap(8);
		btnToInsert.setForeground(Color.WHITE);
		btnToInsert.setColor(new Color(27, 89, 248));
		btnToInsert.setColorOver(new Color(60, 112, 239));	
		btnToInsert.setColorClick(new Color(38, 69, 237));
		btnToInsert.setFocusPainted(false);
		btnToInsert.setBorderPainted(false);
		btnToInsert.setBorderColor(btnToInsert.getBackground());
		btnToInsert.setRadius(20);
		sl_panel.putConstraint(SpringLayout.EAST, panel_1, -30, SpringLayout.WEST, btnToInsert);
		sl_panel.putConstraint(SpringLayout.WEST, btnToInsert, -200, SpringLayout.EAST, panel);
		sl_panel.putConstraint(SpringLayout.NORTH, btnToInsert, 0, SpringLayout.NORTH, panel_1);
		sl_panel.putConstraint(SpringLayout.SOUTH, btnToInsert, -10, SpringLayout.SOUTH, panel);
		sl_panel.putConstraint(SpringLayout.EAST, btnToInsert, -22, SpringLayout.EAST, panel);
		panel.add(btnToInsert);
		
		JLabel lbStaffCount = new JLabel("Nhân viên: 34");
		lbStaffCount.setBorder(new EmptyBorder(0, 10, 0, 10));
		sl_panel.putConstraint(SpringLayout.NORTH, lbStaffCount, 6, SpringLayout.SOUTH, lbSubTitle);
		sl_panel.putConstraint(SpringLayout.WEST, lbStaffCount, 10, SpringLayout.WEST, panel);
		sl_panel.putConstraint(SpringLayout.SOUTH, lbStaffCount, -10, SpringLayout.SOUTH, panel);
		sl_panel.putConstraint(SpringLayout.EAST, lbStaffCount, -41, SpringLayout.WEST, panel_1);
		lbStaffCount.setFont(new Font("Tahoma", Font.PLAIN, 12));
		panel.add(lbStaffCount);
		
		JPanel panel_2 = new JPanel();
		panel_2.setBorder(new EmptyBorder(10, 20, 5, 20));
		add(panel_2, BorderLayout.CENTER);
		panel_2.setLayout(new GridLayout(1, 0, 0, 0));
		
		JScrollPane scrollPane = new JScrollPane();
		panel_2.add(scrollPane);
		tb = new ListStaffTable(new ListStaffTable.ListStaffTableRes() {
			@Override
			public void setAmountStaff(int amount) {
				lbStaffCount.setText("Nhân viên: " + amount);
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
