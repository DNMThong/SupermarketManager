package ui;

import javax.swing.*;

import component.Button;
import component.CardProduct;
import component.textfield.TextField;
import dao.ChiTietHoaDonDAO;
import dao.HoaDonDAO;
import dao.KhachHangDAO;
import entity.ChiTietHoaDon;
import entity.HoaDon;
import entity.KhachHang;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;
import org.apache.commons.math3.stat.descriptive.summary.Product;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONObject;
import utils.crypto.HMACUtil;
import utils.*;

import java.awt.*;
import java.awt.event.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;


import javax.swing.border.EmptyBorder;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.border.TitledBorder;
import javax.swing.table.TableCellRenderer;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class POS extends JPanel {

	private JPanel containerProduct;
	private JTextField txtTimKiem;
	private JTable table;
	private TextField txtMaKH;
	private String[] headerHoaDon = new String[] {
			"Sản phẩm","Đơn giá","Số lượng","Thành tiền"
	};
	private DefaultTableModel modelHoaDon = new DefaultTableModel(null,headerHoaDon) {
		@Override
		public boolean isCellEditable(int row, int column) {
			return column==2;
		}
	};
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

	public List<Object[]> products = new ArrayList<Object[]>();

	public HashMap<Object[],Integer> listHD = new HashMap<Object[],Integer>();

	String placeholder = "Mã sản phẩm hoặc tên sản phẩm";
	private JLabel lblBarcode;
	private KhachHang khachHang;

	private int discount = 0;
	private int sum = 0;

	private int total = 0;
	private Button btnThanhToan;

	private String maHD;

	/**
	 * Create the panel.
	 */
	public POS() {
		initUI();
		loadProduct();
		fillProduct(products);
	}

	public void initUI() {
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

		txtTimKiem = new JTextField(placeholder);
		txtTimKiem.setOpaque(false);
		txtTimKiem.setForeground(Color.GRAY);
		txtTimKiem.setColumns(10);
		txtTimKiem.setCaretColor(Color.black);
		txtTimKiem.setBorder(null);

		txtTimKiem.addFocusListener(new FocusListener() {
			@Override
			public void focusGained(FocusEvent e) {
				if (txtTimKiem.getText().equals(placeholder)) {
					txtTimKiem.setText("");
					txtTimKiem.setForeground(Color.black);
				}
			}
			@Override
			public void focusLost(FocusEvent e) {
				if (txtTimKiem.getText().isEmpty()) {
					txtTimKiem.setForeground(Color.GRAY);
					txtTimKiem.setText(placeholder);
				}
			}
		});

		txtTimKiem.addKeyListener(new handleKeyListenerTxtTimkiem());

		JLabel btnSearch = new JLabel();
		btnSearch.setHorizontalTextPosition(SwingConstants.CENTER);
		btnSearch.setHorizontalAlignment(SwingConstants.CENTER);
		btnSearch.setIcon(ImageUtil.read(getClass().getResource("../icon/search24.png")));
		btnSearch.setCursor(new Cursor(Cursor.HAND_CURSOR));

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

		lblBarcode = new JLabel();
		lblBarcode.setSize(new Dimension(48, 48));
		lblBarcode.setIcon(ImageUtil.read(getClass().getResource("../icon/QR.png")));
		lblBarcode.addMouseListener(new handleScanBarcode());
		panelQR.add(lblBarcode, BorderLayout.CENTER);
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
		txtMaKH.addKeyListener(new handleKeyListenerTxtKH());

		JLabel lblNewLabel = new JLabel("Tổng:");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 20));

		lblTong = new JLabel();
		lblTong.setFont(new Font("Tahoma", Font.BOLD, 20));

		JLabel lblGim = new JLabel("Giảm:");
		lblGim.setFont(new Font("Tahoma", Font.BOLD, 20));

		lblGiam = new JLabel();
		lblGiam.setFont(new Font("Tahoma", Font.BOLD, 20));

		JLabel lblThnhTin = new JLabel("Thành tiền:");
		lblThnhTin.setFont(new Font("Tahoma", Font.BOLD, 20));

		lblThanhTien = new JLabel();
		lblThanhTien.setFont(new Font("Tahoma", Font.BOLD, 20));

		JLabel lblPhngThcThanh = new JLabel("Phương thức thanh toán:");
		lblPhngThcThanh.setFont(new Font("Tahoma", Font.BOLD, 20));

		rdoTienMat = new JRadioButton("Tiền mặt");
		rdoTienMat.setFont(new Font("Tahoma", Font.PLAIN, 14));
		rdoTienMat.setSelected(true);

		rdoZalopay = new JRadioButton("Zalopay");
		rdoZalopay.setFont(new Font("Tahoma", Font.PLAIN, 14));
		ButtonGroup btnGroupTT = new ButtonGroup();
		btnGroupTT.add(rdoTienMat);
		btnGroupTT.add(rdoZalopay);

		btnThanhToan = new Button();
		btnThanhToan.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnThanhToan.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btnThanhToan.setForeground(Color.white);
		btnThanhToan.setText("Thanh toán");
		btnThanhToan.setRadius(30);
		btnThanhToan.setColor(new Color(31,174,255));
		btnThanhToan.setColorOver(new Color(90,193,251));
		btnThanhToan.setColorClick(new Color(31,174,255));
		btnThanhToan.setBorderColor(Color.white);
		btnThanhToan.addActionListener(new handleBtnThanhToan());

		btnInHoaDon = new Button();
		btnInHoaDon.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));

		btnInHoaDon.setText("In hóa đơn");
		btnInHoaDon.setRadius(30);
		btnInHoaDon.setForeground(Color.WHITE);
		btnInHoaDon.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btnInHoaDon.setColorOver(new Color(90, 193, 251));
		btnInHoaDon.setColorClick(new Color(31, 174, 255));
		btnInHoaDon.setColor(new Color(31, 174, 255));
		btnInHoaDon.setBorderColor(Color.WHITE);
		btnInHoaDon.addActionListener(new handlePrintBill());

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
		btnLamMoi.addActionListener(new handleBtnLamMoi());

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
		btnXoa.addActionListener(new handleBtnXoa());

		txtTienKhachDua = new TextField();
		txtTienKhachDua.setOpaque(false);
		txtTienKhachDua.setLabelText("Tiền khách đưa");
		txtTienKhachDua.setFont(new Font("Tahoma", Font.PLAIN, 14));
		txtTienKhachDua.addKeyListener(new handleKeyListenerTxtTienKhachDua());

		JLabel lblThnhTin_1 = new JLabel("Tiền trả lại:");
		lblThnhTin_1.setFont(new Font("Tahoma", Font.BOLD, 20));

		lblTienTraLai = new JLabel();
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
		modelHoaDon.addTableModelListener(new handleChangeAmount());

		panel_2.setLayout(gl_panel_2);
		setLayout(groupLayout);
	}
	
	public void fillProduct(List<Object[]> list) {
		containerProduct.removeAll();
		int len = list.size();
		for(int i=0;i<len;i+=3) {
			JPanel row = new JPanel();
			row.setMaximumSize(new Dimension(1000,300));
			row.setMinimumSize(new Dimension(1000,300));
			row.setLayout(new GridLayout(1, 3, 10, 10));
			row.setBorder(new EmptyBorder(5,10,5,10));

			if(i<len)
				row.add(new CardProduct(list.get(i)[2] + "", Integer.parseInt(list.get(i)[7] + ""), list.get(i)[4] + "", ImageUtil.read(getClass().getResource("../image/" + list.get(i)[3]), 200, 150), actionButtonAdd(list.get(i))));

			if(i+1<len)
				row.add(new CardProduct(list.get(i + 1)[2] + "", Integer.parseInt(list.get(i + 1)[7] + ""), list.get(i + 1)[4] + "", ImageUtil.read(getClass().getResource("../image/" + list.get(i + 1)[3]), 200, 150), actionButtonAdd(list.get(i+1))));
			else
				row.add(new JPanel());

			if(i+2<len)
				row.add(new CardProduct(list.get(i + 2)[2] + "", Integer.parseInt(list.get(i + 2)[7] + ""), list.get(i + 2)[4] + "", ImageUtil.read(getClass().getResource("../image/" + list.get(i + 2)[3]), 200, 150), actionButtonAdd(list.get(i+2))));
			else
				row.add(new JPanel());

			containerProduct.add(row);
		}
		if(len==0) {
			JPanel panel = new JPanel(new BorderLayout());
			JLabel lbl = new JLabel("Không có sản phẩm nào");
			lbl.setForeground(new Color(31,174,255));
			lbl.setHorizontalAlignment(SwingConstants.CENTER);
			panel.add(lbl,BorderLayout.CENTER);
			containerProduct.add(panel);
		}
		containerProduct.revalidate();
		containerProduct.repaint();
	}

	private ActionListener actionButtonAdd(Object[] product) {
			ActionListener action = (e) -> {
				if(listHD.containsKey(product)) {
					listHD.put(product,listHD.get(product)+1);
				}else {
					listHD.put(product,1);
				}
				fillHD();
				sumCurrency();
				displayTotal();
			};
			return action;
	};

	private void fillHD() {
		modelHoaDon.setRowCount(0);
		listHD.forEach((product,amount) -> {
			modelHoaDon.addRow(new Object[] {
					product[2],
					CurrencyUtil.format(Integer.parseInt(product[7]+"")),
					amount,
					CurrencyUtil.format(amount*Integer.parseInt(product[7]+""))
			});
		});
	}

	private void sumCurrency() {
		AtomicInteger rs = new AtomicInteger(0);
		listHD.forEach((product,amount) -> {
			rs.addAndGet((amount * Integer.parseInt(product[7] + "")));
		});
		sum = rs.get();
		lblTong.setText(CurrencyUtil.format(rs.get()));
	}

	public void loadProduct() {
		products.clear();
		String query = "select * from view_BanSanPham where MaSP like ? or TenSP like ?";
		String searchValue = txtTimKiem.getText();
		if(searchValue.equals(placeholder)) {
			searchValue = "";
		}
		try {
			ResultSet rs = JDBCUtil.query(query,"%"+searchValue+"%","%"+searchValue+"%");
			while (rs.next()) {
				Object[] product = new Object[]{
						rs.getString(1),   // MaSP
						rs.getString(2),   // MaPhieuXuat
						rs.getString(3),   // TenSP
						rs.getString(4),	  // Hinh
						rs.getString(5),   // TenNCC
						rs.getString(6),   // DonViTinh
						rs.getString(7),   // TenLoai
						rs.getInt(8),      // Gia
				};
				products.add(product);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Object[]> searchProduct(String searchValue) {
		List<Object[]> listProduct = new ArrayList<Object[]>();
		String query = "select * from view_BanSanPham where MaSP like ? or TenSP like ?";
		if(searchValue.equals(placeholder)) {
			searchValue = "";
		}
		try {
			ResultSet rs = JDBCUtil.query(query,"%"+searchValue+"%","%"+searchValue+"%");
			while (rs.next()) {
				Object[] product = new Object[]{
						rs.getString(1),   // MaSP
						rs.getString(2),   // MaPhieuXuat
						rs.getString(3),   // TenSP
						rs.getString(4),	  // Hinh
						rs.getString(5),   // TenNCC
						rs.getString(6),   // DonViTinh
						rs.getString(7),   // TenLoai
						rs.getInt(8),      // Gia
				};
				listProduct.add(product);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return listProduct;
	}

	public int discount(int doThanMat) {
		if(doThanMat==1) {
			return 2;
		}else if(doThanMat==2) {
			return 5;
		}else if(doThanMat==3) {
			return 10;
		}else {
			return 0;
		}
	}

	public KhachHang getKH() {
		KhachHangDAO khd = new KhachHangDAO();
		KhachHang kh = khd.selectById(txtMaKH.getText());
		return kh;
	}

	public void displayTotal() {
		total = sum*(100-discount)/100;
		lblThanhTien.setText(CurrencyUtil.format(total));
	}

	public Object[] getKeyHDSelected(String tenSP) {
		Optional<Map.Entry<Object[], Integer>> product = listHD.entrySet().stream().filter(i -> i.getKey()[2].equals(tenSP)).findFirst();
		return product.get().getKey();
	}

	public void clearHD() {
		maHD = null;
		discount = 0;
		total = 0;
		sum = 0;
		listHD.clear();
		txtTienKhachDua.setText("");
		txtMaKH.setText("");
		lblGiam.setText("");
		fillHD();
		sumCurrency();
		displayTotal();
	}

	public void addHD(String maHD) {

		HoaDonDAO hdd = new HoaDonDAO();
		ChiTietHoaDonDAO cthdd = new ChiTietHoaDonDAO();
		String maNV = Auth.user.getMaNhanVien();
		String maKH = txtMaKH.getText().trim();
		try {
			hdd.insert(new HoaDon(maHD, maNV, maKH,new Date()));
			listHD.forEach((product,amount) -> {
				cthdd.insert(new ChiTietHoaDon(
						maHD,
						product[0]+"",
						product[1]+"",
						amount
				));
			});
			Alert.success("Thêm hóa đơn thành công!!!!");
		}catch (Exception e) {
			Alert.error("Thêm thất bại!!!");
		}
	}
	private Map<String, String> config = new HashMap<String, String>(){{
		put("app_id", "2554");
		put("key1", "sdngKKJmqEMzvh5QQcdD2A9XBSKUNaYn");
		put("key2", "trMrHtvjo6myautxDUiAcYsVtaeQ8nhf");
		put("endpoint", "https://sb-openapi.zalopay.vn/v2/create");
	}};

	public String getCurrentTimeString(String format) {
		Calendar cal = new GregorianCalendar(TimeZone.getTimeZone("GMT+7"));
		SimpleDateFormat fmt = new SimpleDateFormat(format);
		fmt.setCalendar(cal);
		return fmt.format(cal.getTimeInMillis());
	}
	public void zalopay(String maHD) throws IOException, URISyntaxException {
		Random rand = new Random();
		final int random_id = rand.nextInt(1000000);
		final Map embed_data = new HashMap(){{}};

		final Map[] item = {
				new HashMap(){{}}
		};

		Map<String, Object> order = new HashMap<String, Object>(){{
			put("app_id", config.get("app_id"));
			put("app_trans_id", getCurrentTimeString("yyMMdd") +"_"+ random_id); // translation missing: vi.docs.shared.sample_code.comments.app_trans_id
			put("app_time", System.currentTimeMillis()); // miliseconds
			put("app_user", "user123");
			put("amount", total);
			put("description", "Payment for the order #"+random_id);
			put("bank_code", "zalopayapp");
			put("item", "[]");
			put("embed_data", "{}");
		}};

		// app_id +”|”+ app_trans_id +”|”+ appuser +”|”+ amount +"|" + app_time +”|”+ embed_data +"|" +item
		String data = order.get("app_id") +"|"+ order.get("app_trans_id") +"|"+ order.get("app_user") +"|"+ order.get("amount")
				+"|"+ order.get("app_time") +"|"+ order.get("embed_data") +"|"+ order.get("item");
		order.put("mac", HMACUtil.HMacHexStringEncode(HMACUtil.HMACSHA256, config.get("key1"), data));
		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost post = new HttpPost(config.get("endpoint"));

		List<NameValuePair> params = new ArrayList<NameValuePair>();
		for (Map.Entry<String, Object> e : order.entrySet()) {
			params.add(new BasicNameValuePair(e.getKey(), e.getValue().toString()));
		}

		// Content-Type: application/x-www-form-urlencoded
		post.setEntity(new UrlEncodedFormEntity(params));

		CloseableHttpResponse res = client.execute(post);
		BufferedReader rd = new BufferedReader(new InputStreamReader(res.getEntity().getContent()));
		StringBuilder resultJsonStr = new StringBuilder();
		String line;

		while ((line = rd.readLine()) != null) {
			resultJsonStr.append(line);
		}

		JSONObject result = new JSONObject(resultJsonStr.toString());
		String url = (String) result.get("order_url");
		Desktop.getDesktop().browse(new URI(url));
	}

	public void printBill(String maHoaDon) throws JRException {
		String reportSource = getClass().getResource("/reports/InHoaDon.jrxml").getPath();
		JasperDesign jdesign = JRXmlLoader.load(reportSource);
		String query = "SELECT * FROM [QLDA_SieuThi].[dbo].[ChiTietHoaDon] where MaHD like '"+maHoaDon+"'";
		System.out.println(query);

		JRDesignQuery updateQuery = new JRDesignQuery();
		updateQuery.setText(query);

		jdesign.setQuery(updateQuery);

		JasperReport jreport = JasperCompileManager.compileReport(jdesign);
		JasperPrint jprint = JasperFillManager.fillReport(jreport, null,JDBCUtil.getConnect());

		JasperViewer.viewReport(jprint,false);
	}

	class handlePrintBill implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			if(maHD == null) {
				Alert.error("Vui lòng thanh toán trước khi in hóa đơn");
			}else {
				try {
					printBill(maHD);
				} catch (JRException ex) {
					throw new RuntimeException(ex);
				}
			}
		}
	}

	class handleBtnThanhToan implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			UUID uuid = UUID.randomUUID();
			if(rdoTienMat.isSelected()) {
				maHD = uuid.toString();
				addHD(maHD);
			}else {
				try {
					zalopay(uuid.toString());
				} catch (IOException ex) {
					throw new RuntimeException(ex);
				} catch (URISyntaxException ex) {
					throw new RuntimeException(ex);
				}
//				addHD(uuid.toString());
			}


		}
	}

	class handleBtnXoa implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			int rowSelected = table.getSelectedRow();
			if(rowSelected>-1) {
				String tenSP = modelHoaDon.getValueAt(rowSelected,0) + "";
				Object[] product = getKeyHDSelected(tenSP);
				listHD.remove(product);
				fillHD();
				sumCurrency();
				displayTotal();
			}
		}
	}

	class handleBtnLamMoi implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			clearHD();
		}
	}

	class handleChangeAmount implements TableModelListener {

		@Override
		public void tableChanged(TableModelEvent e) {

			int rowSelected = table.getSelectedRow();
			if(rowSelected>-1&&e.getColumn()>-1) {
				int amount = Integer.parseInt(modelHoaDon.getValueAt(rowSelected,e.getColumn())+"");
				String tenSP = modelHoaDon.getValueAt(rowSelected,0) + "";
				Object[] product = getKeyHDSelected(tenSP);
				if(listHD.containsKey(product)) {
					listHD.put(product,amount);
				}
				fillHD();
				sumCurrency();
				displayTotal();
			}
		}
	}
	class handleKeyListenerTxtTienKhachDua implements KeyListener {

		@Override
		public void keyTyped(KeyEvent e) {

		}

		@Override
		public void keyPressed(KeyEvent e) {

		}

		@Override
		public void keyReleased(KeyEvent e) {
			Util.setTimeout(() -> {
				int tienKhachDua = Integer.parseInt(txtTienKhachDua.getText());
				lblTienTraLai.setText(CurrencyUtil.format(tienKhachDua - total));
			},500);
		}
	}
	class handleKeyListenerTxtKH implements KeyListener {

		@Override
		public void keyTyped(KeyEvent e) {

		}

		@Override
		public void keyPressed(KeyEvent e) {

		}

		@Override
		public void keyReleased(KeyEvent e) {
			Util.setTimeout(() -> {
				khachHang = getKH();
				if(khachHang==null) {
					lblGiam.setText("0%");
					discount = 0;
				}else {
					lblGiam.setText(discount(khachHang.getDoThanMat())+"%");
					discount = discount(khachHang.getDoThanMat());
				}
				displayTotal();
			},500);
		}
	}

	class handleKeyListenerTxtTimkiem implements KeyListener {

		@Override
		public void keyTyped(KeyEvent e) {

		}

		@Override
		public void keyPressed(KeyEvent e) {

		}

		@Override
		public void keyReleased(KeyEvent e) {
			Util.setTimeout(() -> {
				loadProduct();
				fillProduct(products);
			},500);
		}
	}



	class handleScanBarcode implements MouseListener {

		@Override
		public void mouseClicked(MouseEvent e) {
			ScanBarCode sbc = new ScanBarCode(new ScanBarCode.ScanBarcodeReponse() {
				@Override
				public void getScanBarcodeReponse(String rs) {
					txtTimKiem.setText(rs);
					loadProduct();
					fillProduct(products);
				}
			});
		}

		@Override
		public void mousePressed(MouseEvent e) {

		}

		@Override
		public void mouseReleased(MouseEvent e) {

		}

		@Override
		public void mouseEntered(MouseEvent e) {

		}

		@Override
		public void mouseExited(MouseEvent e) {

		}
	}
}
