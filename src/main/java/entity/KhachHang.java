package entity;

public class KhachHang {

    private String MaKhachHang;
    private String HoTen;
    private String SDT;
    private boolean GioiTinh;
    private String Email;
    private String DiaChi;
    private int DoThanMat;

    public KhachHang() {
    }

    public KhachHang(String MaKhachHang, String HoTen, String SDT, boolean GioiTinh, String Email, String DiaChi, int DoThanMat) {
        this.MaKhachHang = MaKhachHang;
        this.HoTen = HoTen;
        this.SDT = SDT;
        this.GioiTinh = GioiTinh;
        this.Email = Email;
        this.DiaChi = DiaChi;
        this.DoThanMat = DoThanMat;
    }

    public String getMaKhachHang() {
        return MaKhachHang;
    }

    public void setMaKhachHang(String MaKhachHang) {
        this.MaKhachHang = MaKhachHang;
    }

    public String getHoTen() {
        return HoTen;
    }

    public void setHoTen(String HoTen) {
        this.HoTen = HoTen;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public boolean isGioiTinh() {
        return GioiTinh;
    }

    public void setGioiTinh(boolean GioiTinh) {
        this.GioiTinh = GioiTinh;
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

    public int getDoThanMat() {
        return DoThanMat;
    }

    public void setDoThanMat(int DoThanMat) {
        this.DoThanMat = DoThanMat;
    }

    

}
