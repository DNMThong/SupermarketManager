package entity;

import java.util.Date;

public class PhanCong {

    private String MaPhanCong;
    private Date GioVao;
    private Date GioTan;
    private double TongThoiGian;
    private String GhiChu;
    private String MaNhanVien;

    public PhanCong() {
    }

    public String getMaPhanCong() {
        return MaPhanCong;
    }

    public void setMaPhanCong(String MaPhanCong) {
        this.MaPhanCong = MaPhanCong;
    }

    public Date getGioVao() {
        return GioVao;
    }

    public void setGioVao(Date GioVao) {
        this.GioVao = GioVao;
    }

    public Date getGioTan() {
        return GioTan;
    }

    public void setGioTan(Date GioTan) {
        this.GioTan = GioTan;
    }

    public double getTongThoiGian() {
        return TongThoiGian;
    }

    public void setTongThoiGian(double TongThoiGian) {
        this.TongThoiGian = TongThoiGian;
    }

    public String getGhiChu() {
        return GhiChu;
    }

    public void setGhiChu(String GhiChu) {
        this.GhiChu = GhiChu;
    }

    public String getMaNhanVien() {
        return MaNhanVien;
    }

    public void setMaNhanVien(String MaNhanVien) {
        this.MaNhanVien = MaNhanVien;
    }

    public PhanCong(String MaPhanCong, Date GioVao, Date GioTan, double TongThoiGian, String GhiChu, String MaNhanVien) {
        this.MaPhanCong = MaPhanCong;
        this.GioVao = GioVao;
        this.GioTan = GioTan;
        this.TongThoiGian = TongThoiGian;
        this.GhiChu = GhiChu;
        this.MaNhanVien = MaNhanVien;
    }

   

}
