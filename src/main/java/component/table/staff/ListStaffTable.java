package component.table.staff;

import component.table.ModelAction;
import component.table.TableHeader;
import entity.NhanVien;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellEditor;
import java.awt.*;


public class ListStaffTable extends JTable {

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
	}
//	
	public static void main(String[] args) {
		JPanel c = new JPanel();
		c.setLayout(new BorderLayout(0,0));
		JFrame frame = new JFrame();
		frame.setSize(800, 800);
		frame.setContentPane(c);
		
		JScrollPane sp = new JScrollPane();
		sp.setBorder(new EmptyBorder(5, 5, 5, 5));
		sp.getViewport().setBackground(Color.white);
		c.add(sp, BorderLayout.CENTER);
		
		ListStaffTable tb = new ListStaffTable() ;
		sp.setViewportView(tb);
		frame.setVisible(true);
		
	}
	
	public void execute() {
		Object[] header = {
				"Thông tin sản phẩm", "Mã sản phẩm", "Loại", "Đơn vị tính", "Giá", "Action"
		};
		
		Object[][] data = {
				
		};
		
		/**
		 * delete: Viết xử lí cho nút xóa 
		 * update: Viết xử lí cho nút sửa 
		 * 
		 */
		EventAction eventAction = new EventAction() {

			@Override
			public void delete(NhanVien nv) {
				// TODO Auto-generated method stub
				System.out.println("Delete: " + nv.getHoTen());
			}

			@Override
			public void update(NhanVien nv) {
				// TODO Auto-generated method stub
				System.out.println("Update: " + nv.getHoTen());
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
        
        addRow(new NhanVien("1101", "Tran Hoai Nguyen A", true, "0123456789", "Athn112233@gmail.com", "385/4 Quang trung, P.10, Go Vap, HCM", "123", true, "../icon/sidebar/Account.png").toRowTable(eventAction));
        addRow(new NhanVien("1102", "Nguyen Van B", false, "0123456789", "BNV112233@gmail.com", "778k/2a Nguyen Kiem, P.10, Phu Nhuan, HCM", "123", false, "../icon/sidebar/Account.png").toRowTable(eventAction));
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
	
	@Override
	public TableCellEditor getCellEditor (int row, int col) {
		System.out.println(col);
		if (col == 5) {
			return new TableCellAction();
		} else {
			return super.getCellEditor(row, col);
		}
	}
	
	
	
}
