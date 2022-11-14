package entity;

public class PhieuNhap {

    private String MaPhieuNhap;
    private String MaNV;
    private String NgayNhap;

    public PhieuNhap() {
    }

    public PhieuNhap(String MaPhieuNhap, String MaNV, String NgayNhap) {
        this.MaPhieuNhap = MaPhieuNhap;
        this.MaNV = MaNV;
        this.NgayNhap = NgayNhap;
    }

    public String getMaPhieuNhap() {
        return MaPhieuNhap;
    }

    public void setMaPhieuNhap(String MaPhieuNhap) {
        this.MaPhieuNhap = MaPhieuNhap;
    }

    public String getMaNV() {
        return MaNV;
    }

    public void setMaNV(String MaNV) {
        this.MaNV = MaNV;
    }

    public String getNgayNhap() {
        return NgayNhap;
    }

    public void setNgayNhap(String NgayNhap) {
        this.NgayNhap = NgayNhap;
    }

}
