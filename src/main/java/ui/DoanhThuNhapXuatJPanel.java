package ui;

import component.chart.ModelChart;
import component.datechooser.EventDateChooser;
import component.datechooser.SelectedAction;
import component.datechooser.SelectedDate;
import java.awt.Color;
import java.sql.ResultSet;
import javax.swing.JLabel;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;
import utils.JDBCUtil;

public class DoanhThuNhapXuatJPanel extends javax.swing.JPanel {

    public DoanhThuNhapXuatJPanel() {
        initComponents();
        init();

    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        dateChooserFrom = new component.datechooser.DateChooser();
        dateChooserTo = new component.datechooser.DateChooser();
        tabs = new javax.swing.JTabbedPane();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        cboNam = new javax.swing.JComboBox<>();
        jLabel2 = new javax.swing.JLabel();
        txtFrom = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txtTo = new javax.swing.JTextField();
        btnTruyVan = new javax.swing.JButton();
        chart = new component.chart.Chart();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblSanPham = new javax.swing.JTable();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblLoaiSanPham = new javax.swing.JTable();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();

        dateChooserFrom.setForeground(new java.awt.Color(102, 153, 255));
        dateChooserFrom.setDateFormat("yyyy-MM-dd");
        dateChooserFrom.setTextRefernce(txtFrom);

        dateChooserTo.setForeground(new java.awt.Color(51, 102, 255));
        dateChooserTo.setDateFormat("yyyy-MM-dd");
        dateChooserTo.setTextRefernce(txtTo);

        tabs.setBackground(new java.awt.Color(204, 204, 255));

        jLabel1.setFont(new java.awt.Font("Open Sans", 1, 18)); // NOI18N
        jLabel1.setText("Doanh thu nhập xuất qua các năm");

        cboNam.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Tất cả" }));
        cboNam.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cboNamActionPerformed(evt);
            }
        });

        jLabel2.setText("Từ ngày:");

        jLabel3.setText("đến");

        btnTruyVan.setText("Truy vấn");
        btnTruyVan.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTruyVanActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap(223, Short.MAX_VALUE)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(cboNam, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(69, 69, 69)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtFrom, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtTo, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(btnTruyVan)
                .addContainerGap())
            .addComponent(chart, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(0, 0, 0)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnTruyVan)
                    .addComponent(jLabel2)
                    .addComponent(txtFrom, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3)
                    .addComponent(txtTo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(cboNam, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1))
                .addGap(0, 0, 0)
                .addComponent(chart, javax.swing.GroupLayout.DEFAULT_SIZE, 534, Short.MAX_VALUE))
        );

        tabs.addTab("Biểu đồ", jPanel1);

        tblSanPham.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "STT", "Mã sản phẩm", "Tên sản phẩm", "Số lượng"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(tblSanPham);
        if (tblSanPham.getColumnModel().getColumnCount() > 0) {
            tblSanPham.getColumnModel().getColumn(0).setMinWidth(60);
            tblSanPham.getColumnModel().getColumn(0).setMaxWidth(60);
            tblSanPham.getColumnModel().getColumn(1).setMinWidth(120);
            tblSanPham.getColumnModel().getColumn(1).setMaxWidth(120);
            tblSanPham.getColumnModel().getColumn(3).setMinWidth(80);
            tblSanPham.getColumnModel().getColumn(3).setMaxWidth(80);
        }

        tblLoaiSanPham.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "STT", "Loại sản phẩm", "Số lượng"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane2.setViewportView(tblLoaiSanPham);
        if (tblLoaiSanPham.getColumnModel().getColumnCount() > 0) {
            tblLoaiSanPham.getColumnModel().getColumn(0).setMinWidth(60);
            tblLoaiSanPham.getColumnModel().getColumn(0).setMaxWidth(60);
            tblLoaiSanPham.getColumnModel().getColumn(2).setMinWidth(80);
            tblLoaiSanPham.getColumnModel().getColumn(2).setMaxWidth(80);
        }

        jLabel4.setFont(new java.awt.Font("Open Sans", 1, 18)); // NOI18N
        jLabel4.setText("Loại sản phẩm bán chạy nhất");

        jLabel5.setFont(new java.awt.Font("Open Sans", 1, 18)); // NOI18N
        jLabel5.setText("Sản phẩm bán chạy nhất");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 583, Short.MAX_VALUE)
                .addGap(12, 12, 12)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 423, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addGap(176, 176, 176)
                .addComponent(jLabel5)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel4)
                .addGap(87, 87, 87))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(0, 0, 0)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel4, javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel5, javax.swing.GroupLayout.Alignment.TRAILING))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 522, Short.MAX_VALUE)
                    .addComponent(jScrollPane2)))
        );

        tabs.addTab("Thống kê", jPanel2);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(tabs)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(tabs)
        );
    }// </editor-fold>//GEN-END:initComponents

    private void cboNamActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cboNamActionPerformed
        chart.clear();
        if (cboNam.getSelectedItem() == "Tất cả") {
            selectDoanhThuNam();
        } else {
            String nam = cboNam.getSelectedItem().toString();
            sql = "select * from TongTienDoanhThu where Year = " + nam + " order by Year asc, Month asc";
            selectDoanhThuThang();
        }
        chart.start();
    }//GEN-LAST:event_cboNamActionPerformed

    private void btnTruyVanActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTruyVanActionPerformed
        chart.clear();
        try {
            String sql = "select * from TruyVanDoanhThuTrongKhoang where NgayXuat >= '" + txtFrom.getText() + "' and NgayXuat <= '" + txtTo.getText() + "'";
            ResultSet rs = JDBCUtil.query(sql);
            while (rs.next()) {
                chart.addData(new ModelChart(rs.getString(1), new double[]{rs.getLong(2), rs.getLong(3)}));
            }
            rs.close();
            chart.start();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }//GEN-LAST:event_btnTruyVanActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnTruyVan;
    private javax.swing.JComboBox<String> cboNam;
    private component.chart.Chart chart;
    private component.datechooser.DateChooser dateChooserFrom;
    private component.datechooser.DateChooser dateChooserTo;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTabbedPane tabs;
    private javax.swing.JTable tblLoaiSanPham;
    private javax.swing.JTable tblSanPham;
    private javax.swing.JTextField txtFrom;
    private javax.swing.JTextField txtTo;
    // End of variables declaration//GEN-END:variables

    void init() {
        initActionOrther();
        addYearInComboBox();
        selectDoanhThuNam();
        setBackground(new Color(250, 250, 250));
        chart.addLegend("Chi tiêu nhập hàng", new Color(245, 189, 135));
        chart.addLegend("Doanh thu", new Color(135, 189, 245));
        chart.start();
        initCenterColumnTable();
        selectSanPhamBanChayNhat();
        selectLoaiSanPhamBanChayNhat();
        txtFrom.setText(null);
        txtTo.setText(null);
    }

    void initCenterColumnTable() {
        DefaultTableCellRenderer render = new DefaultTableCellRenderer();
        render.setHorizontalAlignment(JLabel.CENTER);
        TableColumnModel model = tblSanPham.getColumnModel();
        TableColumnModel model2 = tblLoaiSanPham.getColumnModel();
        model.getColumn(0).setCellRenderer(render);
        model.getColumn(1).setCellRenderer(render);
        model.getColumn(3).setCellRenderer(render);
        model2.getColumn(0).setCellRenderer(render);
        model2.getColumn(2).setCellRenderer(render);
    }

    void initActionOrther() {
        dateChooserFrom.addEventDateChooser(new EventDateChooser() {
            @Override
            public void dateSelected(SelectedAction action, SelectedDate date) {
                System.out.println(date.getDay() + "-" + date.getMonth() + "-" + date.getYear());
                if (action.getAction() == SelectedAction.DAY_SELECTED) {
                    dateChooserFrom.hidePopup();
                }
            }
        });
        dateChooserTo.addEventDateChooser(new EventDateChooser() {
            @Override
            public void dateSelected(SelectedAction action, SelectedDate date) {
                System.out.println(date.getDay() + "-" + date.getMonth() + "-" + date.getYear());
                if (action.getAction() == SelectedAction.DAY_SELECTED) {
                    dateChooserTo.hidePopup();
                }
            }
        });
    }

    void selectDoanhThuNam() {
        try {
            String sql = "SELECT [Year], [Tiền nhập hàng], [Tiền bán hàng] FROM [QLDA_SieuThi].[dbo].[TongTienDoanhThu] order by Year asc";
            ResultSet rs = JDBCUtil.query(sql);
            while (rs.next()) {
                chart.addData(new ModelChart("Năm " + rs.getString(1), new double[]{rs.getLong(2), rs.getLong(3)}));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    String sql;

    void selectDoanhThuThang() {
        try {
            ResultSet rs = JDBCUtil.query(sql);
            while (rs.next()) {
                chart.addData(new ModelChart(rs.getString(1) + "-" + rs.getString(2), new double[]{rs.getLong(3), rs.getLong(4)}));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void addYearInComboBox() {
        try {
            String sql = "select DISTINCT Year from TongTienDoanhThu order by Year desc";
            ResultSet rs = JDBCUtil.query(sql);
            while (rs.next()) {
                cboNam.addItem(rs.getString(1));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void selectSanPhamBanChayNhat() {
        try {
            int indexRow = 1;
            DefaultTableModel modal = (DefaultTableModel) tblSanPham.getModel();
            String sql = "select * from [Top10SanPhamBanChayNhat] order by [SoLuong] desc";
            ResultSet rs = JDBCUtil.query(sql);
            while (rs.next()) {
                Object[] row = new Object[]{indexRow++, rs.getString(1), rs.getString(2), rs.getString(3)};
                modal.addRow(row);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void selectLoaiSanPhamBanChayNhat() {
        try {
            int indexRow = 1;
            DefaultTableModel modal = (DefaultTableModel) tblLoaiSanPham.getModel();
            String sql = "select * from Top10LoaiSanPhamBanChayNhat";
            ResultSet rs = JDBCUtil.query(sql);
            while (rs.next()) {
                Object[] row = new Object[]{indexRow++, rs.getString(1), rs.getString(2)};
                modal.addRow(row);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
