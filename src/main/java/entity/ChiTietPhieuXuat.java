package entity;

public class ChiTietPhieuXuat {

    private String MaCTPX;
    private String MaPX;
    private String MaSP;
    private String TenSP;
    private int SoLuong;
    private String DiaChiXuat;

    public ChiTietPhieuXuat() {
    }

    public ChiTietPhieuXuat(String MaCTPX, String MaPX, String MaSP, String TenSP, int SoLuong, String DiaChiXuat) {
        this.MaCTPX = MaCTPX;
        this.MaPX = MaPX;
        this.MaSP = MaSP;
        this.TenSP = TenSP;
        this.SoLuong = SoLuong;
        this.DiaChiXuat = DiaChiXuat;
    }

    public String getMaCTPX() {
        return MaCTPX;
    }

    public void setMaCTPX(String MaCTPX) {
        this.MaCTPX = MaCTPX;
    }

    public String getMaPX() {
        return MaPX;
    }

    public void setMaPX(String MaPX) {
        this.MaPX = MaPX;
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
