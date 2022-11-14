package entity;

public class PhanCong {

    private String MaPhanCong;
    private String TenNV;
    private String GioVao;
    private String GioTan;
    private String TongThoiGian;
    private String GhiChu;

    public PhanCong() {
    }

    public PhanCong(String MaPhanCong, String TenNV, String GioVao, String GioTan, String TongThoiGian, String GhiChu) {
        this.MaPhanCong = MaPhanCong;
        this.TenNV = TenNV;
        this.GioVao = GioVao;
        this.GioTan = GioTan;
        this.TongThoiGian = TongThoiGian;
        this.GhiChu = GhiChu;
    }

    public String getMaPhanCong() {
        return MaPhanCong;
    }

    public void setMaPhanCong(String MaPhanCong) {
        this.MaPhanCong = MaPhanCong;
    }

    public String getTenNV() {
        return TenNV;
    }

    public void setTenNV(String TenNV) {
        this.TenNV = TenNV;
    }

    public String getGioVao() {
        return GioVao;
    }

    public void setGioVao(String GioVao) {
        this.GioVao = GioVao;
    }

    public String getGioTan() {
        return GioTan;
    }

    public void setGioTan(String GioTan) {
        this.GioTan = GioTan;
    }

    public String getTongThoiGian() {
        return TongThoiGian;
    }

    public void setTongThoiGian(String TongThoiGian) {
        this.TongThoiGian = TongThoiGian;
    }

    public String getGhiChu() {
        return GhiChu;
    }

    public void setGhiChu(String GhiChu) {
        this.GhiChu = GhiChu;
    }

}
