package entity;

import java.util.Date;

public class NhaCungCap {

    private String MaNCC;
    private String TenNCC;
    private String SDT;
    private String Email;
    private String DiaChi;
    private Date NgayHopTac;

    public NhaCungCap() {
    }

    public NhaCungCap(String MaNCC, String TenNCC, String SDT, String Email, String DiaChi, Date NgayHopTac) {
        this.MaNCC = MaNCC;
        this.TenNCC = TenNCC;
        this.SDT = SDT;
        this.Email = Email;
        this.DiaChi = DiaChi;
        this.NgayHopTac = NgayHopTac;
    }

    public String getMaNCC() {
        return MaNCC;
    }

    public void setMaNCC(String MaNCC) {
        this.MaNCC = MaNCC;
    }

    public String getTenNCC() {
        return TenNCC;
    }

    public void setTenNCC(String TenNCC) {
        this.TenNCC = TenNCC;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public void setDiaChi(String DiaChi) {
        this.DiaChi = DiaChi;
    }

    public Date getNgayHopTac() {
        return NgayHopTac;
    }

    public void setNgayHopTac(Date NgayHopTac) {
        this.NgayHopTac = NgayHopTac;
    }

}
