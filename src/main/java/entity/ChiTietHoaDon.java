package entity;

public class ChiTietHoaDon {

    private String MaHoaDon;
    private String NgayXuat;
    private String TenNV;
    private String TenKH;
    private String TenSP;
    private String GiaBan;
    private int SoLuong;

    public ChiTietHoaDon() {
    }

    public ChiTietHoaDon(String MaHoaDon, String NgayXuat, String TenNV, String TenKH, String TenSP, String GiaBan, int SoLuong) {
        this.MaHoaDon = MaHoaDon;
        this.NgayXuat = NgayXuat;
        this.TenNV = TenNV;
        this.TenKH = TenKH;
        this.TenSP = TenSP;
        this.GiaBan = GiaBan;
        this.SoLuong = SoLuong;
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

    public String getTenSP() {
        return TenSP;
    }

    public void setTenSP(String TenSP) {
        this.TenSP = TenSP;
    }

    public String getGiaBan() {
        return GiaBan;
    }

    public void setGiaBan(String GiaBan) {
        this.GiaBan = GiaBan;
    }

    public int getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }

}
