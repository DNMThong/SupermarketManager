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
        String sql = "INSERT INTO ChiTietPhieuNhap (MaPhieuNhap, MaSP, TenSP, SoLuong, GiaNhap, GiaBan, MaNCC) VALUES (?, ?, ?, ?, ?, ?, ?)";
        JDBCUtil.update(sql,
                entity.getMaPhieuNhap(),
                entity.getMaSP(),
                entity.getTenSP(),
                entity.getSoLuong(),
                entity.getGiaNhap(),
                entity.getGiaBan(),
                entity.getMaNCC());
    }

    @Override
    public void update(ChiTietPhieuNhap entity) {
        String sql = "UPDATE ChiTietPhieuNhap SET MaSP = ?, TenSP= ?, SoLuong= ?, GiaNhap= ?, GiaBan= ?, MaNCC= ? WHERE MaPhieuNhap= ?";
        JDBCUtil.update(sql,
                entity.getMaSP(),
                entity.getTenSP(),
                entity.getSoLuong(),
                entity.getGiaNhap(),
                entity.getGiaBan(),
                entity.getMaNCC(),
                entity.getMaPhieuNhap());
    }

    @Override
    public void delete(String MaPhieuNhap) {
        String sql = "DELETE FROM ChiTietPhieuNhap WHERE MaPhieuNhap = ?";
        JDBCUtil.update(sql, MaPhieuNhap);
    }

    @Override
    public ChiTietPhieuNhap selectById(String MaPhieuNhap) {
        String sql = "SELECT * FROM ChiTietPhieuNhap WHERE MaPhieuNhap = ?";
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
                    entity.setMaSP(rs.getString(2));
                    entity.setTenSP(rs.getString(3));
                    entity.setSoLuong(rs.getInt(4));
                    entity.setGiaBan(rs.getString(5));
                    entity.setGiaNhap(rs.getString(6));
                    entity.setMaNCC(rs.getString(7));
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
