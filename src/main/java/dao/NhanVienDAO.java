package dao;

import entity.NhanVien;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.JDBCUtil;

public class NhanVienDAO extends SupermarketManagerDAO<NhanVien, String> {

    @Override
    public void insert(NhanVien entity) {
        String sql = "INSERT INTO NhanVien (MaNV, HoTen, GioiTinh, SDT, Email, DiaChi, MatKhau, VaiTro, Hinh) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        JDBCUtil.update(sql,
                entity.getMaNhanVien(),
                entity.getHoTen(),
                entity.isGioiTinh(),
                entity.getSDT(),
                entity.getEmail(),
                entity.getDiaChi(),
                entity.getMatKhau(),
                entity.isVaiTro(),
                entity.getHinh());
    }

    @Override
    public void update(NhanVien entity) {
        String sql = "UPDATE NhanVien SET HoTen = ?, SDT = ?, DiaChi = ?, Email = ?, GioiTinh = ?, MatKhau = ?, VaiTro = ?, Hinh = ? WHERE MaNV  = ?";
        JDBCUtil.update(sql,
                entity.getHoTen(),
                entity.getSDT(),
                entity.getDiaChi(),
                entity.getEmail(),
                entity.isGioiTinh(),
                entity.getMatKhau(),
                entity.isVaiTro(),
                entity.getHinh(),
                entity.getMaNhanVien());
    }

    @Override
    public void delete(String MaNV) {
        String sql = "DELETE FROM NhanVien WHERE MaNV = ?";
        JDBCUtil.update(sql, MaNV);
    }

    @Override
    public NhanVien selectById(String maNV) {
        String sql = "SELECT * FROM NhanVien WHERE MaNV = ?";
        List<NhanVien> list = this.selectBySql(sql, maNV);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<NhanVien> selectAll() {
        String sql = "SELECT * FROM NhanVien";
        return selectBySql(sql);
    }

    @Override
    protected List<NhanVien> selectBySql(String sql, Object... args) {
        List<NhanVien> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JDBCUtil.query(sql, args);
                while (rs.next()) {
                    NhanVien entity = new NhanVien();
                    entity.setMaNhanVien(rs.getString(1));
                    entity.setHoTen(rs.getString(2));
                    entity.setGioiTinh(rs.getBoolean(3));
                    entity.setSDT(rs.getString(4));
                    entity.setEmail(rs.getString(5));
                    entity.setDiaChi(rs.getString(6));
                    entity.setMatKhau(rs.getString(7));
                    entity.setVaiTro(rs.getBoolean(8));
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
