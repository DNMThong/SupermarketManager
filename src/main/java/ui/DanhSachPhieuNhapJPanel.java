package ui;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;
import utils.Alert;
import utils.JDBCUtil;
import utils.XExcel;

public class DanhSachPhieuNhapJPanel extends javax.swing.JPanel {

    public DanhSachPhieuNhapJPanel() {
        initComponents();
        init();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        ChiTietPhieuNhapDialog = new javax.swing.JDialog();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblChiTietPhieuNhap = new javax.swing.JTable();
        btnInPhieuNhap = new javax.swing.JButton();
        btnXoaPhieuNhap = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();
        lblTongPhieuNhap = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        lblMaPhieuNhap = new javax.swing.JLabel();
        lblNgayLapPhieuNhap = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        lblTenNhanVien = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblDanhSach = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        cboSapXep = new javax.swing.JComboBox<>();
        btnExcel = new javax.swing.JButton();

        ChiTietPhieuNhapDialog.setTitle("Chi tiết phiếu nhập");

        tblChiTietPhieuNhap.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Mã sản phẩm", "Tên sản phẩm", "ĐVT", "Tên loại", "Tên NCC", "Giá nhập", "Số lượng", "Thành tiền"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane2.setViewportView(tblChiTietPhieuNhap);
        if (tblChiTietPhieuNhap.getColumnModel().getColumnCount() > 0) {
            tblChiTietPhieuNhap.getColumnModel().getColumn(0).setMinWidth(110);
            tblChiTietPhieuNhap.getColumnModel().getColumn(0).setMaxWidth(110);
            tblChiTietPhieuNhap.getColumnModel().getColumn(2).setMinWidth(60);
            tblChiTietPhieuNhap.getColumnModel().getColumn(2).setMaxWidth(60);
            tblChiTietPhieuNhap.getColumnModel().getColumn(3).setMinWidth(150);
            tblChiTietPhieuNhap.getColumnModel().getColumn(3).setMaxWidth(150);
            tblChiTietPhieuNhap.getColumnModel().getColumn(4).setMinWidth(80);
            tblChiTietPhieuNhap.getColumnModel().getColumn(4).setMaxWidth(80);
            tblChiTietPhieuNhap.getColumnModel().getColumn(5).setMinWidth(90);
            tblChiTietPhieuNhap.getColumnModel().getColumn(5).setMaxWidth(90);
            tblChiTietPhieuNhap.getColumnModel().getColumn(6).setMinWidth(60);
            tblChiTietPhieuNhap.getColumnModel().getColumn(6).setMaxWidth(60);
            tblChiTietPhieuNhap.getColumnModel().getColumn(7).setMinWidth(100);
            tblChiTietPhieuNhap.getColumnModel().getColumn(7).setMaxWidth(100);
        }

        btnInPhieuNhap.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icon/Action-file-print-icon.png"))); // NOI18N
        btnInPhieuNhap.setText("In phiếu nhập");
        btnInPhieuNhap.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnInPhieuNhapActionPerformed(evt);
            }
        });

        btnXoaPhieuNhap.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icon/Delete-file-icon.png"))); // NOI18N
        btnXoaPhieuNhap.setText("Xóa phiếu nhập");
        btnXoaPhieuNhap.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnXoaPhieuNhapActionPerformed(evt);
            }
        });

        jLabel3.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel3.setText("Tổng giá trị phiếu nhập:");

        lblTongPhieuNhap.setText("lblTongPhieuNhap");

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel2.setText("Mã phiếu nhập:");

        jLabel4.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel4.setText("Ngày lập phiếu nhập:");

        lblMaPhieuNhap.setText("lblMaPhieuNhap");

        lblNgayLapPhieuNhap.setText("lblNgayLapPhieuNhap");

        jLabel5.setFont(new java.awt.Font("Segoe UI", 1, 14)); // NOI18N
        jLabel5.setText("Tên nhân viên:");

        lblTenNhanVien.setText("lblTenNhanVien");

        javax.swing.GroupLayout ChiTietPhieuNhapDialogLayout = new javax.swing.GroupLayout(ChiTietPhieuNhapDialog.getContentPane());
        ChiTietPhieuNhapDialog.getContentPane().setLayout(ChiTietPhieuNhapDialogLayout);
        ChiTietPhieuNhapDialogLayout.setHorizontalGroup(
            ChiTietPhieuNhapDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(ChiTietPhieuNhapDialogLayout.createSequentialGroup()
                .addGap(15, 15, 15)
                .addComponent(jScrollPane2)
                .addGap(12, 12, 12)
                .addGroup(ChiTietPhieuNhapDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnInPhieuNhap, javax.swing.GroupLayout.PREFERRED_SIZE, 141, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnXoaPhieuNhap))
                .addContainerGap())
            .addGroup(ChiTietPhieuNhapDialogLayout.createSequentialGroup()
                .addGap(157, 157, 157)
                .addGroup(ChiTietPhieuNhapDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, ChiTietPhieuNhapDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, ChiTietPhieuNhapDialogLayout.createSequentialGroup()
                            .addComponent(jLabel4)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED))
                        .addGroup(ChiTietPhieuNhapDialogLayout.createSequentialGroup()
                            .addComponent(jLabel5)
                            .addGap(40, 40, 40)))
                    .addGroup(ChiTietPhieuNhapDialogLayout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addGap(52, 52, 52)))
                .addGroup(ChiTietPhieuNhapDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(ChiTietPhieuNhapDialogLayout.createSequentialGroup()
                        .addComponent(lblTenNhanVien)
                        .addGap(102, 102, 102)
                        .addComponent(jLabel3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(lblTongPhieuNhap))
                    .addComponent(lblMaPhieuNhap)
                    .addComponent(lblNgayLapPhieuNhap))
                .addContainerGap(228, Short.MAX_VALUE))
        );
        ChiTietPhieuNhapDialogLayout.setVerticalGroup(
            ChiTietPhieuNhapDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, ChiTietPhieuNhapDialogLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(ChiTietPhieuNhapDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblMaPhieuNhap, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(ChiTietPhieuNhapDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblNgayLapPhieuNhap, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(9, 9, 9)
                .addGroup(ChiTietPhieuNhapDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblTenNhanVien, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblTongPhieuNhap, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(ChiTietPhieuNhapDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 327, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(ChiTietPhieuNhapDialogLayout.createSequentialGroup()
                        .addComponent(btnInPhieuNhap, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnXoaPhieuNhap, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(14, Short.MAX_VALUE))
        );

        tblDanhSach.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Mã phiếu nhập", "Ngày nhập", "Nhân viên", "Tổng hóa đơn nhập"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblDanhSach.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblDanhSachMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblDanhSach);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 0, 13)); // NOI18N
        jLabel1.setText("Sắp xếp theo:");

        cboSapXep.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Mã phiếu nhập", "Ngày nhập" }));
        cboSapXep.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cboSapXepActionPerformed(evt);
            }
        });

        btnExcel.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icon/Excel-icon.png"))); // NOI18N
        btnExcel.setText("Xuất file");
        btnExcel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnExcelActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(738, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(cboSapXep, javax.swing.GroupLayout.PREFERRED_SIZE, 145, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(25, 25, 25))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(btnExcel, javax.swing.GroupLayout.PREFERRED_SIZE, 110, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(24, 24, 24))))
            .addComponent(jScrollPane1)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(cboSapXep, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 467, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnExcel)
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents

    private void cboSapXepActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cboSapXepActionPerformed
        if (cboSapXep.getSelectedItem().toString().equals("Mã Phiếu nhập")) {
            sapxep = "MaPhieuNhap asc";
        } else if (cboSapXep.getSelectedItem().toString().equals("Ngày nhập")) {
            sapxep = "NgayNhap desc";
        }
        fillDanhSachPhieuNhap();
    }//GEN-LAST:event_cboSapXepActionPerformed

    private void btnExcelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnExcelActionPerformed
        try {
            XExcel.toExcel(tblDanhSach);
        } catch (IOException ex) {
            Logger.getLogger(DanhSachPhieuNhapJPanel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnExcelActionPerformed

    private void btnInPhieuNhapActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnInPhieuNhapActionPerformed
        inPhieuNhap();
    }//GEN-LAST:event_btnInPhieuNhapActionPerformed

    private void btnXoaPhieuNhapActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXoaPhieuNhapActionPerformed
        xoaPhieuNhap();
        fillDanhSachPhieuNhap();
        ChiTietPhieuNhapDialog.setVisible(false);
    }//GEN-LAST:event_btnXoaPhieuNhapActionPerformed

    private void tblDanhSachMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblDanhSachMouseClicked
        if (evt.getClickCount() == 2) {
            fillChiTietPhieuNhap();
            ChiTietPhieuNhapDialog.setVisible(true);
        }
    }//GEN-LAST:event_tblDanhSachMouseClicked


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JDialog ChiTietPhieuNhapDialog;
    private javax.swing.JButton btnExcel;
    private javax.swing.JButton btnInPhieuNhap;
    private javax.swing.JButton btnXoaPhieuNhap;
    private javax.swing.JComboBox<String> cboSapXep;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JLabel lblMaPhieuNhap;
    private javax.swing.JLabel lblNgayLapPhieuNhap;
    private javax.swing.JLabel lblTenNhanVien;
    private javax.swing.JLabel lblTongPhieuNhap;
    private javax.swing.JTable tblChiTietPhieuNhap;
    private javax.swing.JTable tblDanhSach;
    // End of variables declaration//GEN-END:variables

    void init() {
        fillDanhSachPhieuNhap();
        initDialogOrther();
        initCenterColumnTable();
    }

    void initDialogOrther() {
        ChiTietPhieuNhapDialog.pack();
        ChiTietPhieuNhapDialog.setLocationRelativeTo(null);
        ChiTietPhieuNhapDialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
    }

    void initCenterColumnTable() {
        DefaultTableCellRenderer render = new DefaultTableCellRenderer();
        render.setHorizontalAlignment(JLabel.CENTER);
        TableColumnModel model = tblDanhSach.getColumnModel();
        TableColumnModel model2 = tblChiTietPhieuNhap.getColumnModel();
        model.getColumn(0).setCellRenderer(render);
        model.getColumn(1).setCellRenderer(render);
        model.getColumn(3).setCellRenderer(render);
        model2.getColumn(0).setCellRenderer(render);
        model2.getColumn(2).setCellRenderer(render);
        model2.getColumn(4).setCellRenderer(render);
        model2.getColumn(5).setCellRenderer(render);
        model2.getColumn(6).setCellRenderer(render);
        model2.getColumn(7).setCellRenderer(render);
    }

    private int rowPhieuNhap = 0;
    String sapxep = "MaPhieuNhap asc";

    void fillDanhSachPhieuNhap() {
        DefaultTableModel modal = (DefaultTableModel) tblDanhSach.getModel();
        modal.setRowCount(0);
        try {
            String sql = "select * from DanhSachPhieuNhap ORDER BY " + sapxep;
            ResultSet rs = JDBCUtil.query(sql);
            while (rs.next()) {
                Object[] row = new Object[]{rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)};
                modal.addRow(row);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void fillChiTietPhieuNhap() {
        rowPhieuNhap = tblDanhSach.getSelectedRow();
        DefaultTableModel modal = (DefaultTableModel) tblChiTietPhieuNhap.getModel();
        modal.setRowCount(0);
        String maphieunhap = tblDanhSach.getValueAt(rowPhieuNhap, 0).toString();
        try {
            String sql = "select * from ChiTietPhieuNhap where MaPhieuNhap = ?";
            ResultSet rs = JDBCUtil.query(sql, maphieunhap);
            lblMaPhieuNhap.setText(maphieunhap);
            lblNgayLapPhieuNhap.setText(tblDanhSach.getValueAt(rowPhieuNhap, 1).toString());
            lblTenNhanVien.setText(tblDanhSach.getValueAt(rowPhieuNhap, 2).toString());
            while (rs.next()) {
                Object[] row = new Object[]{rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11)};
                modal.addRow(row);
                lblTongPhieuNhap.setText(String.valueOf(totalPriceInvoice()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private int totalPriceInvoice() {
        int total = 0;
        for (int i = 0; i < tblChiTietPhieuNhap.getRowCount(); i++) {
            String thanhtien = tblChiTietPhieuNhap.getValueAt(i, 7).toString();
            total = total + Integer.parseInt(thanhtien);
        }
        return total;
    }

    void inPhieuNhap() {
        try {
            String maphieunhap = tblDanhSach.getValueAt(rowPhieuNhap, 0).toString();
            String reportSource = getClass().getResource("/reports/InPhieuNhapXuat.jrxml").getPath();
            JasperDesign jdesign = JRXmlLoader.load(reportSource);
            String query = "SELECT * FROM ChiTietPhieuNhap where MaPhieuNhap like '" + maphieunhap + "'";

            JRDesignQuery updateQuery = new JRDesignQuery();
            updateQuery.setText(query);

            jdesign.setQuery(updateQuery);

            JasperReport jreport = JasperCompileManager.compileReport(jdesign);
            JasperPrint jprint = JasperFillManager.fillReport(jreport, null, JDBCUtil.getConnect());

            JasperViewer.viewReport(jprint, false);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void xoaPhieuNhap() {
        try {
            String mahd = tblDanhSach.getValueAt(rowPhieuNhap, 0).toString();
            String sqlDelete = "DELETE PhieuNhap where MaPhieuNhap like '" + mahd + "'";
            PreparedStatement ps = JDBCUtil.getStmt(sqlDelete);
            ps.executeUpdate();
            Alert.success("Xoá hóa đơn thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
