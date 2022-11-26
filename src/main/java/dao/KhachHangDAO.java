package dao;

import entity.KhachHang;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.JDBCUtil;

public class KhachHangDAO extends SupermarketManagerDAO<KhachHang, String> {

    @Override
    public void insert(KhachHang entity) {
        String sql = "INSERT INTO KhachHang (MaKH, HoTen, SDT,GioiTinh, Email,DiaChi, DoThanMat) VALUES (?, ?, ?, ?, ?, ?, ?)";
        JDBCUtil.update(sql,
                entity.getMaKhachHang(),
                entity.getHoTen(),
                entity.getSDT(),
                entity.isGioiTinh(),
                entity.getEmail(),
                entity.getDiaChi(),
                entity.getDoThanMat());
    }

    @Override
    public void update(KhachHang entity) {
        String sql = "UPDATE KhachHang SET HoTen = ?, SDT = ?,GioiTinh = ?, Email = ?, DiaChi = ?, DoThanMat = ? WHERE MaKH = ?";
        JDBCUtil.update(sql,
                entity.getHoTen(),
                entity.getSDT(),
                entity.isGioiTinh(),
                entity.getEmail(),
                entity.getDiaChi(),
                entity.getDoThanMat(),
                entity.getMaKhachHang());
    }

    @Override
    public void delete(String maKH) {
        String sql = "DELETE FROM KhachHang WHERE maKH = ?";
        JDBCUtil.update(sql, maKH);
    }

    @Override
    public KhachHang selectById(String MaKH) {
        String sql = "SELECT * FROM KhachHang WHERE MaKH = ?";
        List<KhachHang> list = this.selectBySql(sql, MaKH);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<KhachHang> selectAll() {
        String sql = "SELECT * FROM KhachHang";
        return selectBySql(sql);
    }

    @Override
    protected List<KhachHang> selectBySql(String sql, Object... args) {
        List<KhachHang> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JDBCUtil.query(sql, args);
                while (rs.next()) {
                    KhachHang entity = new KhachHang();
                    entity.setMaKhachHang(rs.getString(1));
                    entity.setHoTen(rs.getString(2));
                    entity.setSDT(rs.getString(3));
                    entity.setGioiTinh(rs.getBoolean(4));
                    entity.setEmail(rs.getString(5));
                    entity.setDiaChi(rs.getString(6));
                    entity.setDoThanMat(rs.getInt(7));
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
