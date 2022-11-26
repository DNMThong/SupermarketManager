package dao;

import entity.PhieuXuat;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.JDBCUtil;

public class PhieuXuatDAO extends SupermarketManagerDAO<PhieuXuat, String> {

    @Override
    public void insert(PhieuXuat entity) {
        String sql = "INSERT INTO PhieuXuat (MaPhieuXuat, NgayXuat, MaNV) VALUES (?, ?, ?, ?)";
        JDBCUtil.update(sql,
                entity.getMaPhieuXuat(),
                entity.getNgayXuat(),
                entity.getMaNhanVien());
    }

    @Override
    public void update(PhieuXuat entity) {
        String sql = "UPDATE PhieuXuat SET NgayXuat = ?, MaNV = ? WHERE MaPhieuXuat = ?";
        JDBCUtil.update(sql,
                entity.getNgayXuat(),
                entity.getMaNhanVien(),
                entity.getMaPhieuXuat());
    }

    @Override
    public void delete(String MaPhieuXuat) {
        String sql = "DELETE FROM PhieuXuat WHERE MaPhieuXuat = ?";
        JDBCUtil.update(sql, MaPhieuXuat);
    }

    @Override
    public PhieuXuat selectById(String MaPhieuXuat) {
        String sql = "SELECT * FROM PhieuXuat WHERE MaPhieuXuat = ?";
        List<PhieuXuat> list = this.selectBySql(sql, MaPhieuXuat);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<PhieuXuat> selectAll() {
        String sql = "SELECT * FROM PhieuXuat";
        return selectBySql(sql);
    }

    @Override
    protected List<PhieuXuat> selectBySql(String sql, Object... args) {
        List<PhieuXuat> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JDBCUtil.query(sql, args);
                while (rs.next()) {
                    PhieuXuat entity = new PhieuXuat();
                    entity.setMaPhieuXuat(rs.getString(1));
                    entity.setNgayXuat(rs.getDate(2));
                    entity.setMaNhanVien(rs.getString(3));
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
