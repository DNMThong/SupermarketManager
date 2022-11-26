package component.table.product;

import component.table.ModelAction;
import component.table.TableCellAction;
import component.table.TableHeader;
import entity.SanPham;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellEditor;
import java.awt.*;
import java.net.MalformedURLException;


public class Table extends JTable {

	public Table() {
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
                    ModelAction<SanPham> data = (ModelAction<SanPham>) o;
                    Action cell = new Action(data);
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
	}
	
	public static void main(String[] args) throws MalformedURLException {
		JPanel c = new JPanel();
		c.setLayout(new BorderLayout(0,0));
		JFrame frame = new JFrame();
		frame.setSize(800, 800);
		frame.setContentPane(c);
		
		JScrollPane sp = new JScrollPane();
		sp.setBorder(new EmptyBorder(5, 5, 5, 5));
		sp.getViewport().setBackground(Color.white);
		c.add(sp, BorderLayout.CENTER);
		
		Table tb = new Table() ;
		sp.setViewportView(tb);
		Object[] header = {
				"Thông tin sản phẩm", "Mã sản phẩm", "Loại", "Đơn vị tính", "Giá", "Action"
		};
		
		Object[][] data = {
				
		};
		
		EventAction eventAction = new EventAction() {
            @Override
            public void delete(SanPham student) {
                System.out.println("Delete Student : " + student.getTenSP());
            }

            @Override
            public void update(SanPham student) {
            	System.out.println("Update Student : " + student.getTenSP());
            }
        };
        tb.setModel(new DefaultTableModel(data, header));
        
//        this.MaSP = MaSP;
//        this.TenSP = TenSP;
//        this.DVT = DVT;
//        this.GiaSP = GiaSP;
//        this.TenLoai = TenLoai;
//        this.TenNCC = TenNCC;
//        this.Hinh = Hinh;
        


        System.out.println(Table.class.getResource("../../../icon/sidebar/Account.png"));
		
		frame.setVisible(true);
		
	}
	
	public void addRow(Object[] row) {
        DefaultTableModel mod = (DefaultTableModel) getModel();
        mod.addRow(row);
    }
	
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
