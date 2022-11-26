package dao;

import entity.LoaiSanPham;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.JDBCUtil;

public class LoaiSanPhamDAO extends SupermarketManagerDAO<LoaiSanPham, String> {

    // lớp này chỉ dùng để lọc ra loại sản phẩm nên sẽ có 1 vài function không cần dùng
    @Override
    public void insert(LoaiSanPham entity) {
        String sql = "INSERT INTO LoaiSanPham (MaLoai, TenLoai) VALUES (?, ?)";
        JDBCUtil.update(sql,
                entity.getMaLoai(),
                entity.getTenLoai());
    }

    @Override
    public void update(LoaiSanPham entity) {
        String sql = "UPDATE LoaiSanPham SET TenLoai = ? WHERE MaLoai = ?";
        JDBCUtil.update(sql,
                entity.getTenLoai(),
                entity.getMaLoai());
    }

    @Override
    public void delete(String MaLoai) {
        // nêu dùng function này thì sẽ cần phải tạo procedure xóa hết sản phẩm có chứa loại sản phẩm này luôn
    }

    @Override
    public LoaiSanPham selectById(String MaLoai) {
        // không cần dùng hàm này
        return null;
    }

    @Override
    public List<LoaiSanPham> selectAll() {
        // dùng để đổ tên loại sản phẩm lên combobox. Trước khi đổ thì hãy thêm 1 item vào combobox có name là "Tất cả".
        String sql = "SELECT TenLoai FROM LoaiSanPham";
        return selectBySql(sql);
    }

    @Override
    protected List<LoaiSanPham> selectBySql(String sql, Object... args) {
        List<LoaiSanPham> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = JDBCUtil.query(sql, args);
                while (rs.next()) {
                    LoaiSanPham entity = new LoaiSanPham();
                    entity.setMaLoai(rs.getString(1));
                    entity.setTenLoai(rs.getString(2));
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
