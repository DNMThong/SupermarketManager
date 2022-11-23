package entity;

public class KhachHang {

    private String MaKH;
    private String HoTen;
    private String SDT;
    private String Email;
    private String DoThanMat;

    public KhachHang() {
    }

    public KhachHang(String MaKH, String HoTen, String SDT, String Email, String DoThanMat) {
        this.MaKH = MaKH;
        this.HoTen = HoTen;
        this.SDT = SDT;
        this.Email = Email;
        this.DoThanMat = DoThanMat;
    }

    public String getMaKH() {
        return MaKH;
    }

    public void setMaKH(String MaKH) {
        this.MaKH = MaKH;
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

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getDoThanMat() {
        return DoThanMat;
    }

    public void setDoThanMat(String DoThanMat) {
        this.DoThanMat = DoThanMat;
    }

}
