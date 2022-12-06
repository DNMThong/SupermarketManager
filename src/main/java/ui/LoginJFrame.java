package ui;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import com.formdev.flatlaf.FlatIntelliJLaf;

import component.Button;
import component.textfield.PasswordField;
import component.textfield.TextField;
import dao.NhanVienDAO;
import entity.NhanVien;
import utils.Alert;
import utils.Auth;
import utils.ImageUtil;
import utils.Util;

import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.SwingConstants;
import javax.swing.JTextField;
import javax.swing.JButton;

public class LoginJFrame extends JFrame {

	private Button btnDangNhapQR;
	private JPanel contentPane;
	private TextField txTaiKhoan;
	private PasswordField txMatKhau;

	private Button btnDangNhap;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					LoginJFrame frame = new LoginJFrame();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public LoginJFrame() {
		FlatIntelliJLaf.setup();
		setBounds(100, 100, 1200, 800);
//		this.setExtendedState(JFrame.MAXIMIZED_BOTH);
		this.setVisible(true);
		this.setLocationRelativeTo(null);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setBackground(Color.white);
		setContentPane(contentPane);
		
		JLabel lblLogo = new JLabel();
		lblLogo.setHorizontalAlignment(SwingConstants.CENTER);
		lblLogo.setSize(350, 350);
		lblLogo.setIcon(ImageUtil.read(getClass().getResource("/image/logo/logo-white.png"),350,350));
		
		JLabel lblNewLabel = new JLabel("Đăng nhập");
		lblNewLabel.setForeground(new Color(31,174,255));
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 32));
		
		txTaiKhoan = new TextField();
		txTaiKhoan.setLabelText("Tài khoản");
		txTaiKhoan.setColumns(10);
		txTaiKhoan.setSize(500, 100);
		txTaiKhoan.setOpaque(false);
		
		txMatKhau = new PasswordField();
		txMatKhau.setLabelText("Mật khẩu");
		txMatKhau.setColumns(10);
		txMatKhau.setSize(500, 100);
		txMatKhau.setShowAndHide(true);
		txMatKhau.setOpaque(false);
		
		btnDangNhap = new Button();
		btnDangNhap.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnDangNhap.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btnDangNhap.setForeground(Color.white);
		btnDangNhap.setText("Đăng nhập");
		btnDangNhap.setRadius(40);
		btnDangNhap.setColor(new Color(31,174,255));
		btnDangNhap.setColorOver(new Color(90,193,251));
		btnDangNhap.setColorClick(new Color(31,174,255));
		btnDangNhap.setBorderColor(Color.white);
		btnDangNhap.addActionListener(new handleActionDangNhap());

		btnDangNhapQR = new Button();
		btnDangNhapQR.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnDangNhapQR.setFont(new Font("Tahoma", Font.PLAIN, 14));
		btnDangNhapQR.setForeground(Color.white);
		btnDangNhapQR.setText("Quét mã");
		btnDangNhapQR.setRadius(40);
		btnDangNhapQR.setColor(new Color(31,174,255));
		btnDangNhapQR.setColorOver(new Color(90,193,251));
		btnDangNhapQR.setColorClick(new Color(31,174,255));
		btnDangNhapQR.setBorderColor(Color.white);
		btnDangNhapQR.addActionListener(new handleActionDangNhapQR());

		GridLayout layout = new GridLayout(1,2,30,30);
		JPanel wapperButton = new JPanel(layout);
		wapperButton.setOpaque(false);

		wapperButton.add(btnDangNhap);
		wapperButton.add(btnDangNhapQR);

		
		GroupLayout gl_contentPane = new GroupLayout(contentPane);
		gl_contentPane.setHorizontalGroup(
			gl_contentPane.createParallelGroup(Alignment.TRAILING)
				.addGroup(gl_contentPane.createSequentialGroup()
					.addGap(524)
					.addComponent(wapperButton, GroupLayout.DEFAULT_SIZE, 350, Short.MAX_VALUE)
					.addGap(511))
				.addGroup(gl_contentPane.createSequentialGroup()
					.addGap(344)
					.addGroup(gl_contentPane.createParallelGroup(Alignment.TRAILING)
						.addComponent(txMatKhau, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 490, Short.MAX_VALUE)
						.addComponent(txTaiKhoan, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 490, Short.MAX_VALUE))
					.addGap(344))
				.addGroup(gl_contentPane.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblNewLabel, GroupLayout.DEFAULT_SIZE, 1158, Short.MAX_VALUE)
					.addContainerGap())
				.addGroup(gl_contentPane.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblLogo, GroupLayout.DEFAULT_SIZE, 1158, Short.MAX_VALUE)
					.addContainerGap())
		);
		gl_contentPane.setVerticalGroup(
			gl_contentPane.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_contentPane.createSequentialGroup()
					.addGap(21)
					.addComponent(lblLogo, GroupLayout.PREFERRED_SIZE, 253, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(lblNewLabel, GroupLayout.PREFERRED_SIZE, 55, GroupLayout.PREFERRED_SIZE)
					.addGap(43)
					.addComponent(txTaiKhoan, GroupLayout.PREFERRED_SIZE, 50, GroupLayout.PREFERRED_SIZE)
					.addGap(68)
					.addComponent(txMatKhau, GroupLayout.PREFERRED_SIZE, 50, GroupLayout.PREFERRED_SIZE)
					.addGap(64)
					.addComponent(wapperButton, GroupLayout.PREFERRED_SIZE, 38, GroupLayout.PREFERRED_SIZE)
					.addContainerGap(107, Short.MAX_VALUE))
		);
		contentPane.setLayout(gl_contentPane);
	}

	public boolean validation() {

		if(txTaiKhoan.getText().trim().isEmpty()) {
			Alert.warning(this,"Vui lòng nhập tài khoản");
			return false;
		}

		if(String.valueOf(txMatKhau.getPassword()).trim().isEmpty()) {
			Alert.warning(this,"Vui lòng nhập mật khẩu");
			return false;
		}
		return true;
	}

	public void login(String username,String password) {
		NhanVienDAO nvd = new NhanVienDAO();
		NhanVien nv = nvd.selectById(username);
		if(nv==null) {
			Alert.error(LoginJFrame.getFrames()[0], "Sai tài khoản");
		}else {
			if(nv.getMatKhau().equals(password)) {
				Auth.user = nv;
				Alert.success("Đăng nhập thành công");
				dispose();
				Util.mainFrame = new MainFrame();
				System.out.println(nv.getMatKhau());
				repaint();
				revalidate();
			}else {
				Alert.error(LoginJFrame.getFrames()[0], "Sai mật khẩu");
			}
		}
	}

	class handleActionDangNhap implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			login(txTaiKhoan.getText(),String.valueOf(txMatKhau.getPassword()));
		}
	}

	class handleActionDangNhapQR implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			ScanBarCode sbc = new ScanBarCode(new ScanBarCode.ScanBarcodeReponse() {
				@Override
				public void getScanBarcodeReponse(String rs) {

					String[] infoLogin = rs.split(" - ");
					login(infoLogin[0],infoLogin[1]);
				}
			});
		}
	}
}
