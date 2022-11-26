package ui;

import javax.swing.JPanel;
import javax.swing.SpringLayout;

import component.Button;
import component.CardProduct;
import component.textfield.TextField;
import entity.SanPham;
import utils.ImageUtil;

import java.awt.BorderLayout;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.RenderingHints;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;


import java.awt.FlowLayout;
import javax.swing.border.EmptyBorder;
import java.awt.CardLayout;
import javax.swing.BoxLayout;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JTextField;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Color;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.LayoutStyle.ComponentPlacement;
import java.awt.Cursor;
import javax.swing.border.TitledBorder;
import java.awt.Font;
import javax.swing.JRadioButton;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class POS extends JPanel {

	private JPanel containerProduct;
	private JTextField txtTimKiem;
	private JTable table;
	private TextField txtMaKH;
	private String[] headerHoaDon = new String[] {
			"Sản phẩm","Đơn giá","Số lượng","Thành tiền"
	};
	private DefaultTableModel modelHoaDon = new DefaultTableModel(null,headerHoaDon);
	private JLabel lblTong;
	private JLabel lblGiam;
	private JLabel lblThanhTien;
	private JRadioButton rdoZalopay;
	private JRadioButton rdoTienMat;
	private TextField txtTienKhachDua;
	private JLabel lblTienTraLai;
	private Button btnInHoaDon;
	private Button btnXoa;
	private Button btnLamMoi;

	/**
	 * Create the panel.
	 */
	public POS() {
		
		JPanel panel = new JPanel();
		
		JPanel panel_1 = new JPanel();
		
		
		JPanel panel_2 = new JPanel();
		panel.setLayout(new BorderLayout(0, 0));
		
		JPanel panel_3 = new JPanel();
		panel_3.setPreferredSize(new Dimension(10, 70));
		panel.add(panel_3, BorderLayout.NORTH);
		
		JPanel panelSearch = new JPanel() {
			@Override
		     protected void paintComponent(Graphics g) {
				super.paintComponent(g);
		        Dimension arcs = new Dimension(50,50); //Border corners arcs {width,height}, change this to whatever you want
		        int width = getWidth();
		        int height = getHeight();
		        Graphics2D graphics = (Graphics2D) g;
		        graphics.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);


		        //Draws the rounded panel with borders.
		        graphics.setColor(Color.white);
		        graphics.fillRoundRect(0, 0, width-1, height-1, arcs.width, arcs.height);//paint background
		        graphics.setColor(Color.white);
		        graphics.drawRoundRect(0, 0, width-1, height-1, arcs.width, arcs.height);//paint border
			     
			}
		        
		};
		panelSearch.setBorder(null);
		panelSearch.setOpaque(false);
		
		txtTimKiem = new JTextField("Enter your search...");
		txtTimKiem.setOpaque(false);
		txtTimKiem.setForeground(Color.GRAY);
		txtTimKiem.setColumns(10);
		txtTimKiem.setCaretColor(Color.black);
		txtTimKiem.setBorder(null);
		txtTimKiem.addFocusListener(new FocusListener() {
		    @Override
		    public void focusGained(FocusEvent e) {
		        if (txtTimKiem.getText().equals("Enter your search...")) {
		        	txtTimKiem.setText("");
		        	txtTimKiem.setForeground(Color.black);
		        }
		    }
		    @Override
		    public void focusLost(FocusEvent e) {
		        if (txtTimKiem.getText().isEmpty()) {
		        	txtTimKiem.setForeground(Color.GRAY);
		        	txtTimKiem.setText("Enter your search...");
		        }
		    }
		});
		
		JLabel btnSearch = new JLabel();
		btnSearch.setHorizontalTextPosition(SwingConstants.CENTER);
		btnSearch.setHorizontalAlignment(SwingConstants.CENTER);
		btnSearch.setIcon(ImageUtil.read(getClass().getResource("../icon/search24.png")));
		
		GroupLayout gl_panel_2_1 = new GroupLayout(panelSearch);
		gl_panel_2_1.setHorizontalGroup(
			gl_panel_2_1.createParallelGroup(Alignment.TRAILING)
				.addGroup(gl_panel_2_1.createSequentialGroup()
					.addGap(21)
					.addComponent(txtTimKiem, GroupLayout.DEFAULT_SIZE, 426, Short.MAX_VALUE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(btnSearch, GroupLayout.PREFERRED_SIZE, 30, GroupLayout.PREFERRED_SIZE)
					.addGap(22))
		);
		gl_panel_2_1.setVerticalGroup(
			gl_panel_2_1.createParallelGroup(Alignment.LEADING)
				.addGroup(Alignment.TRAILING, gl_panel_2_1.createSequentialGroup()
					.addComponent(btnSearch, GroupLayout.DEFAULT_SIZE, 39, Short.MAX_VALUE)
					.addGap(3))
				.addComponent(txtTimKiem, GroupLayout.DEFAULT_SIZE, 42, Short.MAX_VALUE)
		);
		panelSearch.setLayout(gl_panel_2_1);
		
		JPanel panelQR = new JPanel() {
			@Override
		     protected void paintComponent(Graphics g) {
				super.paintComponent(g);
		        Dimension arcs = new Dimension(20,20); //Border corners arcs {width,height}, change this to whatever you want
		        int width = getWidth();
		        int height = getHeight();
		        Graphics2D graphics = (Graphics2D) g;
		        graphics.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);


		        //Draws the rounded panel with borders.
		        graphics.setColor(Color.white);
		        graphics.fillRoundRect(0, 0, width-1, height-1, arcs.width, arcs.height);//paint background
		        graphics.setColor(Color.white);
		        graphics.drawRoundRect(0, 0, width-1, height-1, arcs.width, arcs.height);//paint border
			     
			}
		};
		panelQR.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		panelQR.setSize(new Dimension(48, 48));
		panelQR.setMaximumSize(new Dimension(48, 48));
		GroupLayout gl_panel_3 = new GroupLayout(panel_3);
		gl_panel_3.setHorizontalGroup(
			gl_panel_3.createParallelGroup(Alignment.LEADING)
				.addGroup(Alignment.TRAILING, gl_panel_3.createSequentialGroup()
					.addGap(60)
					.addComponent(panelSearch, GroupLayout.DEFAULT_SIZE, 487, Short.MAX_VALUE)
					.addGap(18)
					.addComponent(panelQR, GroupLayout.PREFERRED_SIZE, 48, GroupLayout.PREFERRED_SIZE)
					.addContainerGap())
		);
		gl_panel_3.setVerticalGroup(
			gl_panel_3.createParallelGroup(Alignment.TRAILING)
				.addGroup(gl_panel_3.createSequentialGroup()
					.addGroup(gl_panel_3.createParallelGroup(Alignment.LEADING)
						.addGroup(gl_panel_3.createSequentialGroup()
							.addGap(14)
							.addComponent(panelSearch, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
						.addGroup(gl_panel_3.createSequentialGroup()
							.addContainerGap()
							.addComponent(panelQR, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
					.addContainerGap())
		);
		panelQR.setLayout(new BorderLayout(0, 0));
		
		JLabel lblQR = new JLabel();
		lblQR.setSize(new Dimension(48, 48));
		lblQR.setIcon(ImageUtil.read(getClass().getResource("../icon/QR.png")));
		panelQR.add(lblQR, BorderLayout.CENTER);
		panel_3.setLayout(gl_panel_3);
		
		JScrollPane scrollPane = new JScrollPane();
		panel.add(scrollPane, BorderLayout.CENTER);
		
		
		
		
		containerProduct = new JPanel();
		scrollPane.setViewportView(containerProduct);
		containerProduct.setLayout(new BoxLayout(containerProduct, BoxLayout.Y_AXIS));
		GroupLayout groupLayout = new GroupLayout(this);
		groupLayout.setHorizontalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addComponent(panel, GroupLayout.DEFAULT_SIZE, 623, Short.MAX_VALUE)
					.addGap(6)
					.addComponent(panel_2, GroupLayout.DEFAULT_SIZE, 561, Short.MAX_VALUE)
					.addGap(10))
		);
		groupLayout.setVerticalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addComponent(panel, GroupLayout.DEFAULT_SIZE, 790, Short.MAX_VALUE)
					.addGap(10))
				.addGroup(groupLayout.createSequentialGroup()
					.addComponent(panel_2, GroupLayout.DEFAULT_SIZE, 790, Short.MAX_VALUE)
					.addGap(10))
		);
		
		JPanel panel_4 = new JPanel();
		panel_4.setBorder(new TitledBorder(null, "H\u00F3a \u0111\u01A1n", TitledBorder.CENTER, TitledBorder.TOP,
				
				new Font("Tahoma", Font.BOLD, 26), new Color(31,174,255)));
		
		txtMaKH = new TextField();
		txtMaKH.setOpaque(false);
		txtMaKH.setLabelText("Mã khách hàng");
		txtMaKH.setFont(new Font("Tahoma", Font.PLAIN, 14));
		
		JLabel lblNewLabel = new JLabel("Tổng:");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 20));
		
		lblTong = new JLabel("200.000đ");
		lblTong.setFont(new Font("Tahoma", Font.BOLD, 20));
		
		JLabel lblGim = new JLabel("Giảm:");
		lblGim.setFont(new Font("Tahoma", Font.BOLD, 20));
		
		lblGiam = new JLabel("10%");
		lblGiam.setFont(new Font("Tahoma", Font.BOLD, 20));
		
		JLabel lblThnhTin = new JLabel("Thành tiền:");
		lblThnhTin.setFont(new Font("Tahoma", Font.BOLD, 20));
		
		lblThanhTien = new JLabel("180.000đ");
		lblThanhTien.setFont(new Font("Tahoma", Font.BOLD, 20));
		
		JLabel lblPhngThcThanh = new JLabel("Phương thức thanh toán:");
		lblPhngThcThanh.setFont(new Font("Tahoma", Font.BOLD, 20));
		
		rdoTienMat = new JRadioButton("Tiền mặt");
		rdoTienMat.setFont(new Font("Tahoma", Font.PLAIN, 14));
		
		rdoZalopay = new JRadioButton("Zalopay");
		rdoZalopay.setFont(new Font("Tahoma", Font.PLAIN, 14));

		Button btnThanhToan = new Button();
		btnThanhToan.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnThanhToan.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btnThanhToan.setForeground(Color.white);
		btnThanhToan.setText("Thanh toán");
		btnThanhToan.setRadius(30);
		btnThanhToan.setColor(new Color(31,174,255));
		btnThanhToan.setColorOver(new Color(90,193,251));
		btnThanhToan.setColorClick(new Color(31,174,255));
		btnThanhToan.setBorderColor(Color.white);
		
		btnInHoaDon = new Button();
		btnInHoaDon.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnInHoaDon.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btnInHoaDon.setText("In hóa đơn");
		btnInHoaDon.setRadius(30);
		btnInHoaDon.setForeground(Color.WHITE);
		btnInHoaDon.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btnInHoaDon.setColorOver(new Color(90, 193, 251));
		btnInHoaDon.setColorClick(new Color(31, 174, 255));
		btnInHoaDon.setColor(new Color(31, 174, 255));
		btnInHoaDon.setBorderColor(Color.WHITE);
		
		btnLamMoi = new Button();
		btnLamMoi.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnLamMoi.setText("Làm mới");
		btnLamMoi.setRadius(30);
		btnLamMoi.setForeground(Color.WHITE);
		btnLamMoi.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btnLamMoi.setColorOver(new Color(90, 193, 251));
		btnLamMoi.setColorClick(new Color(31, 174, 255));
		btnLamMoi.setColor(new Color(31, 174, 255));
		btnLamMoi.setBorderColor(Color.WHITE);
		
		btnXoa = new Button();
		btnXoa.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnXoa.setText("Xóa");
		btnXoa.setRadius(30);
		btnXoa.setForeground(Color.WHITE);
		btnXoa.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btnXoa.setColorOver(new Color(90, 193, 251));
		btnXoa.setColorClick(new Color(31, 174, 255));
		btnXoa.setColor(new Color(31, 174, 255));
		btnXoa.setBorderColor(Color.WHITE);
		
		txtTienKhachDua = new TextField();
		txtTienKhachDua.setOpaque(false);
		txtTienKhachDua.setLabelText("Tiền khách đưa");
		txtTienKhachDua.setFont(new Font("Tahoma", Font.PLAIN, 14));
		
		JLabel lblThnhTin_1 = new JLabel("Tiền trả lại:");
		lblThnhTin_1.setFont(new Font("Tahoma", Font.BOLD, 20));
		
		lblTienTraLai = new JLabel("22.000đ");
		lblTienTraLai.setFont(new Font("Tahoma", Font.BOLD, 20));
		
		GroupLayout gl_panel_2 = new GroupLayout(panel_2);
		gl_panel_2.setHorizontalGroup(
			gl_panel_2.createParallelGroup(Alignment.TRAILING)
				.addComponent(panel_4, GroupLayout.DEFAULT_SIZE, 592, Short.MAX_VALUE)
				.addGroup(gl_panel_2.createSequentialGroup()
					.addContainerGap()
					.addComponent(txtMaKH, GroupLayout.DEFAULT_SIZE, 331, Short.MAX_VALUE)
					.addGap(251))
				.addGroup(gl_panel_2.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblNewLabel, GroupLayout.DEFAULT_SIZE, 93, Short.MAX_VALUE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(lblTong, GroupLayout.DEFAULT_SIZE, 473, Short.MAX_VALUE)
					.addContainerGap())
				.addGroup(gl_panel_2.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblGim, GroupLayout.DEFAULT_SIZE, 93, Short.MAX_VALUE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(lblGiam, GroupLayout.DEFAULT_SIZE, 473, Short.MAX_VALUE)
					.addContainerGap())
				.addGroup(gl_panel_2.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblThnhTin, GroupLayout.DEFAULT_SIZE, 132, Short.MAX_VALUE)
					.addGap(18)
					.addComponent(lblThanhTien, GroupLayout.DEFAULT_SIZE, 422, Short.MAX_VALUE)
					.addContainerGap())
				.addGroup(Alignment.LEADING, gl_panel_2.createSequentialGroup()
					.addContainerGap()
					.addGroup(gl_panel_2.createParallelGroup(Alignment.LEADING)
						.addGroup(gl_panel_2.createSequentialGroup()
							.addComponent(rdoTienMat, GroupLayout.PREFERRED_SIZE, 50, Short.MAX_VALUE)
							.addPreferredGap(ComponentPlacement.UNRELATED)
							.addComponent(rdoZalopay, GroupLayout.PREFERRED_SIZE, 55, Short.MAX_VALUE)
							.addGap(367))
						.addGroup(gl_panel_2.createSequentialGroup()
							.addComponent(lblPhngThcThanh, GroupLayout.DEFAULT_SIZE, 254, Short.MAX_VALUE)
							.addGap(328))))
				.addGroup(Alignment.LEADING, gl_panel_2.createSequentialGroup()
					.addContainerGap()
					.addComponent(txtTienKhachDua, GroupLayout.DEFAULT_SIZE, 240, Short.MAX_VALUE)
					.addGap(342))
				.addGroup(Alignment.LEADING, gl_panel_2.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblThnhTin_1, GroupLayout.DEFAULT_SIZE, 128, Short.MAX_VALUE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(lblTienTraLai, GroupLayout.DEFAULT_SIZE, 438, Short.MAX_VALUE)
					.addContainerGap())
				.addGroup(Alignment.LEADING, gl_panel_2.createSequentialGroup()
					.addGap(48)
					.addComponent(btnThanhToan, GroupLayout.DEFAULT_SIZE, 115, Short.MAX_VALUE)
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addComponent(btnInHoaDon, GroupLayout.DEFAULT_SIZE, 115, Short.MAX_VALUE)
					.addGap(18)
					.addComponent(btnXoa, GroupLayout.DEFAULT_SIZE, 116, Short.MAX_VALUE)
					.addGap(18)
					.addComponent(btnLamMoi, GroupLayout.DEFAULT_SIZE, 105, Short.MAX_VALUE)
					.addGap(47))
		);
		gl_panel_2.setVerticalGroup(
			gl_panel_2.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel_2.createSequentialGroup()
					.addContainerGap()
					.addComponent(panel_4, GroupLayout.PREFERRED_SIZE, 398, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(txtMaKH, GroupLayout.PREFERRED_SIZE, 47, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(gl_panel_2.createParallelGroup(Alignment.LEADING, false)
						.addComponent(lblTong, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
						.addComponent(lblNewLabel, GroupLayout.PREFERRED_SIZE, 34, GroupLayout.PREFERRED_SIZE))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(gl_panel_2.createParallelGroup(Alignment.LEADING, false)
						.addComponent(lblGim, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
						.addComponent(lblGiam, GroupLayout.DEFAULT_SIZE, 41, Short.MAX_VALUE))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(gl_panel_2.createParallelGroup(Alignment.BASELINE)
						.addComponent(lblThnhTin, GroupLayout.DEFAULT_SIZE, 34, Short.MAX_VALUE)
						.addComponent(lblThanhTien, GroupLayout.DEFAULT_SIZE, 34, Short.MAX_VALUE))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(lblPhngThcThanh, GroupLayout.PREFERRED_SIZE, 43, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(gl_panel_2.createParallelGroup(Alignment.BASELINE)
						.addComponent(rdoTienMat, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
						.addComponent(rdoZalopay, GroupLayout.DEFAULT_SIZE, 25, Short.MAX_VALUE))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(txtTienKhachDua, GroupLayout.PREFERRED_SIZE, 47, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addGroup(gl_panel_2.createParallelGroup(Alignment.LEADING)
						.addComponent(lblThnhTin_1, GroupLayout.DEFAULT_SIZE, 34, Short.MAX_VALUE)
						.addComponent(lblTienTraLai, GroupLayout.DEFAULT_SIZE, 34, Short.MAX_VALUE))
					.addGap(55)
					.addGroup(gl_panel_2.createParallelGroup(Alignment.BASELINE)
						.addComponent(btnThanhToan, GroupLayout.PREFERRED_SIZE, 37, GroupLayout.PREFERRED_SIZE)
						.addComponent(btnInHoaDon, GroupLayout.PREFERRED_SIZE, 37, GroupLayout.PREFERRED_SIZE)
						.addComponent(btnXoa, GroupLayout.PREFERRED_SIZE, 37, GroupLayout.PREFERRED_SIZE)
						.addComponent(btnLamMoi, GroupLayout.PREFERRED_SIZE, 37, GroupLayout.PREFERRED_SIZE))
					.addGap(39))
		);
		panel_4.setLayout(new BorderLayout(0, 0));
		
		JScrollPane scrollPane_1 = new JScrollPane();
		panel_4.add(scrollPane_1, BorderLayout.CENTER);
		
		table = new JTable();
		table.setFont(new Font("Tahoma", Font.PLAIN, 14));
		scrollPane_1.setViewportView(table);
		table.setModel(modelHoaDon);
		
		panel_2.setLayout(gl_panel_2);
		setLayout(groupLayout);
		testData();

	}
	
	public void loadProduct(List<SanPham> list) {
		int len = list.size();
		for(int i=0;i<len;i+=3) {
			JPanel row = new JPanel();
			row.setLayout(new GridLayout(1, 3, 10, 10));
			row.setBorder(new EmptyBorder(5,10,5,10));
			if(i<len)
				row.add(new CardProduct(list.get(i).getTenSP(),list.get(i).getGiaSP(),list.get(i).getTenNCC(),ImageUtil.read(getClass().getResource("../image/"+list.get(i).getHinh()))));
			
			if(i+1<len)
				row.add(new CardProduct(list.get(i+1).getTenSP(),list.get(i+1).getGiaSP(),list.get(i+1).getTenNCC(),ImageUtil.read(getClass().getResource("../image/"+list.get(i).getHinh()))));
			else
				row.add(new JPanel());
			
			if(i+2<len)
				row.add(new CardProduct(list.get(i+2).getTenSP(),list.get(i+2).getGiaSP(),list.get(i+2).getTenNCC(),ImageUtil.read(getClass().getResource("../image/"+list.get(i).getHinh()))));
			else
				row.add(new JPanel());
			
			containerProduct.add(row);
		}
	}
	
	public void testData() {
		List<SanPham> list = new ArrayList<SanPham>();
		
		for(int i=0;i<20;i++) {
			SanPham sp = new SanPham();
			sp.setTenSP("Sua Milo");
			sp.setGiaSP(100000);
			sp.setTenNCC("ABC");
			sp.setHinh("SuaMiLo.png");
			list.add(sp);
		}
		loadProduct(list);
	}
}
