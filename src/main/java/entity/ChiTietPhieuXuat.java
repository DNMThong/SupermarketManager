package entity;

public class ChiTietPhieuXuat {

    private String MaPhieuXuat;
    private String MaSanPham;
    private int GiaXuat;
    private int SoLuong;

    public ChiTietPhieuXuat() {
    }

    
    public ChiTietPhieuXuat(String MaPhieuXuat, String MaSanPham, int GiaXuat, int SoLuong) {
        this.MaPhieuXuat = MaPhieuXuat;
        this.MaSanPham = MaSanPham;
        this.GiaXuat = GiaXuat;
        this.SoLuong = SoLuong;
    }

    public String getMaPhieuXuat() {
        return MaPhieuXuat;
    }

    public void setMaPhieuXuat(String MaPhieuXuat) {
        this.MaPhieuXuat = MaPhieuXuat;
    }

    public String getMaSanPham() {
        return MaSanPham;
    }

    public void setMaSanPham(String MaSanPham) {
        this.MaSanPham = MaSanPham;
    }

    public int getGiaXuat() {
        return GiaXuat;
    }

    public void setGiaXuat(int GiaXuat) {
        this.GiaXuat = GiaXuat;
    }

    public int getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }   

}
