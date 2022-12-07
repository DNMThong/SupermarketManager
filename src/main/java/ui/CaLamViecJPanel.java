package ui;

import component.SwingCalendar.CalendarEvent;
import component.SwingCalendar.CalendarEventClickEvent;
import component.SwingCalendar.CalendarEventClickListener;
import component.SwingCalendar.WeekCalendar;
import component.datechooser.EventDateChooser;
import component.datechooser.SelectedAction;
import component.datechooser.SelectedDate;
import entity.PhanCong;
import java.awt.Color;
import java.awt.Dialog;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.swing.JComponent;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;
import utils.JDBCUtil;

public class CaLamViecJPanel extends javax.swing.JPanel {

    public CaLamViecJPanel() {
        initComponents();
        init();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        TaoLichJDialog = new javax.swing.JDialog();
        txtTieuDe = new javax.swing.JTextField();
        cboGioBatDau = new javax.swing.JComboBox<>();
        cboGioKetThuc = new javax.swing.JComboBox<>();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        cboNhanVien = new javax.swing.JComboBox<>();
        jScrollPane1 = new javax.swing.JScrollPane();
        txtGhiChu = new javax.swing.JTextArea();
        btnLuu = new javax.swing.JButton();
        txtDate = new javax.swing.JTextField();
        btnDate = new javax.swing.JButton();
        btnXoa = new javax.swing.JButton();
        dateChooser = new component.datechooser.DateChooser();
        DanhSachEventJDialog = new javax.swing.JDialog();
        jScrollPane2 = new javax.swing.JScrollPane();
        table = new javax.swing.JTable();
        btnTao = new javax.swing.JButton();
        btnList = new javax.swing.JButton();
        calendarPanel = new javax.swing.JPanel();
        datePicker = new component.datechooser.DateChooser();
        btnLastWeek = new javax.swing.JButton();
        btnToday = new javax.swing.JButton();
        btnNextWeek = new javax.swing.JButton();

        TaoLichJDialog.setTitle("Tạo việc làm mới");

        txtTieuDe.setFont(new java.awt.Font("Open Sans", 0, 16)); // NOI18N
        txtTieuDe.setText("Thêm tiêu đề");
        txtTieuDe.setPreferredSize(new java.awt.Dimension(114, 36));
        txtTieuDe.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txtTieuDeFocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                txtTieuDeFocusLost(evt);
            }
        });

        cboGioBatDau.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "07:00", "07:15", "07:30", "07:45", "08:00", "08:15", "08:30", "08:45", "09:00", "09:15", "09:30", "09:45", "10:00", "10:15", "10:30", "10:45", "11:00", "11:15", "11:30", "11:45", "12:00", "12:15", "12:30", "12:45", "13:00", "13:15", "13:30", "13:45", "14:00", "14:15", "14:30", "14:45", "15:00", "15:15", "15:30", "15:45", "16:00", "16:15", "16:30", "16:45", "17:00", "17:15", "17:30", "17:45", "18:00", "18:15", "18:30", "18:45", "19:00", "19:15", "19:30", "19:45", "20:00", "20:15", "20:30", "20:45", "21:00", "21:15", "21:30", "21:45", "22:00", "22:15", "22:30", "22:45" }));
        cboGioBatDau.setMinimumSize(new java.awt.Dimension(72, 30));
        cboGioBatDau.setPreferredSize(new java.awt.Dimension(72, 30));

        cboGioKetThuc.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "07:00", "07:15", "07:30", "07:45", "08:00", "08:15", "08:30", "08:45", "09:00", "09:15", "09:30", "09:45", "10:00", "10:15", "10:30", "10:45", "11:00", "11:15", "11:30", "11:45", "12:00", "12:15", "12:30", "12:45", "13:00", "13:15", "13:30", "13:45", "14:00", "14:15", "14:30", "14:45", "15:00", "15:15", "15:30", "15:45", "16:00", "16:15", "16:30", "16:45", "17:00", "17:15", "17:30", "17:45", "18:00", "18:15", "18:30", "18:45", "19:00", "19:15", "19:30", "19:45", "20:00", "20:15", "20:30", "20:45", "21:00", "21:15", "21:30", "21:45", "22:00", "22:15", "22:30", "22:45" }));
        cboGioKetThuc.setSelectedIndex(4);
        cboGioKetThuc.setMinimumSize(new java.awt.Dimension(72, 30));
        cboGioKetThuc.setPreferredSize(new java.awt.Dimension(72, 30));

        jLabel1.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        jLabel1.setText("-");
        jLabel1.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        jLabel1.setPreferredSize(new java.awt.Dimension(7, 26));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icon/clock-icon.png"))); // NOI18N
        jLabel2.setPreferredSize(new java.awt.Dimension(24, 28));

        jLabel3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icon/man-icon.png"))); // NOI18N

        jLabel4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icon/Apps-menu-editor-icon.png"))); // NOI18N

        cboNhanVien.setFont(new java.awt.Font("Segoe UI", 0, 13)); // NOI18N
        cboNhanVien.setPreferredSize(new java.awt.Dimension(97, 28));

        txtGhiChu.setBackground(new java.awt.Color(241, 243, 244));
        txtGhiChu.setColumns(20);
        txtGhiChu.setFont(new java.awt.Font("Open Sans", 0, 14)); // NOI18N
        txtGhiChu.setLineWrap(true);
        txtGhiChu.setRows(5);
        txtGhiChu.setText("Thêm ghi chú");
        txtGhiChu.setToolTipText("");
        txtGhiChu.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txtGhiChuFocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                txtGhiChuFocusLost(evt);
            }
        });
        jScrollPane1.setViewportView(txtGhiChu);

        btnLuu.setBackground(new java.awt.Color(26, 115, 232));
        btnLuu.setFont(new java.awt.Font("Open Sans", 1, 14)); // NOI18N
        btnLuu.setForeground(new java.awt.Color(255, 255, 255));
        btnLuu.setText("Lưu");
        btnLuu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLuuActionPerformed(evt);
            }
        });

        txtDate.setPreferredSize(new java.awt.Dimension(64, 30));

        btnDate.setText("...");
        btnDate.setPreferredSize(new java.awt.Dimension(23, 30));
        btnDate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDateActionPerformed(evt);
            }
        });

        btnXoa.setBackground(new java.awt.Color(255, 51, 102));
        btnXoa.setFont(new java.awt.Font("Open Sans", 1, 14)); // NOI18N
        btnXoa.setForeground(new java.awt.Color(255, 255, 255));
        btnXoa.setText("Xóa");
        btnXoa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnXoaActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout TaoLichJDialogLayout = new javax.swing.GroupLayout(TaoLichJDialog.getContentPane());
        TaoLichJDialog.getContentPane().setLayout(TaoLichJDialogLayout);
        TaoLichJDialogLayout.setHorizontalGroup(
            TaoLichJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(TaoLichJDialogLayout.createSequentialGroup()
                .addGap(29, 29, 29)
                .addGroup(TaoLichJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(TaoLichJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(TaoLichJDialogLayout.createSequentialGroup()
                        .addComponent(btnXoa, javax.swing.GroupLayout.PREFERRED_SIZE, 87, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(14, 14, 14)
                        .addComponent(btnLuu, javax.swing.GroupLayout.PREFERRED_SIZE, 87, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(TaoLichJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addComponent(txtTieuDe, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(TaoLichJDialogLayout.createSequentialGroup()
                            .addComponent(txtDate, javax.swing.GroupLayout.PREFERRED_SIZE, 182, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                            .addComponent(btnDate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGap(24, 24, 24)
                            .addComponent(cboGioBatDau, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                            .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                            .addComponent(cboGioKetThuc, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 398, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(cboNhanVien, javax.swing.GroupLayout.PREFERRED_SIZE, 217, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(35, Short.MAX_VALUE))
        );
        TaoLichJDialogLayout.setVerticalGroup(
            TaoLichJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(TaoLichJDialogLayout.createSequentialGroup()
                .addGap(17, 17, 17)
                .addComponent(txtTieuDe, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(TaoLichJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(TaoLichJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(cboGioBatDau, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(txtDate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(btnDate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(cboGioKetThuc, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(11, 11, 11)
                .addGroup(TaoLichJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(cboNhanVien, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(TaoLichJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4))
                .addGap(18, 18, 18)
                .addGroup(TaoLichJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnLuu, javax.swing.GroupLayout.PREFERRED_SIZE, 34, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnXoa, javax.swing.GroupLayout.PREFERRED_SIZE, 34, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(18, Short.MAX_VALUE))
        );

        dateChooser.setForeground(new java.awt.Color(51, 102, 255));
        dateChooser.setDateFormat("yyyy-MM-dd");
        dateChooser.setTextRefernce(txtDate);

        DanhSachEventJDialog.setTitle("Chỉnh sửa");

        table.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Ngày tạo", "Nhân viên", "Ngày làm", "Giờ vào", "Giờ tan", "Ghi Chú"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane2.setViewportView(table);

        javax.swing.GroupLayout DanhSachEventJDialogLayout = new javax.swing.GroupLayout(DanhSachEventJDialog.getContentPane());
        DanhSachEventJDialog.getContentPane().setLayout(DanhSachEventJDialogLayout);
        DanhSachEventJDialogLayout.setHorizontalGroup(
            DanhSachEventJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 900, Short.MAX_VALUE)
        );
        DanhSachEventJDialogLayout.setVerticalGroup(
            DanhSachEventJDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 522, Short.MAX_VALUE)
        );

        btnTao.setFont(new java.awt.Font("Open Sans", 1, 18)); // NOI18N
        btnTao.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icon/schedule.png"))); // NOI18N
        btnTao.setText(" Tạo");
        btnTao.setFocusable(false);
        btnTao.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTaoActionPerformed(evt);
            }
        });

        btnList.setFont(new java.awt.Font("Open Sans", 1, 18)); // NOI18N
        btnList.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icon/Actions-view-list-details-icon.png"))); // NOI18N
        btnList.setText("Danh sách");
        btnList.setFocusable(false);
        btnList.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnListActionPerformed(evt);
            }
        });

        calendarPanel.setLayout(new java.awt.BorderLayout());

        datePicker.setForeground(new java.awt.Color(0, 102, 255));
        datePicker.setDateFormat("yyyy-MM-dd");

        btnLastWeek.setFont(new java.awt.Font("Open Sans", 0, 12)); // NOI18N
        btnLastWeek.setText("<");
        btnLastWeek.setFocusable(false);
        btnLastWeek.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLastWeekActionPerformed(evt);
            }
        });

        btnToday.setFont(new java.awt.Font("Open Sans", 0, 12)); // NOI18N
        btnToday.setText("Today");
        btnToday.setFocusable(false);
        btnToday.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTodayActionPerformed(evt);
            }
        });

        btnNextWeek.setFont(new java.awt.Font("Open Sans", 0, 12)); // NOI18N
        btnNextWeek.setText(">");
        btnNextWeek.setFocusable(false);
        btnNextWeek.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnNextWeekActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(btnTao)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnList))
                    .addComponent(datePicker, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(31, 31, 31)
                        .addComponent(btnLastWeek, javax.swing.GroupLayout.PREFERRED_SIZE, 51, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnToday)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnNextWeek, javax.swing.GroupLayout.PREFERRED_SIZE, 51, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(calendarPanel, javax.swing.GroupLayout.DEFAULT_SIZE, 800, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(24, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnLastWeek, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnToday, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnNextWeek, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnTao, javax.swing.GroupLayout.PREFERRED_SIZE, 55, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnList, javax.swing.GroupLayout.PREFERRED_SIZE, 55, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(datePicker, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(287, Short.MAX_VALUE))
            .addComponent(calendarPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents

    private void btnTaoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTaoActionPerformed
        btnXoa.setText("Hủy");
        btnLuu.setText("Lưu");
        TaoLichJDialog.setVisible(true);
    }//GEN-LAST:event_btnTaoActionPerformed

    private void btnListActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnListActionPerformed
        initCenterColumnTable();
        DanhSachEventJDialog.setVisible(true);
    }//GEN-LAST:event_btnListActionPerformed

    private void txtTieuDeFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtTieuDeFocusGained
        // TODO add your handling code here:
        if (txtTieuDe.getText().equals("Thêm tiêu đề")) {
            txtTieuDe.setForeground(Color.BLACK);
            txtTieuDe.setText("");
        }
    }//GEN-LAST:event_txtTieuDeFocusGained

    private void txtTieuDeFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtTieuDeFocusLost
        // TODO add your handling code here:
        if (txtTieuDe.getText().isEmpty()) {
            txtTieuDe.setForeground(Color.GRAY);
            txtTieuDe.setText("Thêm tiêu đề");
        }
    }//GEN-LAST:event_txtTieuDeFocusLost

    private void txtGhiChuFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtGhiChuFocusGained
        // TODO add your handling code here:
        if (txtGhiChu.getText().equals("Thêm ghi chú")) {
            txtGhiChu.setForeground(Color.BLACK);
            txtGhiChu.setText("");
        }
    }//GEN-LAST:event_txtGhiChuFocusGained

    private void txtGhiChuFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtGhiChuFocusLost
        // TODO add your handling code here:
        if (txtGhiChu.getText().isEmpty()) {
            txtGhiChu.setForeground(Color.GRAY);
            txtGhiChu.setText("Thêm ghi chú");
        }
    }//GEN-LAST:event_txtGhiChuFocusLost

    private void btnLuuActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLuuActionPerformed
        if (btnLuu.getText().equals("Lưu")) {
            insert();
            fillToCalendar();
            TaoLichJDialog.setVisible(false);
            calendarPanel.revalidate();
            calendarPanel.repaint();
        } else {

        }
    }//GEN-LAST:event_btnLuuActionPerformed

    private void btnDateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDateActionPerformed
        // TODO add your handling code here:
        dateChooser.showPopup();
    }//GEN-LAST:event_btnDateActionPerformed

    private void btnXoaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXoaActionPerformed
        // TODO add your handling code here:
        TaoLichJDialog.dispose();
        remove();
        fillToCalendar();
        calendarPanel.revalidate();
        calendarPanel.repaint();
    }//GEN-LAST:event_btnXoaActionPerformed

    private void btnLastWeekActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLastWeekActionPerformed
        // TODO add your handling code here:
        cal.prevWeek();
    }//GEN-LAST:event_btnLastWeekActionPerformed

    private void btnTodayActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTodayActionPerformed
        // TODO add your handling code here:
        cal.goToToday();
    }//GEN-LAST:event_btnTodayActionPerformed

    private void btnNextWeekActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnNextWeekActionPerformed
        // TODO add your handling code here:
        cal.nextWeek();
    }//GEN-LAST:event_btnNextWeekActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JDialog DanhSachEventJDialog;
    private javax.swing.JDialog TaoLichJDialog;
    private javax.swing.JButton btnDate;
    private javax.swing.JButton btnLastWeek;
    private javax.swing.JButton btnList;
    private javax.swing.JButton btnLuu;
    private javax.swing.JButton btnNextWeek;
    private javax.swing.JButton btnTao;
    private javax.swing.JButton btnToday;
    private javax.swing.JButton btnXoa;
    private javax.swing.JPanel calendarPanel;
    private javax.swing.JComboBox<String> cboGioBatDau;
    private javax.swing.JComboBox<String> cboGioKetThuc;
    private javax.swing.JComboBox<String> cboNhanVien;
    private component.datechooser.DateChooser dateChooser;
    private component.datechooser.DateChooser datePicker;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable table;
    private javax.swing.JTextField txtDate;
    private javax.swing.JTextArea txtGhiChu;
    private javax.swing.JTextField txtTieuDe;
    // End of variables declaration//GEN-END:variables

    void init() {
        addNhanVienInComboBox();
        initJDialogOrther();
        initActionOrther();
        fillToCalendar();
    }

    void initJDialogOrther() {
        TaoLichJDialog.pack();
        TaoLichJDialog.setLocationRelativeTo(null);
        TaoLichJDialog.setModalityType(Dialog.ModalityType.APPLICATION_MODAL);
        TaoLichJDialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);

        DanhSachEventJDialog.pack();
        DanhSachEventJDialog.setLocationRelativeTo(null);
        DanhSachEventJDialog.setModalityType(Dialog.ModalityType.APPLICATION_MODAL);
        DanhSachEventJDialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
    }

    void initActionOrther() {
        dateChooser.addEventDateChooser(new EventDateChooser() {
            @Override
            public void dateSelected(SelectedAction action, SelectedDate date) {
                if (action.getAction() == SelectedAction.DAY_SELECTED) {
                    dateChooser.hidePopup();
                }
            }
        });
        datePicker.addEventDateChooser(new EventDateChooser() {
            @Override
            public void dateSelected(SelectedAction action, SelectedDate date) {
                btnXoa.setText("Hủy");
                btnLuu.setText("Lưu");
                txtDate.setText(date.getDay() + "-" + date.getMonth() + "-" + date.getYear());
                txtGhiChu.setText(null);
                TaoLichJDialog.setVisible(true);
            }
        });
        cal.addCalendarEventClickListener(e -> System.out.println(e.getCalendarEvent()));
        cal.addCalendarEventClickListener(new CalendarEventClickListener() {
            @Override
            public void calendarEventClick(CalendarEventClickEvent e) {
                btnXoa.setText("Xóa");
                btnLuu.setText("Sửa");
                txtDate.setText(e.getCalendarEvent().getDate().toString());
                cboGioBatDau.setSelectedItem(e.getCalendarEvent().getStart().toString());
                cboGioKetThuc.setSelectedItem(e.getCalendarEvent().getEnd().toString());
                cboNhanVien.setSelectedItem(e.getCalendarEvent().getText());
                txtGhiChu.setText(e.getCalendarEvent().getText());
                TaoLichJDialog.setVisible(true);
            }
        });
    }

    void initCenterColumnTable() {
        DefaultTableCellRenderer render = new DefaultTableCellRenderer();
        render.setHorizontalAlignment(JLabel.CENTER);
        TableColumnModel model = table.getColumnModel();
        model.getColumn(0).setCellRenderer(render);
        model.getColumn(2).setCellRenderer(render);
        model.getColumn(3).setCellRenderer(render);
    }

    ArrayList<CalendarEvent> events = new ArrayList<>();
    WeekCalendar cal = new WeekCalendar(events);

    ArrayList<PhanCong> listPC = new ArrayList<>();

    void fillToCalendar() {
        try {
            String sql = "select * from DanhSachPhanCong order by GioVao desc";
            ResultSet rs = JDBCUtil.query(sql);
            while (rs.next()) {
                Date date = rs.getDate(2);
                String GioLamString = rs.getString(2);
                String GioTanString = rs.getString(3);

                SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
                // ngày Dương Lịch // lấy date
                java.util.Calendar calendar = new GregorianCalendar();
                calendar.setTime(date);
                int year = calendar.get(java.util.Calendar.YEAR);
                int month = calendar.get(java.util.Calendar.MONTH) + 1;
                int day = calendar.get(java.util.Calendar.DAY_OF_MONTH);

                // lấy time
                Date dateTimeIn = format.parse(GioLamString);
                Date dateTimeOut = format.parse(GioTanString);
                calendar.setTime(dateTimeIn);
                calendar.setTime(dateTimeOut);

//                PhanCong pc = new PhanCong();
//                pc.setNgayKhoiTao(rs.getString(1));
//                pc.setNhanVien(rs.getString(2));
//                pc.setNgayLam(rs.getDate(3));
//                pc.setGioLam(dateTimeIn.getHours() + ":" + dateTimeIn.getMinutes());
//                pc.setGioTan(dateTimeOut.getHours() + ":" + dateTimeOut.getMinutes());
//                pc.setGhiChu(rs.getString(6));
//                listPC.add(pc);
                events.add(new CalendarEvent(LocalDate.of(year, month, day), LocalTime.of(dateTimeIn.getHours(), dateTimeIn.getMinutes()), LocalTime.of(dateTimeOut.getHours(), dateTimeOut.getMinutes()), rs.getString(5) + "\n" + rs.getString(6)));
            }
            rs.close();
            calendarPanel.add((JComponent) cal);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    void filltoTable() {
//        DefaultTableModel modal = (DefaultTableModel) table.getModel();
//        for (PhanCong pc1 : listPC) {
//            Object[] row = new Object[]{pc1.getNgayKhoiTao(), pc1.getNhanVien(), pc1.getNgayLam(), pc1.getGioLam(), pc1.getGioTan(), pc1.getGhiChu()};
//            modal.addRow(row);
//        }
//    }

    void insert() {
        try {
            String QueryInsert = "insert into PhanCong(ngaykhoitao, GioVao, GioTan, ghichu, HoTen) values (?,?,?,?,?)";
            PreparedStatement ps = JDBCUtil.getConnect().prepareStatement(QueryInsert);

            String date = txtDate.getText();
            java.util.Date utilDate = new java.util.Date();
            java.sql.Timestamp sq = new java.sql.Timestamp(utilDate.getTime());

            String patternDateTime = "yyyy-MM-dd hh:mm:ss";
            SimpleDateFormat formatDateTime = new SimpleDateFormat(patternDateTime);
            String dateTimeInStr = date + " " + cboGioBatDau.getSelectedItem().toString() + ":00";
            String dateTimeOutStr = date + " " + cboGioKetThuc.getSelectedItem().toString() + ":00";
            long millisecondsIn = formatDateTime.parse(dateTimeInStr).getTime();
            Timestamp timeIn = new Timestamp(millisecondsIn);
            long millisecondsOut = formatDateTime.parse(dateTimeOutStr).getTime();
            Timestamp timeOut = new Timestamp(millisecondsOut);

            ps.setTimestamp(1, sq);
            ps.setTimestamp(2, timeIn);
            ps.setTimestamp(3, timeOut);
            ps.setString(4, txtGhiChu.getText());
            ps.setString(5, (String) cboNhanVien.getSelectedItem());
            ps.executeUpdate();
            ps.close();
            JOptionPane.showMessageDialog(this, "Tạo ca làm mới thành công");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void remove() {
        if (btnXoa.getText().equals("Xóa")) {
            String dateTimeIn = txtDate.getText() + " " + cboGioBatDau.getSelectedItem().toString() + ":00";
            String dateTimeOut = txtDate.getText() + " " + cboGioKetThuc.getSelectedItem().toString() + ":00";
            String sql = "DELETE FROM Calam WHERE giovaolam = '" + dateTimeIn + "' and gioketthuc = '" + dateTimeOut + "'";
            try {
                PreparedStatement ps = JDBCUtil.getConnect().prepareStatement(sql);
                ps.executeUpdate();
                ps.close();
                JOptionPane.showMessageDialog(this, "Xóa ca làm thành công");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            TaoLichJDialog.dispose();
        }
    }

    void addNhanVienInComboBox() {
        try {
            String sql = "select distinct HoTen from NhanVien";
            ResultSet rs = JDBCUtil.query(sql);
            while (rs.next()) {
                cboNhanVien.addItem(rs.getString(1));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
