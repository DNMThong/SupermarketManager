package ui;

import java.awt.Dialog;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;
import utils.JDBCUtil;

public class DanhSachHoaDonJPanel extends javax.swing.JPanel {

    public DanhSachHoaDonJPanel() {
        initComponents();
        init();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        ChiTietHoaDonJDialog = new javax.swing.JDialog();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblChiTietHoaDon = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        lblMaHoaDon = new javax.swing.JLabel();
        lblNgayLapHoaDon = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        lblTenNhanVien = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        lblTongHoaDon = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblDanhSachHoaDon = new javax.swing.JTable();

        ChiTietHoaDonJDialog.setTitle("Chi tiết hoá đơn");

        tblChiTietHoaDon.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Tên sản phẩm", "Số lượng", "Giá bán", "Thành tiền"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, true, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane2.setViewportView(tblChiTietHoaDon);
        if (tblChiTietHoaDon.getColumnModel().getColumnCount() > 0) {
            tblChiTietHoaDon.getColumnModel().getColumn(1).setMinWidth(60);
            tblChiTietHoaDon.getColumnModel().getColumn(1).setMaxWidth(60);
            tblChiTietHoaDon.getColumnModel().getColumn(2).setMinWidth(100);
            tblChiTietHoaDon.getColumnModel().getColumn(2).setMaxWidth(100);
            tblChiTietHoaDon.getColumnModel().getColumn(3).setMinWidth(120);
            tblChiTietHoaDon.getColumnModel().getColumn(3).setMaxWidth(120);
        }

        jButton1.setText("Xóa hóa đơn");

        jButton2.setText("Sửa hóa đơn");

        jButton3.setText("In hóa đơn");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel1.setText("Mã hóa đơn:");

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel2.setText("Ngày lập hóa đơn:");

        lblMaHoaDon.setText("lblMaHoaDon");

        lblNgayLapHoaDon.setText("lblNgayLapHoaDon");

        jLabel5.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel5.setText("Tên nhân viên:");

        lblTenNhanVien.setText("lblTenNhanVien");

        jLabel3.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel3.setText("Tổng hóa đơn:");

        lblTongHoaDon.setText("lblTongHoaDon");

        javax.swing.GroupLayout ChiTietHoaDonJDialogLayout = new javax.swing.GroupLayout(ChiTietHoaDonJDialog.getContentPane());
        ChiTietHoaDonJDialog.getContentPane().setLayout(ChiTietHoaDonJDialogLayout);
        ChiTietHoaDonJDialogLayout.setHorizontalGroup(
            ChiTietHoaDonJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(ChiTietHoaDonJDialogLayout.createSequentialGroup()
                .addGroup(ChiTietHoaDonJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(ChiTietHoaDonJDialogLayout.createSequentialGroup()
                        .addGap(14, 14, 14)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 532, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addGroup(ChiTietHoaDonJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jButton1)
                            .addGroup(ChiTietHoaDonJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                .addComponent(jButton3, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jButton2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                    .addGroup(ChiTietHoaDonJDialogLayout.createSequentialGroup()
                        .addGap(34, 34, 34)
                        .addGroup(ChiTietHoaDonJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, ChiTietHoaDonJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, ChiTietHoaDonJDialogLayout.createSequentialGroup()
                                    .addComponent(jLabel2)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED))
                                .addGroup(ChiTietHoaDonJDialogLayout.createSequentialGroup()
                                    .addComponent(jLabel5)
                                    .addGap(40, 40, 40)))
                            .addGroup(ChiTietHoaDonJDialogLayout.createSequentialGroup()
                                .addComponent(jLabel1)
                                .addGap(52, 52, 52)))
                        .addGroup(ChiTietHoaDonJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lblMaHoaDon)
                            .addGroup(ChiTietHoaDonJDialogLayout.createSequentialGroup()
                                .addComponent(lblTenNhanVien)
                                .addGap(102, 102, 102)
                                .addComponent(jLabel3)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(lblTongHoaDon))
                            .addComponent(lblNgayLapHoaDon))))
                .addGap(0, 9, Short.MAX_VALUE))
        );
        ChiTietHoaDonJDialogLayout.setVerticalGroup(
            ChiTietHoaDonJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, ChiTietHoaDonJDialogLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(ChiTietHoaDonJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblMaHoaDon, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(ChiTietHoaDonJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblNgayLapHoaDon, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(ChiTietHoaDonJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblTenNhanVien, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblTongHoaDon, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(ChiTietHoaDonJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(ChiTietHoaDonJDialogLayout.createSequentialGroup()
                        .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 277, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(16, 16, 16))
        );

        tblDanhSachHoaDon.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Mã hóa đơn", "Ngày xuất", "Tên nhân viên", "Tổng hóa đơn"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblDanhSachHoaDon.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblDanhSachHoaDonMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblDanhSachHoaDon);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 704, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 470, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents

    private void tblDanhSachHoaDonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblDanhSachHoaDonMouseClicked
        // TODO add your handling code here:  
        if (evt.getClickCount() == 2) {
            fillChiTietHoaDon();
            ChiTietHoaDonJDialog.setVisible(true);
        }
    }//GEN-LAST:event_tblDanhSachHoaDonMouseClicked

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        inHoaDon();
    }//GEN-LAST:event_jButton3ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JDialog ChiTietHoaDonJDialog;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JLabel lblMaHoaDon;
    private javax.swing.JLabel lblNgayLapHoaDon;
    private javax.swing.JLabel lblTenNhanVien;
    private javax.swing.JLabel lblTongHoaDon;
    private javax.swing.JTable tblChiTietHoaDon;
    private javax.swing.JTable tblDanhSachHoaDon;
    // End of variables declaration//GEN-END:variables

    void init() {
        fillDanhSachHoaDon();
        initDialogOrther();
        initCenterColumnTable();
    }

    void initDialogOrther() {
        ChiTietHoaDonJDialog.pack();
        ChiTietHoaDonJDialog.setLocationRelativeTo(null);
        ChiTietHoaDonJDialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
    }

    void initCenterColumnTable() {
        DefaultTableCellRenderer render = new DefaultTableCellRenderer();
        render.setHorizontalAlignment(JLabel.CENTER);
        TableColumnModel model = tblDanhSachHoaDon.getColumnModel();
        TableColumnModel model2 = tblChiTietHoaDon.getColumnModel();
        model.getColumn(0).setCellRenderer(render);
        model.getColumn(1).setCellRenderer(render);
        model.getColumn(2).setCellRenderer(render);
        model.getColumn(3).setCellRenderer(render);
        model2.getColumn(1).setCellRenderer(render);
        model2.getColumn(2).setCellRenderer(render);
        model2.getColumn(3).setCellRenderer(render);
    }

    private int rowHoaDon = 0;

    void fillDanhSachHoaDon() {

        DefaultTableModel modal = (DefaultTableModel) tblDanhSachHoaDon.getModel();
        modal.setRowCount(0);
        try {
            String sql = "select * from DanhSachHoaDon order by NgayXuat desc";

            ResultSet rs = JDBCUtil.query(sql);
            System.out.println(rs.next());
            while (rs.next()) {
                Object[] row = new Object[]{rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)};
                modal.addRow(row);
            }
            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void fillChiTietHoaDon() {
        rowHoaDon = tblDanhSachHoaDon.getSelectedRow();
        DefaultTableModel modal = (DefaultTableModel) tblChiTietHoaDon.getModel();
        modal.setRowCount(0);
        String mahd = tblDanhSachHoaDon.getValueAt(rowHoaDon, 0).toString();
        try {
            String sql = "select * from ChiTietHoaDon where MaHD = ?";

            ResultSet rs = JDBCUtil.query(sql,mahd);
            lblMaHoaDon.setText(mahd);
            lblNgayLapHoaDon.setText(tblDanhSachHoaDon.getValueAt(rowHoaDon, 1).toString());
            lblTenNhanVien.setText(tblDanhSachHoaDon.getValueAt(rowHoaDon, 2).toString());
            while (rs.next()) {
                Object[] row = new Object[]{rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)};
                modal.addRow(row);
                lblTongHoaDon.setText(String.valueOf(totalPriceInvoice()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private int totalPriceInvoice() {
        int total = 0;
        for (int i = 0; i < tblChiTietHoaDon.getRowCount(); i++) {
            String thanhtien = tblChiTietHoaDon.getValueAt(i, 3).toString();
            total = total + Integer.parseInt(thanhtien);
        }
        return total;
    }

    void inHoaDon() {
        try {
//            rowHoaDon = tblDanhSachHoaDon.getSelectedRow();
//            String mahd = tblDanhSachHoaDon.getValueAt(rowHoaDon, 0).toString();
//            String reportSource = getClass().getResource("/reports/InHoaDon.jrxml").getPath();
//            JasperReport jasperReport = JasperCompileManager.compileReport(reportSource);
//            Map<String, Object> map = new HashMap<String, Object>();
//            map.put("rstMaHD", mahd);
//            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, map, new JREmptyDataSource());
//            JasperViewer.viewReport(jasperPrint, false);
            String mahd = tblDanhSachHoaDon.getValueAt(rowHoaDon, 0).toString();
            String reportSource = getClass().getResource("/reports/InHoaDon.jrxml").getPath();
            JasperDesign jdesign = JRXmlLoader.load(reportSource);
            String query = "SELECT [MaHD],[NgayXuat],[HoTen],[TenSP],[SoLuong],[GiaXuat],[ThanhTien]" +
                    "  FROM [QLDA_SieuThi].[dbo].[ChiTietHoaDon] where MaHD like '"+mahd+"'";

            JRDesignQuery updateQuery = new JRDesignQuery();
            updateQuery.setText(query);

            jdesign.setQuery(updateQuery);

            JasperReport jreport = JasperCompileManager.compileReport(jdesign);
            JasperPrint jprint = JasperFillManager.fillReport(jreport, null,JDBCUtil.getConnect());

            JasperViewer.viewReport(jprint);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
