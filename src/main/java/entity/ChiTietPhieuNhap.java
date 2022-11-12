/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ShariacHung
 */
public class ChiTietPhieuNhap {

    private String MaCTPN;
    private String MaSP;
    private int SoLuong;
    private String GiaNhap;
    private String GiaBan;
    private String MaNCC;
    private String MaPhieuNhap;

    public ChiTietPhieuNhap() {
    }

    public ChiTietPhieuNhap(String MaCTPN, String MaSP, int SoLuong, String GiaNhap, String GiaBan, String MaNCC, String MaPhieuNhap) {
        this.MaCTPN = MaCTPN;
        this.MaSP = MaSP;
        this.SoLuong = SoLuong;
        this.GiaNhap = GiaNhap;
        this.GiaBan = GiaBan;
        this.MaNCC = MaNCC;
        this.MaPhieuNhap = MaPhieuNhap;
    }

    public String getMaCTPN() {
        return MaCTPN;
    }

    public void setMaCTPN(String MaCTPN) {
        this.MaCTPN = MaCTPN;
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

    public String getGiaNhap() {
        return GiaNhap;
    }

    public void setGiaNhap(String GiaNhap) {
        this.GiaNhap = GiaNhap;
    }

    public String getGiaBan() {
        return GiaBan;
    }

    public void setGiaBan(String GiaBan) {
        this.GiaBan = GiaBan;
    }

    public String getMaNCC() {
        return MaNCC;
    }

    public void setMaNCC(String MaNCC) {
        this.MaNCC = MaNCC;
    }

    public String getMaPhieuNhap() {
        return MaPhieuNhap;
    }

    public void setMaPhieuNhap(String MaPhieuNhap) {
        this.MaPhieuNhap = MaPhieuNhap;
    }

}