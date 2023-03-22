package ui;

import org.junit.*;
import utils.JDBCUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class POSTest {
    private POS pos = new POS();
    private static List<Object[]> listAllProduct = new ArrayList<Object[]>();

    @BeforeClass
    public static void firstMethod() {
        String query = "select * from view_BanSanPham";
        try {
            ResultSet rs = JDBCUtil.query(query);
            while (rs.next()) {
                Object[] product = new Object[]{
                        rs.getString(1),   // MaSP
                        rs.getString(2),   // MaPhieuXuat
                        rs.getString(3),   // TenSP
                        rs.getString(4),	  // Hinh
                        rs.getString(5),   // TenNCC
                        rs.getString(6),   // DonViTinh
                        rs.getString(7),   // TenLoai
                        rs.getInt(8),      // Gia
                };
                listAllProduct.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Before
    public void setUp() {

    }

    @After
    public void tearDown() {
    }

    @Test
    public void findProudctByIdExist() {
        List<Object[]> listProduct;
        listProduct = pos.searchProduct("4902430429399");
        assertEquals("4902430429399",listProduct.get(0)[0]);
    }

    @Test
    public void findProudctByIdNotExist() {
        List<Object[]> listProduct;
        listProduct = pos.searchProduct("123");
        assertEquals(0,listProduct.size());
    }

    @Test
    public void findProudctByName() {
        List<Object[]> listProduct;
        listProduct = pos.searchProduct("Mì");
        listProduct.forEach(i -> {
            assertTrue(String.valueOf(i[2]).contains("Mì"));
        });
    }

    @Test
    public void findProudctByEmpty() {
        List<Object[]> listProduct;
        listProduct = pos.searchProduct("");
        for(int i=0;i<listProduct.size();i++) {
            assertArrayEquals(listAllProduct.get(0),listProduct.get(0));
            assertArrayEquals(listProduct.get(0),listAllProduct.get(0));
        }
    }
}