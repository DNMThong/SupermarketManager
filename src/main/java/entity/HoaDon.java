package entity;

public class HoaDon {

    private String MaHoaDon;
    private String NgayXuat;
    private String TenNV;
    private String TenKH;

    public HoaDon() {
    }

    public HoaDon(String MaHoaDon, String NgayXuat, String TenNV, String TenKH) {
        this.MaHoaDon = MaHoaDon;
        this.NgayXuat = NgayXuat;
        this.TenNV = TenNV;
        this.TenKH = TenKH;
    }

    public String getMaHoaDon() {
        return MaHoaDon;
    }

    public void setMaHoaDon(String MaHoaDon) {
        this.MaHoaDon = MaHoaDon;
    }

    public String getNgayXuat() {
        return NgayXuat;
    }

    public void setNgayXuat(String NgayXuat) {
        this.NgayXuat = NgayXuat;
    }

    public String getTenNV() {
        return TenNV;
    }

    public void setTenNV(String TenNV) {
        this.TenNV = TenNV;
    }

    public String getTenKH() {
        return TenKH;
    }

    public void setTenKH(String TenKH) {
        this.TenKH = TenKH;
    }

}
