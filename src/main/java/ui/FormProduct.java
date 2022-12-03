package ui;

import javax.swing.*;
import javax.swing.GroupLayout.Alignment;

import component.Button;
import component.DashedBorder;
import component.textfield.TextField;
import dao.LoaiSanPhamDAO;
import dao.NhaCungCapDAO;
import dao.SanPhamDAO;
import entity.LoaiSanPham;
import entity.NhaCungCap;
import entity.SanPham;

import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.RoundRectangle2D;

import java.awt.BasicStroke;
import java.awt.Color;
import javax.swing.LayoutStyle.ComponentPlacement;
import java.awt.Cursor;
import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.File;
import java.util.List;
import utils.Alert;
import utils.ImageUtil;
import utils.Validation;

public class FormProduct extends JPanel {

    private TextField txtMaSP;
    private JComboBox cboNhaCungCap;
    private JComboBox cboDonViTinh;
    private JComboBox cboLoaiSP;
    private TextField txtTenSP;
    private TextField txtGhiChu;
    private JLabel lblNewLabel_2;
    private Button btnOk;
    private Button btnClear;
    private JLabel image;
    private SanPham product = null;
    private File fileImage = null;
    private JLabel lblNewLabel;
    private DefaultComboBoxModel modelNCC;
    private DefaultComboBoxModel modelDVT;
    private DefaultComboBoxModel modelLoaiSanPham;
    private JPanel panelImage;

    /**
     * Create the panel.
     */
    public FormProduct() {
        initUI();
        fillComboBox();
        addSuKien();
    }

    public FormProduct(SanPham product) {
        this.product = product;
        initUI();
        lblNewLabel.setText("Cập nhật sản phẩm");
        fillComboBox();
        fillForm();
        addSuKien();
        txtMaSP.setEditable(false);
    }

