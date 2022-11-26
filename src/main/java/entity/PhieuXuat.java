package entity;

import java.util.Date;

public class PhieuXuat {

    private String MaPhieuXuat;
    private Date NgayXuat;
    private String MaNhanVien;

    public PhieuXuat() {
    }

    public PhieuXuat(String MaPhieuXuat, Date NgayXuat, String MaNhanVien) {
        this.MaPhieuXuat = MaPhieuXuat;
        this.NgayXuat = NgayXuat;
        this.MaNhanVien = MaNhanVien;
    }

    public String getMaPhieuXuat() {
        return MaPhieuXuat;
    }

    public void setMaPhieuXuat(String MaPhieuXuat) {
        this.MaPhieuXuat = MaPhieuXuat;
    }

    public Date getNgayXuat() {
        return NgayXuat;
    }

    public void setNgayXuat(Date NgayXuat) {
        this.NgayXuat = NgayXuat;
    }

    public String getMaNhanVien() {
        return MaNhanVien;
    }

    public void setMaNhanVien(String MaNhanVien) {
        this.MaNhanVien = MaNhanVien;
    }
}
