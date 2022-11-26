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

    private String MaPhieuNhap;
    private String MaSanPham;
    private int GiaNhap;
    private int SoLuong;
    public ChiTietPhieuNhap() {
    }

    public ChiTietPhieuNhap(String MaPhieuNhap, String MaSanPham, int GiaNhap, int SoLuong) {
        this.MaPhieuNhap = MaPhieuNhap;
        this.MaSanPham = MaSanPham;
        this.GiaNhap = GiaNhap;
        this.SoLuong = SoLuong;
    }

    public String getMaPhieuNhap() {
        return MaPhieuNhap;
    }

    public void setMaPhieuNhap(String MaPhieuNhap) {
        this.MaPhieuNhap = MaPhieuNhap;
    }

    public String getMaSanPham() {
        return MaSanPham;
    }

    public void setMaSanPham(String MaSanPham) {
        this.MaSanPham = MaSanPham;
    }

    public int getGiaNhap() {
        return GiaNhap;
    }

    public void setGiaNhap(int GiaNhap) {
        this.GiaNhap = GiaNhap;
    }

    public int getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }

    
}
