/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JDialog.java to edit this template
 */
package ui;

import com.formdev.flatlaf.FlatIntelliJLaf;
import javax.swing.UnsupportedLookAndFeelException;

/**
 *
 * @author ShariacHung
 */
public class DangNhapJDialog extends javax.swing.JDialog {

    public DangNhapJDialog(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        this.setUndecorated(true);
        initComponents();
        this.setLocationRelativeTo(null);
    }

    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        pnlBackground = new javax.swing.JPanel();
        lblClose = new javax.swing.JLabel();
        lblDangNhap = new javax.swing.JLabel();
        lblHeThong = new javax.swing.JLabel();
        lblTenDangNhap = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        btnDangNhap = new javax.swing.JButton();
        btnThoat = new javax.swing.JButton();
        lblAnh = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setPreferredSize(new java.awt.Dimension(370, 368));

        pnlBackground.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        lblClose.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icon/delete-1-icon.png"))); // NOI18N
        lblClose.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        lblClose.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lblCloseMouseClicked(evt);
            }
        });
        pnlBackground.add(lblClose, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 4, -1, 30));

        lblDangNhap.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        lblDangNhap.setForeground(new java.awt.Color(255, 255, 255));
        lblDangNhap.setText("ĐĂNG NHẬP");
        pnlBackground.add(lblDangNhap, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 30, -1, -1));

        lblHeThong.setFont(new java.awt.Font("Segoe UI", 2, 13)); // NOI18N
        lblHeThong.setForeground(new java.awt.Color(255, 255, 255));
        lblHeThong.setText("Hệ thống quản lý bán hàng siêu thị");
        pnlBackground.add(lblHeThong, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 60, -1, -1));

        lblTenDangNhap.setFont(new java.awt.Font("Segoe UI", 1, 16)); // NOI18N
        lblTenDangNhap.setForeground(new java.awt.Color(255, 255, 255));
        lblTenDangNhap.setText("Tên tài khoản");
        pnlBackground.add(lblTenDangNhap, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 100, -1, -1));

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 16)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Mật khẩu");
        pnlBackground.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 190, -1, -1));

        btnDangNhap.setBackground(new java.awt.Color(255, 153, 153));
        btnDangNhap.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icon/Close-icon.png"))); // NOI18N
        btnDangNhap.setText("Thoát");
        btnDangNhap.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnDangNhap.setFocusable(false);
        pnlBackground.add(btnDangNhap, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 280, 120, 36));

        btnThoat.setBackground(new java.awt.Color(102, 153, 255));
        btnThoat.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icon/store-icon-removebg-preview.png"))); // NOI18N
        btnThoat.setText("Đăng nhập");
        btnThoat.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnThoat.setFocusable(false);
        pnlBackground.add(btnThoat, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 280, 130, 36));

        lblAnh.setIcon(new javax.swing.ImageIcon(getClass().getResource("/image/Dangnhap.png"))); // NOI18N
        pnlBackground.add(lblAnh, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, -1, -1));

        getContentPane().add(pnlBackground, java.awt.BorderLayout.CENTER);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void lblCloseMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lblCloseMouseClicked
        // TODO add your handling code here:
        System.exit(0);
    }//GEN-LAST:event_lblCloseMouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        try {
            javax.swing.UIManager.setLookAndFeel(new FlatIntelliJLaf());
            javax.swing.UIManager.put("TitlePane.unifiedBackground", true);
        } catch (UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(DangNhapJDialog.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                DangNhapJDialog dialog = new DangNhapJDialog(new javax.swing.JFrame(), true);
                dialog.addWindowListener(new java.awt.event.WindowAdapter() {
                    @Override
                    public void windowClosing(java.awt.event.WindowEvent e) {
                        System.exit(0);
                    }
                });
                dialog.setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnDangNhap;
    private javax.swing.JButton btnThoat;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel lblAnh;
    private javax.swing.JLabel lblClose;
    private javax.swing.JLabel lblDangNhap;
    private javax.swing.JLabel lblHeThong;
    private javax.swing.JLabel lblTenDangNhap;
    private javax.swing.JPanel pnlBackground;
    // End of variables declaration//GEN-END:variables
}
