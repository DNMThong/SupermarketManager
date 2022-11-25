package ui;

import javax.swing.JPanel;
import javax.swing.ButtonGroup;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.SwingConstants;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.RoundRectangle2D;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.BasicStroke;
import java.awt.BorderLayout;

import component.Button;
import component.textfield.TextField;

import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JButton;

public class FormEmployee extends JPanel {

	private Button btnOk;
	private Button btnClear;
	private TextField txtEmail;
	private TextField txtMatKhau;
	private TextField txtSdt;
	private TextField txtHoTen;
	private TextField txtMaNV;
	private JRadioButton rdoQuanLy;
	private JRadioButton rdoNhanVien;
	private JRadioButton rdoNam;
	private JRadioButton rdoNu;

	/**
	 * Create the panel.
	 */
	public FormEmployee() {
		setBackground(Color.WHITE);
		
		JLabel lblNewLabel = new JLabel("Thêm nhân viên");
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 32));
		lblNewLabel.setForeground(new Color(31,174,255));
		
		JPanel panelImage = new JPanel() {
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
		panelImage.setFont(new Font("Tahoma", Font.PLAIN, 20));
		panelImage.setBackground(Color.WHITE);
		panelImage.setLayout(new BorderLayout(0, 0));
		
		txtMaNV = new TextField();
		txtMaNV.setOpaque(false);
		txtMaNV.setLabelText("Mã nhân viên");
		txtMaNV.setFont(new Font("Tahoma", Font.PLAIN, 14));
		
		txtHoTen = new TextField();
		txtHoTen.setOpaque(false);
		txtHoTen.setLabelText("Họ và tên");
		txtHoTen.setFont(new Font("Tahoma", Font.PLAIN, 14));
		
		txtSdt = new TextField();
		txtSdt.setOpaque(false);
		txtSdt.setLabelText("Số điện thoại");
		txtSdt.setFont(new Font("Tahoma", Font.PLAIN, 14));
		
		txtMatKhau = new TextField();
		txtMatKhau.setOpaque(false);
		txtMatKhau.setLabelText("Mật khẩu");
		txtMatKhau.setFont(new Font("Tahoma", Font.PLAIN, 14));
		
		txtEmail = new TextField();
		txtEmail.setOpaque(false);
		txtEmail.setLabelText("Email");
		txtEmail.setFont(new Font("Tahoma", Font.PLAIN, 14));
		
		JLabel lblNewLabel_2 = new JLabel("Giới tính");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.PLAIN, 14));
		
		ButtonGroup groupGioiTinh = new ButtonGroup();
		
		rdoNam = new JRadioButton("Nam");
		rdoNam.setFont(new Font("Tahoma", Font.PLAIN, 14));
		rdoNam.setOpaque(false);
		
		rdoNu = new JRadioButton("Nữ");
		rdoNu.setFont(new Font("Tahoma", Font.PLAIN, 14));
		rdoNu.setOpaque(false);
		
		groupGioiTinh.add(rdoNam);
		groupGioiTinh.add(rdoNu);
		
		JLabel lblNewLabel_2_1 = new JLabel("Vai trò");
		lblNewLabel_2_1.setFont(new Font("Tahoma", Font.PLAIN, 14));
		
		ButtonGroup groupVaiTro = new ButtonGroup();
		rdoQuanLy = new JRadioButton("Quản lý");
		rdoQuanLy.setFont(new Font("Tahoma", Font.PLAIN, 14));
		rdoQuanLy.setOpaque(false);
		
		rdoNhanVien = new JRadioButton("Nhân viên");
		rdoNhanVien.setFont(new Font("Tahoma", Font.PLAIN, 14));
		rdoNhanVien.setOpaque(false);
		
		groupVaiTro.add(rdoQuanLy);
		groupVaiTro.add(rdoNhanVien);
		
		JLabel lblNewLabel_2_2 = new JLabel("Địa chỉ");
		lblNewLabel_2_2.setFont(new Font("Tahoma", Font.PLAIN, 14));
		
		JScrollPane scrollPane = new JScrollPane();
		
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
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblNewLabel, GroupLayout.DEFAULT_SIZE, 1180, Short.MAX_VALUE)
					.addContainerGap())
				.addGroup(groupLayout.createSequentialGroup()
					.addGap(487)
					.addComponent(btnOk, GroupLayout.DEFAULT_SIZE, 90, Short.MAX_VALUE)
					.addGap(26)
					.addComponent(btnClear, GroupLayout.DEFAULT_SIZE, 104, Short.MAX_VALUE)
					.addGap(493))
				.addGroup(groupLayout.createSequentialGroup()
					.addGap(81)
					.addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
						.addGroup(groupLayout.createSequentialGroup()
							.addGap(4)
							.addComponent(panelImage, GroupLayout.PREFERRED_SIZE, 235, GroupLayout.PREFERRED_SIZE)
							.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
								.addGroup(groupLayout.createSequentialGroup()
									.addGap(18)
									.addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
										.addGroup(groupLayout.createSequentialGroup()
											.addGap(7)
											.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
												.addComponent(lblNewLabel_2, GroupLayout.PREFERRED_SIZE, 95, GroupLayout.PREFERRED_SIZE)
												.addGroup(groupLayout.createSequentialGroup()
													.addComponent(rdoNam, GroupLayout.DEFAULT_SIZE, 111, Short.MAX_VALUE)
													.addPreferredGap(ComponentPlacement.UNRELATED)
													.addComponent(rdoNu, GroupLayout.DEFAULT_SIZE, 111, Short.MAX_VALUE)
													.addGap(105))
												.addComponent(txtSdt, GroupLayout.DEFAULT_SIZE, 329, Short.MAX_VALUE)))
										.addComponent(txtHoTen, GroupLayout.DEFAULT_SIZE, 336, Short.MAX_VALUE))
									.addGap(97)
									.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
										.addComponent(txtMatKhau, GroupLayout.DEFAULT_SIZE, 338, Short.MAX_VALUE)
										.addComponent(lblNewLabel_2_1, GroupLayout.PREFERRED_SIZE, 95, GroupLayout.PREFERRED_SIZE)
										.addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
											.addGroup(groupLayout.createSequentialGroup()
												.addComponent(rdoQuanLy, GroupLayout.DEFAULT_SIZE, 111, Short.MAX_VALUE)
												.addPreferredGap(ComponentPlacement.UNRELATED)
												.addComponent(rdoNhanVien, GroupLayout.DEFAULT_SIZE, 111, Short.MAX_VALUE)
												.addGap(114))
											.addComponent(txtEmail, GroupLayout.DEFAULT_SIZE, 338, Short.MAX_VALUE))))
								.addGroup(groupLayout.createSequentialGroup()
									.addGap(210)
									.addComponent(txtMaNV, GroupLayout.DEFAULT_SIZE, 356, Short.MAX_VALUE)
									.addGap(223))))
						.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
							.addComponent(lblNewLabel_2_2, GroupLayout.PREFERRED_SIZE, 95, GroupLayout.PREFERRED_SIZE)
							.addComponent(scrollPane, GroupLayout.DEFAULT_SIZE, 1028, Short.MAX_VALUE)))
					.addGap(91))
		);
		groupLayout.setVerticalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblNewLabel)
					.addGap(63)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING, false)
						.addGroup(Alignment.TRAILING, groupLayout.createSequentialGroup()
							.addComponent(txtMaNV, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE)
							.addPreferredGap(ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
							.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
								.addComponent(txtHoTen, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE)
								.addComponent(txtMatKhau, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE))
							.addGap(51)
							.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
								.addComponent(txtSdt, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE)
								.addComponent(txtEmail, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE))
							.addGap(57)
							.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
								.addComponent(lblNewLabel_2)
								.addComponent(lblNewLabel_2_1, GroupLayout.PREFERRED_SIZE, 17, GroupLayout.PREFERRED_SIZE))
							.addPreferredGap(ComponentPlacement.UNRELATED)
							.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
								.addComponent(rdoNam)
								.addComponent(rdoNu, GroupLayout.PREFERRED_SIZE, 25, GroupLayout.PREFERRED_SIZE)
								.addComponent(rdoQuanLy, GroupLayout.PREFERRED_SIZE, 25, GroupLayout.PREFERRED_SIZE)
								.addComponent(rdoNhanVien, GroupLayout.PREFERRED_SIZE, 25, GroupLayout.PREFERRED_SIZE)))
						.addComponent(panelImage, GroupLayout.PREFERRED_SIZE, 356, GroupLayout.PREFERRED_SIZE))
					.addGap(18)
					.addComponent(lblNewLabel_2_2, GroupLayout.PREFERRED_SIZE, 17, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(scrollPane, GroupLayout.PREFERRED_SIZE, 161, GroupLayout.PREFERRED_SIZE)
					.addGap(18)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addComponent(btnOk, GroupLayout.PREFERRED_SIZE, 32, GroupLayout.PREFERRED_SIZE)
						.addComponent(btnClear, GroupLayout.PREFERRED_SIZE, 32, GroupLayout.PREFERRED_SIZE))
					.addGap(55))
		);
		
		JTextArea taDiaChi = new JTextArea();
		scrollPane.setViewportView(taDiaChi);
		
		JLabel image = new JLabel("Tải ảnh lên");
		image.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		image.setForeground(Color.GRAY);
		image.setHorizontalAlignment(SwingConstants.CENTER);
		image.setFont(new Font("Tahoma", Font.PLAIN, 20));
		image.setBackground(Color.WHITE);
		panelImage.add(image, BorderLayout.CENTER);
		setLayout(groupLayout);

	}
}
