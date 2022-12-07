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
        String sql = "INSERT INTO SanPham (MaSP, TenSP, DVT, MaLoai, MaNCC, Hinh, GhiChu) VALUES (?, ?, ?, ?, ?, ?,?)";
        JDBCUtil.update(sql,
                entity.getMaSP(),
                entity.getTenSP(),
                entity.getDVT(),
                entity.getMaLoai(),
                entity.getMaNhaCungCap(),
                entity.getHinh(),
                entity.getGhiChu());
    }

    @Override
    public void update(SanPham entity) {
        String sql = "UPDATE SanPham SET TenSP = ?, DVT = ?,MaLoai = ?, MaNCC = ?, Hinh = ? ,GhiChu = ? WHERE MaSP = ?";
        JDBCUtil.update(sql,
                entity.getTenSP(),
                entity.getDVT(),
                entity.getMaLoai(),
                entity.getMaNhaCungCap(),
                entity.getHinh(),
                entity.getGhiChu(),
                entity.getMaSP());
                
    }

    @Override
    public void delete(String maSP) {
        String sql = "DELETE FROM SanPham WHERE MaSP = ?";
        int i = JDBCUtil.update(sql, maSP);
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
                    entity.setMaLoai(rs.getString(4));
                    entity.setMaNhaCungCap(rs.getString(5));
                    entity.setHinh(rs.getString(6));
                    entity.setGhiChu(rs.getString(7));
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

    public List<String> getDVT() {
        List<String> list = new ArrayList();
        String sql = "select DISTINCT DVT from SanPham";
        try {
            ResultSet rs = JDBCUtil.query(sql);
            try {
                while (rs.next()) {
                    list.add(rs.getString(1));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally{
                rs.getStatement().getConnection().close();
            }
        } catch(SQLException ex) {
            throw new RuntimeException(ex);
        }
        return list;
    }

    public List<Object[]> viewSanPhamBan() {
        String sql = "Select * view_BanSanPham";
        String colums[] = {"Mã Sản Phẩm", "Mã Phiếu Xuất","Tên Sản Phẩm", "Hình", "Tên NCC", "Đơn Vị Tính", "Tên Loại", "Giá Xuất"};
        return this.getListOfArray(sql, colums);

    }

    private List<Object[]> getListOfArray(String sql, String[] cols, Object... args) {
        try {
            List<Object[]> list = new ArrayList<>();
            ResultSet rs = JDBCUtil.query(sql, args);
            while (rs.next()) {
                Object[] vals = new Object[cols.length];
                for (int i = 0; i < cols.length; i++) {
                    vals[i] = rs.getObject(cols[i]);
                }
                list.add(vals);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
