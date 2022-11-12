/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ShariacHung
 */
public class PhieuXuat {

    private String MaPhieuXuat;
    private String MaNV;
    private String MaNCC;
    private String NgayXuat;

    public PhieuXuat() {
    }

    public PhieuXuat(String MaPhieuXuat, String MaNV, String MaNCC, String NgayXuat) {
        this.MaPhieuXuat = MaPhieuXuat;
        this.MaNV = MaNV;
        this.MaNCC = MaNCC;
        this.NgayXuat = NgayXuat;
    }

    public String getMaPhieuXuat() {
        return MaPhieuXuat;
    }

    public void setMaPhieuXuat(String MaPhieuXuat) {
        this.MaPhieuXuat = MaPhieuXuat;
    }

    public String getMaNV() {
        return MaNV;
    }

    public void setMaNV(String MaNV) {
        this.MaNV = MaNV;
    }

    public String getMaNCC() {
        return MaNCC;
    }

    public void setMaNCC(String MaNCC) {
        this.MaNCC = MaNCC;
    }

    public String getNgayXuat() {
        return NgayXuat;
    }

    public void setNgayXuat(String NgayXuat) {
        this.NgayXuat = NgayXuat;
    }

}
