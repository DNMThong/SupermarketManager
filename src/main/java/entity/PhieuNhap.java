package entity;

import java.util.Date;

public class PhieuNhap {

    private String MaPhieuNhap;
    private Date NgayNhap;
    private String MaNhanVien;

    public PhieuNhap() {
    }

    public PhieuNhap(String MaPhieuNhap, Date NgayNhap, String MaNhanVien) {
        this.MaPhieuNhap = MaPhieuNhap;
        this.NgayNhap = NgayNhap;
        this.MaNhanVien = MaNhanVien;
    }

    public String getMaPhieuNhap() {
        return MaPhieuNhap;
    }

    public void setMaPhieuNhap(String MaPhieuNhap) {
        this.MaPhieuNhap = MaPhieuNhap;
    }

    public Date getNgayNhap() {
        return NgayNhap;
    }

    public void setNgayNhap(Date NgayNhap) {
        this.NgayNhap = NgayNhap;
    }

    public String getMaNhanVien() {
        return MaNhanVien;
    }

    public void setMaNhanVien(String MaNhanVien) {
        this.MaNhanVien = MaNhanVien;
    }

    

   

}
