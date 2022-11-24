package entity;

public class NhanVien {

    private String MaNV;
    private String HoTen;
    private String SDT;
    private String DiaChi;
    private String Email;
    private boolean GioiTinh;
    private String MatKhau;
    private boolean VaiTro;
    private String Hinh;

    public NhanVien() {
    }

    public NhanVien(String MaNV, String HoTen, String SDT, String DiaChi, String Email, boolean GioiTinh, String MatKhau, boolean VaiTro, String Hinh) {
        this.MaNV = MaNV;
        this.HoTen = HoTen;
        this.SDT = SDT;
        this.DiaChi = DiaChi;
        this.Email = Email;
        this.GioiTinh = GioiTinh;
        this.MatKhau = MatKhau;
        this.VaiTro = VaiTro;
        this.Hinh = Hinh;
    }

    public String getMaNV() {
        return MaNV;
    }

    public void setMaNV(String MaNV) {
        this.MaNV = MaNV;
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

    public String getDiaChi() {
        return DiaChi;
    }

    public void setDiaChi(String DiaChi) {
        this.DiaChi = DiaChi;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public boolean getGioiTinh() {
        return GioiTinh;
    }

    public void setGioiTinh(boolean GioiTinh) {
        this.GioiTinh = GioiTinh;
    }

    public String getMatKhau() {
        return MatKhau;
    }

    public void setMatKhau(String MatKhau) {
        this.MatKhau = MatKhau;
    }

    public boolean getVaiTro() {
        return VaiTro;
    }

    public void setVaiTro(boolean VaiTro) {
        this.VaiTro = VaiTro;
    }

    public String getHinh() {
        return Hinh;
    }

    public void setHinh(String Hinh) {
        this.Hinh = Hinh;
    }

}
