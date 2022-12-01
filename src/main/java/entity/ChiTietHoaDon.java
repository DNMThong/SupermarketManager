package entity;

import java.util.Date;

public class ChiTietHoaDon {

    private String MaHD;
    private String MaSanPham;
    private String MaPhieuXuat;
    private int SoLuong;

    public ChiTietHoaDon() {
    }

    public ChiTietHoaDon(String MaHD, String MaSanPham, String MaPhieuXuat, int SoLuong) {
        this.MaHD = MaHD;
        this.MaSanPham = MaSanPham;
        this.MaPhieuXuat = MaPhieuXuat;
        this.SoLuong = SoLuong;
    }

    public String getMaHD() {
        return MaHD;
    }

    public void setMaHD(String MaHD) {
        this.MaHD = MaHD;
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
