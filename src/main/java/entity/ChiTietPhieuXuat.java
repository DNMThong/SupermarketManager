package entity;

public class ChiTietPhieuXuat {

    private String MaPhieuXuat;
    private String MaSP;
    private String TenSP;
    private int SoLuong;
    private String DiaChiXuat;

    public ChiTietPhieuXuat() {
    }

    public ChiTietPhieuXuat(String MaPhieuXuat, String MaSP, String TenSP, int SoLuong, String DiaChiXuat) {
        this.MaPhieuXuat = MaPhieuXuat;
        this.MaSP = MaSP;
        this.TenSP = TenSP;
        this.SoLuong = SoLuong;
        this.DiaChiXuat = DiaChiXuat;
    }

    public String getMaPhieuXuat() {
        return MaPhieuXuat;
    }

    public void setMaPhieuXuat(String MaPhieuXuat) {
        this.MaPhieuXuat = MaPhieuXuat;
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

    public int getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }

    public String getDiaChiXuat() {
        return DiaChiXuat;
    }

    public void setDiaChiXuat(String DiaChiXuat) {
        this.DiaChiXuat = DiaChiXuat;
    }

}
