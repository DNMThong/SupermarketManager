/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ShariacHung
 */
public class ChiTietPhieuXuat {

    private String MaCTPX;
    private String MaSP;
    private int SoLuong;
    private String MaPX;
    private String MaPN;
    private String DiaChiXuat;

    public ChiTietPhieuXuat() {
    }

    public ChiTietPhieuXuat(String MaCTPX, String MaSP, int SoLuong, String MaPX, String MaPN, String DiaChiXuat) {
        this.MaCTPX = MaCTPX;
        this.MaSP = MaSP;
        this.SoLuong = SoLuong;
        this.MaPX = MaPX;
        this.MaPN = MaPN;
        this.DiaChiXuat = DiaChiXuat;
    }

    public String getMaCTPX() {
        return MaCTPX;
    }

    public void setMaCTPX(String MaCTPX) {
        this.MaCTPX = MaCTPX;
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

    public String getMaPX() {
        return MaPX;
    }

    public void setMaPX(String MaPX) {
        this.MaPX = MaPX;
    }

    public String getMaPN() {
        return MaPN;
    }

    public void setMaPN(String MaPN) {
        this.MaPN = MaPN;
    }

    public String getDiaChiXuat() {
        return DiaChiXuat;
    }

    public void setDiaChiXuat(String DiaChiXuat) {
        this.DiaChiXuat = DiaChiXuat;
    }

}
