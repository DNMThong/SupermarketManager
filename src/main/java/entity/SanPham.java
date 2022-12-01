package entity;

public class SanPham {

    private String MaSP;
    private String TenSP;
    private String DVT;
    private int GiaSP;
    private int SoLuongTrongKho;
    private int SoLuongTrenQuay;
    private String TenLoai;
    private String TenNCC;
    private String Hinh;

    public SanPham() {
    }

    public SanPham(String MaSP, String TenSP, String DVT, int GiaSP, int SoLuongTrongKho, int SoLuongTrenQuay, String TenLoai, String TenNCC, String Hinh) {
        this.MaSP = MaSP;
        this.TenSP = TenSP;
        this.DVT = DVT;
        this.GiaSP = GiaSP;
        this.SoLuongTrongKho = SoLuongTrongKho;
        this.SoLuongTrenQuay = SoLuongTrenQuay;
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

    public int getGiaSP() {
        return GiaSP;
    }

    public void setGiaSP(int GiaSP) {
        this.GiaSP = GiaSP;
    }

    public int getSoLuongTrongKho() {
        return SoLuongTrongKho;
    }

    public void setSoLuongTrongKho(int SoLuongTrongKho) {
        this.SoLuongTrongKho = SoLuongTrongKho;
    }

    public int getSoLuongTrenQuay() {
        return SoLuongTrenQuay;
    }

    public void setSoLuongTrenQuay(int SoLuongTrenQuay) {
        this.SoLuongTrenQuay = SoLuongTrenQuay;
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
