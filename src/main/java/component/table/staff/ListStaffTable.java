package component.table.staff;

import component.table.ModelAction;
import component.table.TableHeader;
import dao.NhanVienDAO;
import entity.NhanVien;
import entity.SanPham;
import utils.Alert;
import utils.Util;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellEditor;
import java.awt.*;
import java.util.List;
import ui.FormEmployee;
import ui.FormProduct;
import ui.MainContent;

public class ListStaffTable extends JTable {

    private NhanVienDAO nvd = new NhanVienDAO();
    private EventAction eventAction;

    public ListStaffTable() {
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
                if (o instanceof ModelStaffInfo) {
                    ModelStaffInfo data = (ModelStaffInfo) o;
                    StaffInfo cell = new StaffInfo(data);
                    if (selected) {
                        cell.setSelectedBackground(new Color(239, 244, 255));
                    } else {
                        cell.setSelectedBackground(Color.WHITE);
                    }
                    return cell;
                } else if (o instanceof ModelAction) {
                    ModelAction<NhanVien, EventAction> data = (ModelAction) o;
                    StaffAction cell = new StaffAction(data);
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
//	

    public static void main(String[] args) {
        JPanel c = new JPanel();
        c.setLayout(new BorderLayout(0, 0));
        JFrame frame = new JFrame();
        frame.setSize(800, 800);
        frame.setContentPane(c);

        JScrollPane sp = new JScrollPane();
        sp.setBorder(new EmptyBorder(5, 5, 5, 5));
        sp.getViewport().setBackground(Color.white);
        c.add(sp, BorderLayout.CENTER);

        ListStaffTable tb = new ListStaffTable();
        sp.setViewportView(tb);
        frame.setVisible(true);

    }

    public void execute() {
        Object[] header = {
            "Thông tin nhân viên", "Mã nhân viên", "SĐT", "Email", "Mật khẩu", "Vai trò", "Action"
        };

        Object[][] data = {};

        /**
         * delete: Viết xử lí cho nút xóa update: Viết xử lí cho nút sửa
         *
         */
        eventAction = new EventAction() {

            @Override
            public void delete(NhanVien nv) {
                if (Alert.confirm("Xóa nhân viên", "Bạn có chắc muốn xóa nhân viên này", Util.mainFrame)) {
                    try {
                        nvd.delete(nv.getMaNhanVien());
                        loadProduct();
                        Alert.success("Xóa thành công");
                    } catch (Exception e) {
                        Alert.error("Xóa thất bại");
                    }

                }
            }

            @Override
            public void update(NhanVien nv) {
                if (Util.containerContent != null) {
                    Util.containerContent.removeAll();
                    Util.containerContent.revalidate();
                    Util.containerContent.repaint();
                }
                FormEmployee content = new FormEmployee(nv);
                MainContent m = new MainContent("Nhân viên");
                m.addContent(content);
                Util.containerContent.add(m, BorderLayout.CENTER);
                Util.containerContent.revalidate();
                Util.containerContent.repaint();     
            }
             

        };
        setModel(new DefaultTableModel(data, header));

//        this.MaNV = MaNV;
//        this.HoTen = HoTen;
//        this.SDT = SDT;
//        this.DiaChi = DiaChi;
//        this.Email = Email;
//        this.GioiTinh = GioiTinh;
//        this.MatKhau = MatKhau;
//        this.VaiTro = VaiTro;
//        this.Hinh = Hinh;
//        this.MaNhanVien = MaNhanVien;
//        this.HoTen = HoTen;
//        this.GioiTinh = GioiTinh;
//        this.SDT = SDT;
//        this.Email = Email;
//        this.DiaChi = DiaChi;
//        this.MatKhau = MatKhau;
//        this.VaiTro = VaiTro;
//        this.Hinh = Hinh;
    }

    public void addRow(Object[] row) {
        DefaultTableModel mod = (DefaultTableModel) getModel();
        mod.addRow(row);
    }

//	public void fillTable(List<>) {
//		// SQL select 
//		
//		// Xử lí dữ liệu
//		// Object.toRowTable -> Object[]
//		// tb.addRow(Object[])
//	}
    public void loadProduct() {
        DefaultTableModel mod = (DefaultTableModel) getModel();
        mod.setRowCount(0);
        List<NhanVien> staffs = nvd.selectAll();
        staffs.forEach(product -> {
            addRow(product.toRowTable(eventAction));
        });
    }

    @Override
    public TableCellEditor getCellEditor(int row, int col) {
        System.out.println(col);
        if (col == 6) {
            return new TableCellAction();
        } else {
            return super.getCellEditor(row, col);
        }
    }

}
