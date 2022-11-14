package component.sidebar;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;


public class Sidebar_Menu extends JPanel {
	
	private Dimension size;
	private MenuItem subProduct_1;
	private MenuItem subProduct_2;
	private MenuItem subStaff_1;
	private MenuItem subStaff_3;
	private MenuItem subStaff_2;
	private MenuItem subStaff_4;
	private MenuItem subBill_1;
	private MenuItem subStat_1;
	private MenuItem subStat_2;
	private MenuItem subStat_3;
	private MenuItem subStorage_1;
	private MenuItem subStorage_2;
	private MenuItem subStorage_3;
	
	
	public Sidebar_Menu(JComponent c) {
		initComponents();
		execute(c);
	}
	
	private void initComponents() {
		if (this.getParent() != null) {
			size = new Dimension(this.getParent().getWidth(), this.getParent().getHeight());
		}
		this.setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
		this.setBackground(Color.white);
	}
	
	private void execute(JComponent c) {
//		"D:\Document\Workspace\Java App\SubFrame\src\assets\icon\Group 6.svg"
        ImageIcon iconHome = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/Home_duotone.png")), 32, 32);
        ImageIcon iconProduct = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/Database.png")), 24, 24);
        ImageIcon iconStaff = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/Group.png")), 24, 24);
        ImageIcon iconBill = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/Bill.png")), 24, 24);
        ImageIcon iconStat = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/Statistic.png")), 24, 24);
        ImageIcon iconStorage = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/3D Rectangle.png")), 24, 24);
        ImageIcon iconAccount = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/Account.png")), 24, 24);

        //  create submenu product
        subProduct_1 = new MenuItem(null, "Thêm sản phẩm", handleSubMenuSelected());
        subProduct_2 = new MenuItem(null, "Danh sách", handleSubMenuSelected());

        //  create submenu staff
        subStaff_1 = new MenuItem(null, "Thêm nhân viên", handleSubMenuSelected());
        subStaff_2 = new MenuItem(null, "Danh sách nhân viên", handleSubMenuSelected());
        subStaff_3 = new MenuItem(null, "Ca làm việc", handleSubMenuSelected());
        subStaff_4 = new MenuItem(null, "Bảng lương", handleSubMenuSelected());

        //  create submenu bill
        subBill_1 = new MenuItem(null, "Danh sách hóa đơn", handleSubMenuSelected());

        // create submenu statistic
        subStat_1 = new MenuItem(null, "Thống kê sản phẩm", handleSubMenuSelected());
        subStat_2 = new MenuItem(null, "Thống kê doanh thu", handleSubMenuSelected());
        subStat_3 = new MenuItem(null, "Thống kê chi tiêu của khách hàng", handleSubMenuSelected());

        // create submenu storage
        subStorage_1 = new MenuItem(null, "Thêm phiếu nhập", handleSubMenuSelected());
        subStorage_2 = new MenuItem(null, "Danh sách phiếu nhập", handleSubMenuSelected());
        subStorage_3 = new MenuItem(null, "Sản phẩm tồn kho", handleSubMenuSelected());

        MenuItem menuHome = new MenuItem(iconHome, "Trang chủ", null);
        MenuItem menuProduct = new MenuItem(iconProduct, "Sản phẩm", null, subProduct_1, subProduct_2);
        MenuItem menuStaff = new MenuItem(iconStaff, "Nhân viên", null, subStaff_1, subStaff_2, subStaff_3, subStaff_4);
        MenuItem menuBill = new MenuItem(iconBill, "Hóa đơn", null, subBill_1);
        MenuItem menuStatistic = new MenuItem(iconStat, "Thống kê", null, subStat_1, subStat_2, subStat_3);
        MenuItem menuStorage = new MenuItem(iconStorage, "Kho", null, subStorage_1, subStorage_2, subStorage_3);
        MenuItem menuAccount = new MenuItem(iconAccount, "Tài khoản", null);
        addMenu(menuHome, menuProduct, menuStaff, menuBill, menuStatistic, menuStorage, menuAccount);
    }
	
	private void setDefaultColor() {
		
		setColor(subProduct_1, 
				subProduct_2, 
				subStaff_1, 
				subStaff_2, 
				subStaff_3, 
				subStaff_4, 
				subBill_1, 
				subStorage_1,
				subStorage_2, 
				subStorage_3);
		
	}
	
	private void setColor(MenuItem...c) {
		for(MenuItem i : c) {
			i.setBackground(Color.white);
			
			Component[] ps = i.getComponents();
	        
	        for (Component s : ps) {
	        	if (!s.toString().contains("JSeparator")) {
	        		s.setBackground(new Color(255,255,255));
	        	} else {
	        		s.setForeground(Color.black);;
	        	}
	        }
		}
		this.revalidate();
		this.repaint();
	}
	
	private void addMenu(MenuItem... menu) {
        for (int i = 0; i < menu.length; i++) {
            this.add(menu[i]);
            ArrayList<MenuItem> subMenu = menu[i].getSubMenu();
            for (MenuItem m : subMenu) {
                addMenu(m);
            }
        }
        if (getParent() != null) {
        	getParent().revalidate();
    		getParent().repaint();
        }
    }
	
	private ImageIcon resizeImgIcon(ImageIcon imgIcon, int width, int height) {
		ImageIcon icon = new ImageIcon(imgIcon.getImage().getScaledInstance(width, height, Image.SCALE_SMOOTH));
		return icon;
	}
	
	private MouseAdapter handleSubMenuSelected() {
		MouseAdapter mouseAdapter = new MouseAdapter() {
//			public void mouseReleased(MouseEvent e) {
//				JPanel p = (JPanel) e.getSource();
////              ArrayList<JComponent> ps = new ArrayList<>();
//				Component[] ps = p.getComponents();
//
//				p.setBackground(new Color(54, 118, 243));
//				for (Component c : ps) {
//					c.setBackground(Color.white);
//				}
//			}
			
        	public void mouseClicked(MouseEvent e) {
        		setDefaultColor();
                JPanel p = (JPanel) e.getSource();
//                ArrayList<JComponent> ps = new ArrayList<>();
                Component[] ps = p.getComponents();
                
                p.setBackground(new Color(54, 118, 243));
                for (Component c : ps) {
                	if (!c.toString().contains("JSeparator")) {
                		c.setBackground(new Color(182, 204, 248));
                	} else {
                		c.setForeground(Color.CYAN);;
                		
                	}
                }
                revalidate();
                repaint();
            }
        };
        return mouseAdapter;
	}
}
