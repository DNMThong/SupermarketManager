package entity;

import component.table.ModelAction;
import component.table.staff.EventAction;
import component.table.staff.ModelStaffInfo;
import utils.ImageUtil;

public class NhanVien {

    private String MaNhanVien;
    private String HoTen;
    private boolean GioiTinh;
    private String SDT;
    private String Email;
    private String DiaChi;
    private String MatKhau;
    private boolean VaiTro;
    private String Hinh;

    public NhanVien() {
    }

    public NhanVien(String MaNhanVien, String HoTen, boolean GioiTinh, String SDT, String Email, String DiaChi, String MatKhau, boolean VaiTro, String Hinh) {
        this.MaNhanVien = MaNhanVien;
        this.HoTen = HoTen;
        this.GioiTinh = GioiTinh;
        this.SDT = SDT;
        this.Email = Email;
        this.DiaChi = DiaChi;
        this.MatKhau = MatKhau;
        this.VaiTro = VaiTro;
        this.Hinh = Hinh;
    }



    public String getMaNhanVien() {
        return MaNhanVien;
    }

    public void setMaNhanVien(String MaNV) {
        this.MaNhanVien = MaNV;
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

    /**
     *
     * Header: "Thông tin nhân viên", "Mã nhân viên", "Email", "Số điện thoại", "Mật khẩu", "Action"
     */
    public Object[] toRowTable(EventAction event) {
        return new Object[]{
                new ModelStaffInfo(HoTen, GioiTinh, ImageUtil.read(getClass().getResource("/image/"+getHinh()),60,80)),
                MaNhanVien,
                Email,
                SDT,
                MatKhau,
                VaiTro?"Trưởng phòng":"Nhân viên",
                new ModelAction<NhanVien, EventAction>(this, event)};
    }
}
