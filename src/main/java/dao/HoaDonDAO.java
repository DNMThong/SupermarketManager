package dao;

import entity.HoaDon;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.JDBCUtil;

public class HoaDonDAO extends SupermarketManagerDAO<HoaDon, String> {

    @Override
    public void insert(HoaDon entity) {
        String sql = "INSERT INTO HoaDon (MaHoaDon, NgayXuat, TenNV, TenKH) VALUES (?, ?, ?, ?)";
        JDBCUtil.update(sql,
                entity.getMaHoaDon(),
                entity.getNgayXuat(),
                entity.getTenNV(),
                entity.getTenKH());
    }

    @Override
    public void update(HoaDon entity) {
        String sql = "UPDATE HoaDon SET NgayXuat  = ?, TenNV = ?, TenKH = ? WHERE MaHoaDon = ?";
        JDBCUtil.update(sql,
                entity.getNgayXuat(),
                entity.getTenNV(),
                entity.getTenKH(),
                entity.getMaHoaDon());
    }

    //tạo procerduce khi xóa hóa đơn hoặc hóa đơn chi tiết thì sẽ xóa luôn cả 2 
    @Override
    public void delete(String maHoaDon) {
        String sql = "DELETE FROM HoaDon WHERE maHoaDon = ?";
        JDBCUtil.update(sql, maHoaDon);
    }

    @Override
    public HoaDon selectById(String MaHoaDon) {
        String sql = "SELECT * FROM HoaDon WHERE MaHoaDon = ?";
        List<HoaDon> list = this.selectBySql(sql, MaHoaDon);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<HoaDon> selectAll() {
        String sql = "SELECT * FROM HoaDon";
        return selectBySql(sql);
    }

    @Override
    protected List<HoaDon> selectBySql(String sql, Object... args) {
        List<HoaDon> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JDBCUtil.query(sql, args);
                while (rs.next()) {
                    HoaDon entity = new HoaDon();
                    entity.setMaHoaDon(rs.getString(1));
                    entity.setNgayXuat(rs.getString(2));
                    entity.setTenNV(rs.getString(3));
                    entity.setTenKH(rs.getString(4));
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