    public void initUI() {
        setBackground(Color.WHITE);
        setForeground(Color.BLACK);

        lblNewLabel = new JLabel("Thêm sản phẩm");
        lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
        lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 32));
        lblNewLabel.setForeground(new Color(31, 174, 255));

        txtMaSP = new TextField();
        txtMaSP.setLabelText("Mã sản phẩm");
        txtMaSP.setSize(500, 100);
        txtMaSP.setOpaque(false);
        txtMaSP.setFont(new Font("Tahoma", Font.PLAIN, 11));

        txtTenSP = new TextField();
        txtTenSP.setOpaque(false);
        txtTenSP.setLabelText("Tên sản phẩm");
        txtTenSP.setFont(new Font("Tahoma", Font.PLAIN, 11));

        txtGhiChu = new TextField();
        txtGhiChu.setLabelText("Ghi chú");
        txtGhiChu.setFont(new Font("Tahoma", Font.PLAIN, 11));
        txtGhiChu.setOpaque(false);

        cboLoaiSP = new JComboBox();
        cboLoaiSP.setFont(new Font("Tahoma", Font.PLAIN, 14));

        JLabel lblNewLabel_1 = new JLabel("Loại sản phẩm");

        cboDonViTinh = new JComboBox();
        cboDonViTinh.setFont(new Font("Tahoma", Font.PLAIN, 14));

        JLabel lblNewLabel_1_1 = new JLabel("Đơn vị tính");

        JLabel lblNewLabel_1_1_1 = new JLabel("Nhà cung cấp");

        cboNhaCungCap = new JComboBox();
        cboNhaCungCap.setFont(new Font("Tahoma", Font.PLAIN, 14));

        panelImage = new JPanel();
        panelImage.setBorder(new DashedBorder());
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
                                                                        .addComponent(txtGhiChu, Alignment.TRAILING, GroupLayout.DEFAULT_SIZE, 403, Short.MAX_VALUE)
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
                                        .addComponent(txtGhiChu, GroupLayout.PREFERRED_SIZE, 46, GroupLayout.PREFERRED_SIZE)
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
        image.setVerticalAlignment(SwingConstants.CENTER);
        image.setFont(new Font("Tahoma", Font.PLAIN, 20));
        panelImage.add(image, BorderLayout.CENTER);
        setLayout(groupLayout);
    }

    private void fillCBXLoaiSanPham() {
        LoaiSanPhamDAO lSP = new LoaiSanPhamDAO();
        modelLoaiSanPham = (DefaultComboBoxModel) cboLoaiSP.getModel();
        modelLoaiSanPham.removeAllElements();
        List<LoaiSanPham> list = lSP.selectAll();
        list.forEach(i -> {
            modelLoaiSanPham.addElement(i);
        });
    }

    private void fillCBXDonViTinh() {
        SanPhamDAO dVT = new SanPhamDAO();
        modelDVT = (DefaultComboBoxModel) cboDonViTinh.getModel();
        modelDVT.removeAllElements();
        List<String> listDVT = dVT.getDVT();
        listDVT.forEach(i -> {
            modelDVT.addElement(i);
        });
    }

    private void fillCBXNhaCungCap() {
        NhaCungCapDAO nCC = new NhaCungCapDAO();
        modelNCC = (DefaultComboBoxModel) cboNhaCungCap.getModel();
        modelNCC.removeAllElements();
        List<NhaCungCap> listNCC = nCC.selectAll();
        listNCC.forEach(i -> {
            modelNCC.addElement(i);
        });
    }

    private void fillComboBox() {
        fillCBXNhaCungCap();
        fillCBXLoaiSanPham();
        fillCBXDonViTinh();
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

    public static void main(String[] args) {
        JFrame f = new JFrame();
        f.setSize(1000, 800);
        f.setLayout(new GridLayout(1, 0));
        f.setContentPane(new FormProduct());
        f.setVisible(true);
    }

    private boolean checkInsertSanPham() {
        boolean check = Validation.required(txtMaSP.getText(), "Không để trống mã sản phẩm")
                && Validation.checkDuplicateProduct(txtMaSP.getText(), "Đã tồn tại mã sản phẩm này")
                && Validation.required(txtTenSP.getText(), "Không để trống tên sản phẩm")
                && Validation.requiredImage(fileImage, "Vui lòng chọn ảnh");
        return check;
    }

    private boolean checkUpdateSanPham() {
        boolean check = Validation.required(txtMaSP.getText(), "Không để trống mã sản phẩm")
                && Validation.required(txtTenSP.getText(), "Không để trống tên sản phẩm")
                && Validation.requiredImage(fileImage, "Vui lòng chọn ảnh");
        return check;
    }

    private SanPham getForm() {
        SanPham sp = new SanPham();
        String DVT = (String) cboDonViTinh.getSelectedItem();
        NhaCungCap cBXNCC = (NhaCungCap) cboNhaCungCap.getSelectedItem();
        LoaiSanPham cBXLSP = (LoaiSanPham) cboLoaiSP.getSelectedItem();
        sp.setMaSP((String) txtMaSP.getText());
        sp.setTenSP(txtTenSP.getText());
        sp.setDVT(DVT);
        sp.setMaLoai(cBXLSP.getMaLoai());
        sp.setHinh(fileImage.getName());
        sp.setMaNhaCungCap((String) cBXNCC.getMaNCC());
        sp.setGhiChu(txtGhiChu.getText());
        return sp;

    }

    private void insertSanPham() {
        if (checkInsertSanPham()) {
            SanPhamDAO spDAO = new SanPhamDAO();
            spDAO.insert(getForm());
            ImageUtil.save(fileImage);
            Alert.success("Thêm mới sản phẩm thành công");
        }
    }

    private void updateSanPham() {
        if (checkUpdateSanPham()) {
            SanPhamDAO spDAO = new SanPhamDAO();
            spDAO.update(getForm());
            ImageUtil.save(fileImage);
            Alert.success("Cập nhật sản phẩm thành công");
        }
    }

    private void clearForm() {
        txtMaSP.setText("");
        txtTenSP.setText("");
        txtGhiChu.setText("");
        fillComboBox();
        fileImage = null;
        image.setIcon(null);
        displayChooseFile();
    }

    private void addSuKien() {
        image.addMouseListener(new getHinh());
        btnClear.addActionListener(new handleClearButton());
        btnOk.addActionListener(new handleOkButton());
    }

    public void fillForm() {
        if (product != null) {
            NhaCungCapDAO nccd = new NhaCungCapDAO();
            LoaiSanPhamDAO lspd = new LoaiSanPhamDAO();
            txtMaSP.setText(product.getMaSP());
            txtTenSP.setText(product.getTenSP());
            txtGhiChu.setText(product.getGhiChu());
            modelDVT.setSelectedItem(product.getDVT());
            modelNCC.setSelectedItem(nccd.selectById(product.getMaNhaCungCap()));
            modelLoaiSanPham.setSelectedItem(lspd.selectById(product.getMaLoai()));
            fileImage = new File(getClass().getResource("/image/" + product.getHinh()).getFile());
            image.setIcon(ImageUtil.read(fileImage.getAbsolutePath()));
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
            if (product == null) {
                insertSanPham();
            } else {
                updateSanPham();
            }

        }

    }

    class getHinh extends MouseAdapter implements MouseListener {

        @Override
        public void mousePressed(MouseEvent e) {
            addImage();
        }
    }
}
