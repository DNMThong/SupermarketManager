package entity;

import java.util.Date;

public class PhanCong {

    private String NgayKhoiTao;
    private Date NgayLam;
    private String NhanVien;
    private String GioLam;
    private String GioTan;
    private String GhiChu;

    public PhanCong() {
    }


    public PhanCong(String NgayKhoiTao, Date NgayLam, String NhanVien, String GioLam, String GioTan, String GhiChu) {
        this.NgayKhoiTao = NgayKhoiTao;
        this.NgayLam = NgayLam;
        this.NhanVien = NhanVien;
        this.GioLam = GioLam;
        this.GioTan = GioTan;
        this.GhiChu = GhiChu;
    }

    public String getNgayKhoiTao() {
        return NgayKhoiTao;
    }

    public void setNgayKhoiTao(String NgayKhoiTao) {
        this.NgayKhoiTao = NgayKhoiTao;
    }

    public Date getNgayLam() {
        return NgayLam;
    }

    public void setNgayLam(Date NgayLam) {
        this.NgayLam = NgayLam;
    }

    public String getNhanVien() {
        return NhanVien;
    }

    public void setNhanVien(String NhanVien) {
        this.NhanVien = NhanVien;
    }

    public String getGioLam() {
        return GioLam;
    }

    public void setGioLam(String GioLam) {
        this.GioLam = GioLam;
    }

    public String getGioTan() {
        return GioTan;
    }

    public void setGioTan(String GioTan) {
        this.GioTan = GioTan;
    }

    public String getGhiChu() {
        return GhiChu;
    }

    public void setGhiChu(String GhiChu) {
        this.GhiChu = GhiChu;
    }


}
