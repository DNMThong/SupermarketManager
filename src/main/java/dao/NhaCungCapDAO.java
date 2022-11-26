package dao;

import entity.NhaCungCap;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.JDBCUtil;

public class NhaCungCapDAO extends SupermarketManagerDAO<NhaCungCap, String> {

    @Override
    public void insert(NhaCungCap entity) {
        String sql = "INSERT INTO NhaCungCap (MaNCC, TenNCC, SDT, Email, DiaChi, NgayHopTac) VALUES (?, ?, ?, ?, ?, ?)";
        JDBCUtil.update(sql,
                entity.getMaNCC(),
                entity.getTenNCC(),
                entity.getSDT(),
                entity.getEmail(),
                entity.getDiaChi(),
                entity.getNgayHopTac());
    }

    @Override
    public void update(NhaCungCap entity) {
        String sql = "UPDATE NhaCungCap SET TenNCC = ?, SDT = ?, Email = ?, DiaChi = ?, NgayHopTac = ? WHERE MaNCC = ?";
        JDBCUtil.update(sql,
                entity.getTenNCC(),
                entity.getSDT(),
                entity.getEmail(),
                entity.getDiaChi(),
                entity.getNgayHopTac(),
                entity.getMaNCC());
    }

    @Override
    public void delete(String maNCC) {
        String sql = "DELETE FROM NhaCungCap WHERE MaNCC = ?";
        JDBCUtil.update(sql, maNCC);
    }

    @Override
    public NhaCungCap selectById(String maNCC) {
        // tạo thêm JDialog dùng để xem thông tin nhà cung cấp
        String sql = "SELECT * FROM NhaCungCap WHERE MaNCC = ?";
        List<NhaCungCap> list = this.selectBySql(sql, maNCC);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<NhaCungCap> selectAll() {
        String sql = "SELECT * FROM NhaCungCap";
        return selectBySql(sql);
    }

    @Override
    protected List<NhaCungCap> selectBySql(String sql, Object... args) {
        List<NhaCungCap> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JDBCUtil.query(sql, args);
                while (rs.next()) {
                    NhaCungCap entity = new NhaCungCap();
                    entity.setMaNCC(rs.getString(1));
                    entity.setTenNCC(rs.getString(2));
                    entity.setSDT(rs.getString(3));
                    entity.setEmail(rs.getString(4));
                    entity.setDiaChi(rs.getString(5));
                    entity.setNgayHopTac(rs.getDate(6));
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
