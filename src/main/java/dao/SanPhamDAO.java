package dao;

import entity.SanPham;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.JDBCUtil;

public class SanPhamDAO extends SupermarketManagerDAO<SanPham, String> {

    @Override
    public void insert(SanPham entity) {
        String sql = "INSERT INTO SanPham (MaSP, TenSP, DVT, GiaSP, SoLuongTrongKho, SoLuongTrenQuay, TenLoai, TenNCC, Hinh) VALUES (?, ?, ?, ?, ?, ?, ?)";
        JDBCUtil.update(sql,
                entity.getMaSP(),
                entity.getTenSP(),
                entity.getDVT(),
                entity.getGiaSP(),
                entity.getSoLuongTrongKho(),
                entity.getSoLuongTrenQuay(),
                entity.getTenLoai(),
                entity.getTenNCC(),
                entity.getHinh());
    }

    @Override
    public void update(SanPham entity) {
        String sql = "UPDATE SanPham SET TenSP = ?, DVT = ?, GiaSP = ?, SoLuongTrongKho = ?, SoLuongTrenQuay = ? TenLoai = ?, TenNCC = ?, Hinh = ? WHERE MaSP = ?";
        JDBCUtil.update(sql,
                entity.getTenSP(),
                entity.getDVT(),
                entity.getGiaSP(),
                entity.getSoLuongTrongKho(),
                entity.getSoLuongTrenQuay(),
                entity.getTenLoai(),
                entity.getTenNCC(),
                entity.getHinh(),
                entity.getMaSP());
    }

    @Override
    public void delete(String maSP) {
        String sql = "DELETE FROM NhanVien WHERE MaNV = ?";
        JDBCUtil.update(sql, maSP);
    }

    @Override
    public SanPham selectById(String MaSP) {
        // xem thông tin sản phẩm
        String sql = "SELECT * FROM SanPham WHERE MaSP = ?";
        List<SanPham> list = this.selectBySql(sql, MaSP);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<SanPham> selectAll() {
        String sql = "SELECT * FROM SanPham";
        return selectBySql(sql);
    }

    @Override
    protected List<SanPham> selectBySql(String sql, Object... args) {
        List<SanPham> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JDBCUtil.query(sql, args);
                while (rs.next()) {
                    SanPham entity = new SanPham();
                    entity.setMaSP(rs.getString(1));
                    entity.setTenSP(rs.getString(2));
                    entity.setDVT(rs.getString(3));
                    entity.setGiaSP(rs.getInt(4));
                    entity.setSoLuongTrongKho(rs.getInt(5));
                    entity.setSoLuongTrenQuay(rs.getInt(6));
                    entity.setTenLoai(rs.getString(7));
                    entity.setTenNCC(rs.getString(8));
                    entity.setHinh(rs.getString(9));
                    list.add(entity);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                rs.getStatement().getConnection().close();
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return list;
    }

}
