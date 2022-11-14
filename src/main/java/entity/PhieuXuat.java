package entity;

public class PhieuXuat {

    private String MaPhieuXuat;
    private String NgayXuat;
    private String TenNV;
    private String TenNCC;

    public PhieuXuat() {
    }

    public PhieuXuat(String MaPhieuXuat, String NgayXuat, String TenNV, String TenNCC) {
        this.MaPhieuXuat = MaPhieuXuat;
        this.NgayXuat = NgayXuat;
        this.TenNV = TenNV;
        this.TenNCC = TenNCC;
    }

    public String getMaPhieuXuat() {
        return MaPhieuXuat;
    }

    public void setMaPhieuXuat(String MaPhieuXuat) {
        this.MaPhieuXuat = MaPhieuXuat;
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

    public String getTenNCC() {
        return TenNCC;
    }

    public void setTenNCC(String TenNCC) {
        this.TenNCC = TenNCC;
    }

}
