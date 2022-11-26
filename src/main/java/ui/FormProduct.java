package ui;

import javax.swing.JPanel;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;

import component.Button;
import component.textfield.TextField;

import javax.swing.JLabel;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.RoundRectangle2D;

import javax.swing.SwingConstants;

import java.awt.BasicStroke;
import java.awt.Color;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.JComboBox;
import java.awt.Cursor;
import java.awt.BorderLayout;

public class FormProduct extends JPanel {
	private TextField txtMaSP;
	private JComboBox cboNhaCungCap;
	private JComboBox cboDonViTinh;
	private JComboBox cboLoaiSP;
	private TextField txtTenSP;
	private TextField txtGia;
	private JLabel lblNewLabel_2;
	private Button btnOk;
	private Button btnClear;
	private JLabel image;
	private String maSP=null;

	/**
	 * Create the panel.
	 */
	public FormProduct() {
		initUI();
	}

	public FormProduct(String maSP) {
		this.maSP = maSP;
		initUI();
	}

	public void initUI() {
		setBackground(Color.WHITE);
		setForeground(Color.BLACK);

		JLabel lblNewLabel = new JLabel("Thêm sản phẩm");
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 32));
		lblNewLabel.setForeground(new Color(31,174,255));

		txtMaSP = new TextField();
		txtMaSP.setLabelText("Mã sản phẩm");
		txtMaSP.setSize(500, 100);
		txtMaSP.setOpaque(false);
		txtMaSP.setFont(new Font("Tahoma", Font.PLAIN, 11));

		txtTenSP = new TextField();
		txtTenSP.setOpaque(false);
		txtTenSP.setLabelText("Tên sản phẩm");
		txtTenSP.setFont(new Font("Tahoma", Font.PLAIN, 11));

		txtGia = new TextField();
		txtGia.setOpaque(false);
		txtGia.setLabelText("Giá");
		txtGia.setFont(new Font("Tahoma", Font.PLAIN, 11));

		cboLoaiSP = new JComboBox();
		cboLoaiSP.setFont(new Font("Tahoma", Font.PLAIN, 14));

		JLabel lblNewLabel_1 = new JLabel("Loại sản phẩm");

		cboDonViTinh = new JComboBox();
		cboDonViTinh.setFont(new Font("Tahoma", Font.PLAIN, 14));

		JLabel lblNewLabel_1_1 = new JLabel("Đơn vị tính");


		JLabel lblNewLabel_1_1_1 = new JLabel("Nhà cung cấp");

		cboNhaCungCap = new JComboBox();
		cboNhaCungCap.setFont(new Font("Tahoma", Font.PLAIN, 14));

		JPanel panelImage = new JPanel() {
			@Override
			protected void paintComponent(Graphics grphcs) {
				float dash1[] = { 10.0f };
				BasicStroke dashed = new BasicStroke(1.0f,
						BasicStroke.CAP_BUTT, BasicStroke.JOIN_MITER, 10.0f, dash1, 0.0f);
				Graphics2D g2 = (Graphics2D) grphcs;
				g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
						RenderingHints.VALUE_ANTIALIAS_ON);

				g2.setPaint(Color.gray);
				int x = 1;
				int y = 1;

				g2.setStroke(dashed);
				g2.draw(new RoundRectangle2D.Double(x, y, getWidth() - x - 10, getHeight() - y - 10,
						10, 10));
			}
		};
		panelImage.setBackground(Color.WHITE);
		panelImage.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		panelImage.setFont(new Font("Tahoma", Font.PLAIN, 20));


		lblNewLabel_2 = new JLabel("Ảnh sản phẩm");

		btnOk = new Button();
		btnOk.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnOk.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btnOk.setForeground(Color.white);
		btnOk.setText("Ok");
		btnOk.setRadius(30);
		btnOk.setColor(new Color(31,174,255));
		btnOk.setColorOver(new Color(90,193,251));
		btnOk.setColorClick(new Color(31,174,255));
		btnOk.setBorderColor(Color.white);



		btnClear = new Button();
		btnClear.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnClear.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btnClear.setForeground(Color.white);
		btnClear.setText("Clear");
		btnClear.setRadius(30);
		btnClear.setColor(new Color(31,174,255));
		btnClear.setColorOver(new Color(90,193,251));
		btnClear.setColorClick(new Color(31,174,255));
		btnClear.setBorderColor(Color.white);

		GroupLayout groupLayout = new GroupLayout(this);
		groupLayout.setHorizontalGroup(
				groupLayout.createParallelGroup(Alignment.TRAILING)
						.addGroup(groupLayout.createSequentialGroup()
								.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
										.addGroup(groupLayout.createSequentialGroup()
												.addContainerGap()
												.addComponent(lblNewLabel, GroupLayout.DEFAULT_SIZE, 1190, Short.MAX_VALUE))
										.addGroup(groupLayout.createSequentialGroup()
												.addGap(479)
												.addComponent(btnOk, GroupLayout.DEFAULT_SIZE, 109, Short.MAX_VALUE)
												.addGap(39)
												.addComponent(btnClear, GroupLayout.DEFAULT_SIZE, 95, Short.MAX_VALUE)
												.addGap(478))
										.addGroup(groupLayout.createSequentialGroup()
												.addGap(122)
												.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
														.addComponent(panelImage, GroupLayout.DEFAULT_SIZE, 953, Short.MAX_VALUE)
														.addGroup(groupLayout.createSequentialGroup()
																.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
																		.addComponent(txtGia, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 403, Short.MAX_VALUE)
																		.addComponent(txtMaSP, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 403, Short.MAX_VALUE)
																		.addComponent(txtTenSP, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 403, Short.MAX_VALUE)
																		.addComponent(lblNewLabel_2, GroupLayout.PREFERRED_SIZE, 95, GroupLayout.PREFERRED_SIZE))
																.addGap(147)
																.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
																		.addComponent(lblNewLabel_1_1_1, GroupLayout.PREFERRED_SIZE, 73, GroupLayout.PREFERRED_SIZE)
																		.addComponent(cboNhaCungCap, 0, 403, Short.MAX_VALUE)
																		.addComponent(lblNewLabel_1_1, GroupLayout.PREFERRED_SIZE, 73, GroupLayout.PREFERRED_SIZE)
																		.addComponent(cboDonViTinh, 0, 403, Short.MAX_VALUE)
																		.addComponent(lblNewLabel_1)
																		.addComponent(cboLoaiSP, 0, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
												.addGap(125)))
								.addGap(0))
		);
		groupLayout.setVerticalGroup(
				groupLayout.createParallelGroup(Alignment.LEADING)
						.addGroup(groupLayout.createSequentialGroup()
								.addContainerGap()
								.addComponent(lblNewLabel)
								.addGap(62)
								.addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
										.addGroup(groupLayout.createSequentialGroup()
												.addComponent(txtMaSP, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE)
												.addGap(46)
												.addComponent(txtTenSP, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE))
										.addGroup(groupLayout.createSequentialGroup()
												.addComponent(lblNewLabel_1)
												.addGap(4)
												.addComponent(cboLoaiSP, GroupLayout.PREFERRED_SIZE, 30, GroupLayout.PREFERRED_SIZE)
												.addGap(44)
												.addComponent(lblNewLabel_1_1)
												.addGap(4)
												.addComponent(cboDonViTinh, GroupLayout.PREFERRED_SIZE, 30, GroupLayout.PREFERRED_SIZE)))
								.addGap(58)
								.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
										.addComponent(txtGia, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE)
										.addGroup(groupLayout.createSequentialGroup()
												.addComponent(lblNewLabel_1_1_1)
												.addGap(4)
												.addComponent(cboNhaCungCap, GroupLayout.PREFERRED_SIZE, 30, GroupLayout.PREFERRED_SIZE)))
								.addGap(45)
								.addComponent(lblNewLabel_2)
								.addPreferredGap(ComponentPlacement.UNRELATED)
								.addComponent(panelImage, GroupLayout.PREFERRED_SIZE, 252, GroupLayout.PREFERRED_SIZE)
								.addGap(39)
								.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
										.addComponent(btnOk, GroupLayout.PREFERRED_SIZE, 34, GroupLayout.PREFERRED_SIZE)
										.addComponent(btnClear, GroupLayout.PREFERRED_SIZE, 32, GroupLayout.PREFERRED_SIZE))
								.addContainerGap(47, Short.MAX_VALUE))
		);
		panelImage.setLayout(new BorderLayout(0, 0));

		image = new JLabel("Tải ảnh lên");
		image.setForeground(Color.gray);
		image.setBackground(Color.WHITE);
		image.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		image.setHorizontalAlignment(SwingConstants.CENTER);
		image.setFont(new Font("Tahoma", Font.PLAIN, 20));
		panelImage.add(image, BorderLayout.CENTER);
		setLayout(groupLayout);
	}
}
