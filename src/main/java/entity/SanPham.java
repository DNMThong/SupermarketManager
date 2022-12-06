package entity;

import component.table.ModelAction;
import component.table.product.EventAction;
import component.table.product.ModelProductInfo;
import dao.LoaiSanPhamDAO;
import dao.NhaCungCapDAO;
import utils.ImageUtil;

public class SanPham {

    private String MaSP;
    private String TenSP;
    private String MaLoai;
    private String MaNhaCungCap;
    private String DVT;
    private String Hinh;
    private String GhiChu;

    public SanPham() {
    }

    public SanPham(String MaSP, String TenSP, String MaLoai, String MaNhaCungCap, String DVT, String Hinh, String GhiChu) {
        this.MaSP = MaSP;
        this.TenSP = TenSP;
        this.MaLoai = MaLoai;
        this.MaNhaCungCap = MaNhaCungCap;
        this.DVT = DVT;
        this.Hinh = Hinh;
        this.GhiChu = GhiChu;
    }

    public String getGhiChu() {
        return GhiChu;
    }

    public void setGhiChu(String GhiChu) {
        this.GhiChu = GhiChu;
    }

    public String getMaNhaCungCap() {
        return MaNhaCungCap;
    }

    public void setMaNhaCungCap(String MaNhaCungCap) {
        this.MaNhaCungCap = MaNhaCungCap;
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

    public String getDVT() {
        return DVT;
    }

    public void setDVT(String DVT) {
        this.DVT = DVT;
    }

    public String getMaLoai() {
        return MaLoai;
    }

    public void setMaLoai(String MaLoai) {
        this.MaLoai = MaLoai;
    }

    public String getHinh() {
        return Hinh;
    }

    public void setHinh(String Hinh) {
        this.Hinh = Hinh;
    }

    @Override
    public String toString() {
        return this.DVT;
    }

    public Object[] toRowTable(EventAction event) {
        NhaCungCapDAO nccd = new NhaCungCapDAO();
        LoaiSanPhamDAO lspd = new LoaiSanPhamDAO();
        return new Object[]{
            new ModelProductInfo(TenSP, nccd.selectById(getMaNhaCungCap()).getTenNCC(), ImageUtil.read(getClass().getResource("/image/"+Hinh),80,60)),
                MaSP,
                lspd.selectById(getMaLoai()).getTenLoai(),
                DVT,
                GhiChu,
            new ModelAction<SanPham, EventAction>(this, event)};
    }
}

