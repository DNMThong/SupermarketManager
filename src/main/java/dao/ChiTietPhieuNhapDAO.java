package dao;

import entity.ChiTietPhieuNhap;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.JDBCUtil;

public class ChiTietPhieuNhapDAO extends SupermarketManagerDAO<ChiTietPhieuNhap, String> {

    @Override
    public void insert(ChiTietPhieuNhap entity) {
        String sql = "INSERT INTO CTPN (MaPhieuNhap, MaSP, GiaNhap, SoLuong) VALUES (?, ?, ?, ?)";
        JDBCUtil.update(sql,
                entity.getMaPhieuNhap(),
                entity.getMaSanPham(),
                entity.getGiaNhap(),
                entity.getSoLuong());
    }

    @Override
    public void update(ChiTietPhieuNhap entity) {
        String sql = "UPDATE CTPN SET MaSP = ?, GiaNhap= ?, SoLuong= ? WHERE MaPhieuNhap= ?";
        JDBCUtil.update(sql,
                entity.getMaSanPham(),
                entity.getGiaNhap(),
                entity.getSoLuong(),
                entity.getMaPhieuNhap());
    }

    @Override
    public void delete(String MaPhieuNhap) {
        String sql = "DELETE FROM CTPN WHERE MaPhieuNhap = ?";
        JDBCUtil.update(sql, MaPhieuNhap);
    }

    @Override
    public ChiTietPhieuNhap selectById(String MaPhieuNhap) {
        String sql = "SELECT * FROM CTPN WHERE MaPhieuNhap = ?";
        List<ChiTietPhieuNhap> list = this.selectBySql(sql, MaPhieuNhap);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<ChiTietPhieuNhap> selectAll() {
        String sql = "SELECT * FROM ChiTietPhieuNhap";
        return selectBySql(sql);
    }

    @Override
    protected List<ChiTietPhieuNhap> selectBySql(String sql, Object... args) {
        List<ChiTietPhieuNhap> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JDBCUtil.query(sql, args);
                while (rs.next()) {
                    ChiTietPhieuNhap entity = new ChiTietPhieuNhap();
                    entity.setMaPhieuNhap(rs.getString(1));
                    entity.setMaSanPham(rs.getString(2));
                    entity.setGiaNhap(rs.getInt(3));
                    entity.setSoLuong(rs.getInt(4));                   
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
