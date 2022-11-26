package dao;

import entity.ChiTietHoaDon;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.JDBCUtil;

public class ChiTietHoaDonDAO extends SupermarketManagerDAO<ChiTietHoaDon, String> {

    @Override
    public void insert(ChiTietHoaDon entity) {
        String sql = "INSERT INTO CTHD (MaHoaDon,MaSP, MaPhieuXuat, SoLuong) VALUES (?, ?, ?, ?)";
        JDBCUtil.update(sql,
                entity.getMaHoaDon(),
                entity.getMaSanPham(),
                entity.getMaPhieuXuat(),
                entity.getSoLuong());
    }

    @Override
    public void update(ChiTietHoaDon entity) {
        String sql = "UPDATE CTHD SET  MaSP=?,MaPhieuXuat=?,SoLuong = ? WHERE MaHoaDon  = ?";
        JDBCUtil.update(sql,
                entity.getMaSanPham(),
                entity.getMaPhieuXuat(),
                entity.getSoLuong(),
                entity.getMaHoaDon());
    }   

    //tạo procerduce khi xóa hóa đơn hoặc hóa đơn chi tiết thì sẽ xóa luôn cả 2 
    @Override
    public void delete(String maHoaDon) {
        String sql = "DELETE FROM CTHD WHERE MaHD = ?";
        JDBCUtil.update(sql, maHoaDon);
    }

    @Override
    public ChiTietHoaDon selectById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<ChiTietHoaDon> selectAll() {
        // có thể sẽ không cần dùng
//        String sql = "SELECT * FROM ChiTietHoaDon";
//        return selectBySql(sql);
        return null;
    }

    @Override
    protected List<ChiTietHoaDon> selectBySql(String sql, Object... args) {
        List<ChiTietHoaDon> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JDBCUtil.query(sql, args);
                while (rs.next()) {
                    ChiTietHoaDon entity = new ChiTietHoaDon();
                    entity.setMaHoaDon(rs.getString(1));
                    entity.setMaSanPham(rs.getString(2));
                    entity.setMaPhieuXuat(rs.getString(3));
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
