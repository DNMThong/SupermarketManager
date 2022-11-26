package entity;

import java.util.Date;

public class ChiTietHoaDon {

    private String MaHoaDon;
    private String MaSanPham;
    private String MaPhieuXuat;
    private int SoLuong;

    public ChiTietHoaDon() {
    }

    public ChiTietHoaDon(String MaHoaDon, String MaSanPham, String MaPhieuXuat, int SoLuong) {
        this.MaHoaDon = MaHoaDon;
        this.MaSanPham = MaSanPham;
        this.MaPhieuXuat = MaPhieuXuat;
        this.SoLuong = SoLuong;
    }

    public String getMaHoaDon() {
        return MaHoaDon;
    }

    public void setMaHoaDon(String MaHoaDon) {
        this.MaHoaDon = MaHoaDon;
    }

    public String getMaSanPham() {
        return MaSanPham;
    }

    public void setMaSanPham(String MaSanPham) {
        this.MaSanPham = MaSanPham;
    }

    public String getMaPhieuXuat() {
        return MaPhieuXuat;
    }

    public void setMaPhieuXuat(String MaPhieuXuat) {
        this.MaPhieuXuat = MaPhieuXuat;
    }

    public int getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }

}
