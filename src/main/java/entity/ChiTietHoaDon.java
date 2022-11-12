/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ShariacHung
 */
public class ChiTietHoaDon {

    private String MaCTHD;
    private String NgayXuatHD;
    private String MaSP;
    private int SoLuong;
    private String TongTien;

    public ChiTietHoaDon() {
    }

    public ChiTietHoaDon(String MaCTHD, String NgayXuatHD, String MaSP, int SoLuong, String TongTien) {
        this.MaCTHD = MaCTHD;
        this.NgayXuatHD = NgayXuatHD;
        this.MaSP = MaSP;
        this.SoLuong = SoLuong;
        this.TongTien = TongTien;
    }

    public String getMaCTHD() {
        return MaCTHD;
    }

    public void setMaCTHD(String MaCTHD) {
        this.MaCTHD = MaCTHD;
    }

    public String getNgayXuatHD() {
        return NgayXuatHD;
    }

    public void setNgayXuatHD(String NgayXuatHD) {
        this.NgayXuatHD = NgayXuatHD;
    }

    public String getMaSP() {
        return MaSP;
    }

    public void setMaSP(String MaSP) {
        this.MaSP = MaSP;
    }

    public int getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }

    public String getTongTien() {
        return TongTien;
    }

    public void setTongTien(String TongTien) {
        this.TongTien = TongTien;
    }

}
