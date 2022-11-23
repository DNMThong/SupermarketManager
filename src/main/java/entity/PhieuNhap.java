package entity;

public class PhieuNhap {

    private String MaPhieuNhap;
    private String NgayNhap;
    private String TenNV;

    public PhieuNhap() {
    }

    public PhieuNhap(String MaPhieuNhap, String NgayNhap, String TenNV) {
        this.MaPhieuNhap = MaPhieuNhap;
        this.NgayNhap = NgayNhap;
        this.TenNV = TenNV;
    }

    public String getMaPhieuNhap() {
        return MaPhieuNhap;
    }

    public void setMaPhieuNhap(String MaPhieuNhap) {
        this.MaPhieuNhap = MaPhieuNhap;
    }

    public String getNgayNhap() {
        return NgayNhap;
    }

    public void setNgayNhap(String NgayNhap) {
        this.NgayNhap = NgayNhap;
    }

    public String getTenNV() {
        return TenNV;
    }

    public void setTenNV(String TenNV) {
        this.TenNV = TenNV;
    }

}
