package ui;

import javax.swing.*;
import javax.swing.GroupLayout.Alignment;
import java.awt.*;

import component.Button;
import component.DashedBorder;
import component.textfield.TextField;
import dao.NhanVienDAO;
import entity.NhanVien;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.File;

import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.table.DefaultTableModel;
import utils.Alert;
import utils.ImageUtil;
import utils.Validation;

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
    private String maNV = null;
    private JTextArea txtDiaChi;
    private File fileImage;
    private JLabel image;
    private JLabel lblNewLabel;
    private NhanVien Employee = null;

    /**
     * Create the panel.
     */
    public FormEmployee() {
        initUI();
        addSuKien();
    }

    public FormEmployee(NhanVien Employee) {
        this.Employee=Employee;
        initUI();
        this.maNV = maNV;
        fillForm();
        addSuKien();
        lblNewLabel.setText("Cập nhật nhân viên");
        txtMaNV.setEditable(false);
    }

    public void initUI() {
        setBackground(Color.WHITE);

        lblNewLabel = new JLabel("Thêm nhân viên");
        lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
        lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 32));
        lblNewLabel.setForeground(new Color(31, 174, 255));

        JPanel panelImage = new JPanel();
        panelImage.setBorder(new DashedBorder());
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
        rdoNam.setSelected(true);

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
        rdoQuanLy.setSelected(true);

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
        btnOk.setColor(new Color(31, 174, 255));
        btnOk.setColorOver(new Color(90, 193, 251));
        btnOk.setColorClick(new Color(31, 174, 255));
        btnOk.setBorderColor(Color.white);

        btnClear = new Button();
        btnClear.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnClear.setFont(new Font("Tahoma", Font.PLAIN, 14));
        btnClear.setForeground(Color.white);
        btnClear.setText("Clear");
        btnClear.setRadius(30);
        btnClear.setColor(new Color(31, 174, 255));
        btnClear.setColorOver(new Color(90, 193, 251));
        btnClear.setColorClick(new Color(31, 174, 255));
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

        txtDiaChi = new JTextArea();
        scrollPane.setViewportView(txtDiaChi);
        image = new JLabel("Tải ảnh lên");
        image.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        image.setForeground(Color.GRAY);
        image.setHorizontalAlignment(SwingConstants.CENTER);
        image.setFont(new Font("Tahoma", Font.PLAIN, 20));
        image.setBackground(Color.WHITE);
        panelImage.add(image, BorderLayout.CENTER);
        setLayout(groupLayout);
    }

    public static void main(String[] args) {
        JFrame f = new JFrame();
        f.setSize(1000, 800);
        f.setLayout(new GridLayout(1, 0));
        f.setContentPane(new FormEmployee());
        f.setVisible(true);
    }

    private boolean checkInsert() {
        boolean check = Validation.required(txtMaNV.getText(), "Không để trống mã nhân viên")
                && Validation.checkDuplicateEmployee(txtMaNV.getText(), "Đã tồn tại mã nhân viên này")
                && Validation.required(txtHoTen.getText(), "Không để trống tên nhân viên")
                && Validation.validatePhone(txtSdt.getText(), "Nhập số điện thoại theo định dạng VD:0993480916 (10 số)")
                && Validation.validateEmail(txtEmail.getText(), "Nhập Email theo định dạng VD: sieuthi@gmail.com")
                && Validation.required(txtDiaChi.getText(), "Không để trống địa chỉ")
                && Validation.required(txtMatKhau.getText(), "Không để trống mật khẩu")
                && Validation.requiredImage(fileImage, "Vui lòng chọn hình ảnh");
        return check;
    }
    
    private boolean checkUpdate() {
        boolean check = Validation.required(txtMaNV.getText(), "Không để trống mã nhân viên")
                && Validation.required(txtHoTen.getText(), "Không để trống tên nhân viên")
                && Validation.validatePhone(txtSdt.getText(), "Nhập số điện thoại theo định dạng VD:0993480916 (10 số)")
                && Validation.validateEmail(txtEmail.getText(), "Nhập Email theo định dạng VD: sieuthi@gmail.com")
                && Validation.required(txtDiaChi.getText(), "Không để trống địa chỉ")
                && Validation.required(txtMatKhau.getText(), "Không để trống mật khẩu")
                && Validation.requiredImage(fileImage, "Vui lòng chọn hình ảnh");
        return check;
    }
    private void addSuKien(){
       btnClear.addActionListener(new handleClearButton());
       btnOk.addActionListener(new handleOkButton());
       image.addMouseListener(new handleImageLabel());
    }
    
    private void  clearForm(){
        txtMaNV.setText("");
        txtHoTen.setText("");
        txtDiaChi.setText("");
        txtMatKhau.setText("");
        txtSdt.setText("");
        txtEmail.setText("");
        rdoNam.setSelected(true);
        rdoQuanLy.setSelected(true);
        fileImage=null;
        image.setIcon(null);
        displayChooseFile();
    }   
        
    private NhanVien getForm() {
        NhanVien nv = new NhanVien();
        nv.setMaNhanVien(txtMaNV.getText());
        nv.setHoTen(txtHoTen.getText());
        nv.setDiaChi(txtDiaChi.getText());
        nv.setEmail(txtEmail.getText());
        nv.setSDT(txtSdt.getText());
        nv.setMatKhau(txtMatKhau.getText());
        nv.setHinh(fileImage.getName());
        if (rdoNam.isSelected()) {
            nv.setGioiTinh(true);
        } else if (rdoNu.isSelected()) {
            nv.setGioiTinh(false);
        }
        if (rdoNhanVien.isSelected()) {
            nv.setVaiTro(false);
        } else if (rdoQuanLy.isSelected()) {
            nv.setVaiTro(true);
        }
        return nv;
    }

    public void fillForm() {
        if (Employee != null) {
            
            txtMaNV.setText(Employee.getMaNhanVien());
            txtHoTen.setText(Employee.getHoTen());
            if(Employee.getGioiTinh()==true){
               rdoNam.setSelected(true);
            }else if(Employee.getGioiTinh()==false){
               rdoNu.setSelected(true);
            }
            txtSdt.setText(Employee.getSDT());
            txtEmail.setText(Employee.getEmail());
            txtDiaChi.setText(Employee.getDiaChi());           
            txtMatKhau.setText(Employee.getMatKhau());
            if(Employee.getVaiTro()==true){
               rdoQuanLy.setSelected(true);
            }else if(Employee.getVaiTro()==false){
               rdoNhanVien.setSelected(true);
            }
            fileImage = new File(getClass().getResource("/image/" + Employee.getHinh()).getFile());
            image.setIcon(ImageUtil.read(fileImage.getAbsolutePath()));
            displayChooseFile();
        }
    }

    public void insertEmployee() {
        if (checkInsert()) {
            NhanVienDAO nvDAO = new NhanVienDAO();
            nvDAO.insert(getForm());
            ImageUtil.save(fileImage);
            Alert.success("Thêm mới nhân viên thành công");
        }
    }
    public void updateEmployee(){
        if (checkUpdate()) {
            NhanVienDAO nvDAO = new NhanVienDAO();
            nvDAO.update(getForm());
            ImageUtil.save(fileImage);
            Alert.success("Cập nhật nhân viên thành công");
        }
    }

    public void displayChooseFile() {
        if (fileImage == null) {
            image.setText("Tải ảnh lên");
        } else {
            image.setText("");
        }
    }

    public void addImage() {
        JFileChooser jfc = new JFileChooser();
        int returnValue = jfc.showOpenDialog(this);
        if (returnValue == JFileChooser.APPROVE_OPTION) {
            fileImage = jfc.getSelectedFile();
            String regex = "(.*)*.+\\.(png|jpg|gif|bmp|jpeg|PNG|JPG|GIF|BMP|JPEG)$";
            if (fileImage.getAbsolutePath().matches(regex)) {
                image.setIcon(ImageUtil.read(fileImage.getAbsolutePath()));
            } else {
                fileImage = null;
            }
            displayChooseFile();
        }
    }
    class handleClearButton implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            clearForm();

        }
    }

    class handleOkButton implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            if (Employee == null) {
                insertEmployee();
            } else {
               updateEmployee();
            }

        }

    }

    class handleImageLabel extends MouseAdapter implements MouseListener {

        @Override
        public void mousePressed(MouseEvent e) {
            addImage();
        }
    }

}
