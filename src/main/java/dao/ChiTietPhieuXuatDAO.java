package dao;

import entity.ChiTietPhieuXuat;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.JDBCUtil;

public class ChiTietPhieuXuatDAO extends SupermarketManagerDAO<ChiTietPhieuXuat, String> {

    @Override
    public void insert(ChiTietPhieuXuat entity) {
        String sql = "INSERT INTO ChiTietPhieuXuat (MaPhieuXuat, MaSP, TenSP, SoLuong, DiaChiXuat) VALUES (?, ?, ?, ?, ?)";
        JDBCUtil.update(sql,
                entity.getMaPhieuXuat(),
                entity.getMaSP(),
                entity.getTenSP(),
                entity.getSoLuong(),
                entity.getDiaChiXuat());
    }

    @Override
    public void update(ChiTietPhieuXuat entity) {
        String sql = "UPDATE ChiTietPhieuXuat SET MaSP = ?, TenSP = ?, SoLuong = ?, DiaChi = ? WHERE MaPhieuXuat = ?";
        JDBCUtil.update(sql,
                entity.getMaSP(),
                entity.getTenSP(),
                entity.getSoLuong(),
                entity.getDiaChiXuat(),
                entity.getMaPhieuXuat());
    }

    @Override
    public void delete(String MaPhieuXuat) {
        String sql = "DELETE FROM ChiTietPhieuXuat WHERE MaPhieuXuat = ?";
        JDBCUtil.update(sql, MaPhieuXuat);
    }

    @Override
    public ChiTietPhieuXuat selectById(String MaPhieuXuat) {
        String sql = "SELECT * FROM ChiTietPhieuXuat WHERE MaPhieuXuat = ?";
        List<ChiTietPhieuXuat> list = this.selectBySql(sql, MaPhieuXuat);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<ChiTietPhieuXuat> selectAll() {
        String sql = "SELECT * FROM ChiTietPhieuXuat";
        return selectBySql(sql);
    }

    @Override
    protected List<ChiTietPhieuXuat> selectBySql(String sql, Object... args) {
        List<ChiTietPhieuXuat> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JDBCUtil.query(sql, args);
                while (rs.next()) {
                    ChiTietPhieuXuat entity = new ChiTietPhieuXuat();
                    entity.setMaPhieuXuat(rs.getString(1));
                    entity.setMaSP(rs.getString(2));
                    entity.setTenSP(rs.getString(3));
                    entity.setSoLuong(rs.getInt(4));
                    entity.setDiaChiXuat(rs.getString(5));
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
