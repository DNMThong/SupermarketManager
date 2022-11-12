/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ShariacHung
 */
public class KhachHang {

    private String MaKH;
    private String HoTen;
    private String SDT;
    private String DiaChi;
    private String DoThanMat;

    public KhachHang() {
    }

    public KhachHang(String MaKH, String HoTen, String SDT, String DiaChi, String DoThanMat) {
        this.MaKH = MaKH;
        this.HoTen = HoTen;
        this.SDT = SDT;
        this.DiaChi = DiaChi;
        this.DoThanMat = DoThanMat;
    }

    public String getMaKH() {
        return MaKH;
    }

    public void setMaKH(String MaKH) {
        this.MaKH = MaKH;
    }

    public String getHoTen() {
        return HoTen;
    }

    public void setHoTen(String HoTen) {
        this.HoTen = HoTen;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public void setDiaChi(String DiaChi) {
        this.DiaChi = DiaChi;
    }

    public String getDoThanMat() {
        return DoThanMat;
    }

    public void setDoThanMat(String DoThanMat) {
        this.DoThanMat = DoThanMat;
    }

}
