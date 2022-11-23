package dao;

import entity.HoaDon;
import entity.PhieuNhap;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.JDBCUtil;

public class PhieuNhapDAO extends SupermarketManagerDAO<PhieuNhap, String> {

    @Override
    public void insert(PhieuNhap entity) {
        String sql = "INSERT INTO PhieuNhap (MaPhieuNhap, NgayNhap, TenNV) VALUES (?, ?, ?)";
        JDBCUtil.update(sql,
                entity.getMaPhieuNhap(),
                entity.getNgayNhap(),
                entity.getTenNV());
    }

    @Override
    public void update(PhieuNhap entity) {
        String sql = "UPDATE PhieuNhap SET NgayNhap = ?, TenNV = ? WHERE MaPhieuNhap = ?";
        JDBCUtil.update(sql,
                entity.getNgayNhap(),
                entity.getTenNV(),
                entity.getMaPhieuNhap());
    }

    @Override
    public void delete(String MaPhieuNhap) {
        String sql = "DELETE FROM PhieuNhap WHERE MaPhieuNhap = ?";
        JDBCUtil.update(sql, MaPhieuNhap);
    }

    @Override
    public PhieuNhap selectById(String MaPhieuNhap) {
        String sql = "SELECT * FROM PhieuNhap WHERE MaPhieuNhap = ?";
        List<PhieuNhap> list = this.selectBySql(sql, MaPhieuNhap);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<PhieuNhap> selectAll() {
        String sql = "SELECT * FROM PhieuNhap";
        return selectBySql(sql);
    }

    @Override
    protected List<PhieuNhap> selectBySql(String sql, Object... args) {
        List<PhieuNhap> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JDBCUtil.query(sql, args);
                while (rs.next()) {
                    PhieuNhap entity = new PhieuNhap();
                    entity.setMaPhieuNhap(rs.getString(1));
                    entity.setNgayNhap(rs.getString(2));
                    entity.setTenNV(rs.getString(3));
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
