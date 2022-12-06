package component.table.product;

import component.table.ModelAction;
import component.table.TableHeader;
import dao.SanPhamDAO;
import entity.SanPham;
import ui.FormProduct;
import ui.ListStaffContent;
import ui.MainContent;
import ui.MainFrame;
import utils.Alert;
import utils.Util;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellEditor;
import java.awt.*;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;


public class ListProductTable extends JTable {

    private SanPhamDAO spd = new SanPhamDAO();
    private EventAction eventAction;
    private ListProductTableRes listProductTableRes;
    public interface ListProductTableRes {
        void setAmountProduct(int amount);
    }

    public ListProductTable(ListProductTableRes listProductTableRes) {
        this.listProductTableRes = listProductTableRes;
        setOpaque(false);
        getTableHeader().setBackground(new Color(255, 255, 255));
        setBackground(Color.white);
        setShowHorizontalLines(true);
        setShowVerticalLines(false);
        setGridColor(new Color(30, 30, 30, 50));
        setRowHeight(60);
        getTableHeader().setReorderingAllowed(false);
        getTableHeader().setDefaultRenderer(new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable jtable, Object o, boolean bln, boolean bln1, int i, int i1) {
                TableHeader header = new TableHeader(o + "");
                return header;
            }
        });

        setDefaultRenderer(Object.class, new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable jtable, Object o, boolean selected, boolean focus, int i, int i1) {
                if (o instanceof ModelProductInfo) {
                    ModelProductInfo data = (ModelProductInfo) o;
                    ProductInfo cell = new ProductInfo(data);
                    if (selected) {
                        cell.setSelectedBackground(new Color(239, 244, 255));
                    } else {
                        cell.setSelectedBackground(Color.WHITE);
                    }
                    return cell;
                } else if (o instanceof ModelAction) {
                    ModelAction<SanPham, EventAction> data = (ModelAction<SanPham, EventAction>) o;
                    ProductAction cell = new ProductAction(data);
                    if (selected) {
                        cell.setSelectedBackground(new Color(239, 244, 255));
                    } else {
                        cell.setSelectedBackground(Color.WHITE);
                    }
                    return cell;
                } else {
                    Component com = super.getTableCellRendererComponent(jtable, o, selected, focus, i, i1);
                    setBorder(noFocusBorder);
                    if (selected) {
                        com.setBackground(new Color(239, 244, 255));
                    } else {
                        com.setBackground(Color.white);
                    }
                    com.setForeground(Color.BLACK);
                    setHorizontalAlignment(JLabel.CENTER);
                    JLabel label = new JLabel(o + "");
                    label.setForeground(new Color(0, 0, 0, 0));
                    return com;
                }
            }
        });

        execute();
        loadProduct();
    }

    public void execute() {
        Object[] header = {
            "Thông tin sản phẩm", "Mã sản phẩm", "Loại", "Đơn vị tính", "Ghi chú", "Action"
        };

        Object[][] data = {};

        /**
         * delete: Viết xử lí cho nút xóa update: Viết xử lí cho nút sửa
=======
                "Thông tin sản phẩm", "Mã sản phẩm", "Loại", "Đơn vị tính", "Giá", "Action"
        };

        Object[][] data = {

        };

        /**
         * delete: Viết xử lí cho nút xóa
         * update: Viết xử lí cho nút sửa
>>>>>>> Hung2
         *
         */
        eventAction = new EventAction() {
            @Override
            public void delete(SanPham product) {
                if (Alert.confirm("Xóa sản phẩm", "Bạn có chắc muốn xóa sản phẩm này?", Util.mainFrame)) {
                    try {
                        spd.delete(product.getMaSP());
                        loadProduct();
                        Alert.success("Xóa thành công");
                    } catch (Exception e) {

                        Alert.error("Xóa thất bại");
                    }

                }
            }

            @Override
            public void update(SanPham product) {
                Util.siderbarMenu.clearExistSelected();

                if (Util.containerContent != null) {
                    Util.containerContent.removeAll();
                    Util.containerContent.revalidate();
                    Util.containerContent.repaint();
                }

                FormProduct content = new FormProduct(product);
                MainContent m = new MainContent("Sản phẩm");
                m.addContent(content);
                Util.containerContent.add(m, BorderLayout.CENTER);
                Util.containerContent.revalidate();
                Util.containerContent.repaint();
            }
        };
        setModel(new DefaultTableModel(data, header));
    }

    public void loadProduct() {
        DefaultTableModel mod = (DefaultTableModel) getModel();
        mod.setRowCount(0);
        List<SanPham> products = spd.selectAll();
        products.forEach(product -> {
            addRow(product.toRowTable(eventAction));
        });
        listProductTableRes.setAmountProduct(products.size());
    }

    public static void main(String[] args) throws MalformedURLException {
        JPanel c = new JPanel();
        c.setLayout(new BorderLayout(0, 0));
        JFrame frame = new JFrame();
        frame.setSize(800, 800);
        frame.setContentPane(c);

        JScrollPane sp = new JScrollPane();
        sp.setBorder(new EmptyBorder(5, 5, 5, 5));
        sp.getViewport().setBackground(Color.white);
        c.add(sp, BorderLayout.CENTER);

        ListProductTable tb = new ListProductTable(new ListProductTableRes() {
            @Override
            public void setAmountProduct(int amount) {
            }
        });
        sp.setViewportView(tb);
        frame.setVisible(true);

    }

    public void addRow(Object[] row) {
        DefaultTableModel mod = (DefaultTableModel) getModel();
        mod.addRow(row);
    }

    @Override
    public TableCellEditor getCellEditor(int row, int col) {
        System.out.println(col);
        if (col == 5) {
            return new TableCellAction();
        } else {
            return super.getCellEditor(row, col);
        }
    }


    @Override
    public boolean isCellEditable(int row, int column) {
        return column == 5;
    }
}
