package entity;

import java.util.Objects;

public class SanPham {

    private String MaSP;
    private String TenSP;
    private String DVT;
    private String GiaSP;
    private String TenLoai;
    private String TenNCC;
    private String Hinh;

    public SanPham() {
    }

    public SanPham(String MaSP, String TenSP, String DVT, String GiaSP, String TenLoai, String TenNCC, String Hinh) {
        this.MaSP = MaSP;
        this.TenSP = TenSP;
        this.DVT = DVT;
        this.GiaSP = GiaSP;
        this.TenLoai = TenLoai;
        this.TenNCC = TenNCC;
        this.Hinh = Hinh;
    }

    public String getMaSP() {
        return MaSP;
    }

    public void setMaSP(String MaSP) {
        this.MaSP = MaSP;
    }

    public String getTenSP() {
        return TenSP;
    }

    public void setTenSP(String TenSP) {
        this.TenSP = TenSP;
    }

    public String getDVT() {
        return DVT;
    }

    public void setDVT(String DVT) {
        this.DVT = DVT;
    }

    public String getGiaSP() {
        return GiaSP;
    }

    public void setGiaSP(String GiaSP) {
        this.GiaSP = GiaSP;
    }

    public String getTenLoai() {
        return TenLoai;
    }

    public void setTenLoai(String TenLoai) {
        this.TenLoai = TenLoai;
    }

    public String getTenNCC() {
        return TenNCC;
    }

    public void setTenNCC(String TenNCC) {
        this.TenNCC = TenNCC;
    }

    public String getHinh() {
        return Hinh;
    }

    public void setHinh(String Hinh) {
        this.Hinh = Hinh;
    }

}
