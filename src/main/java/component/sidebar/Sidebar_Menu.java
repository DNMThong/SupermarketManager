package component.sidebar;

import ui.*;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
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
		private MenuItem menuHome;
		private MenuItem menuProduct;
		private MenuItem menuStaff;
		private MenuItem menuBill;
		private MenuItem menuStatistic;
		private MenuItem menuStorage;
		private MenuItem menuAccount;

		private JPanel containerContent = null;
		private MainContent contentPanel;


		public Sidebar_Menu(JComponent c) {
			initComponents();
			execute();
			this.containerContent = (JPanel) c;
		}

		private void initComponents() {
			if (this.getParent() != null) {
				size = new Dimension(getParent().getSize());
//			this.setMaximumSize(getParent().getMaximumSize());
//			this.setMinimumSize(getParent().getMinimumSize());
			}
			this.setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
			this.setBackground(Color.white);
		}

		private void execute() {
//		"D:\Document\Workspace\Java App\SubFrame\src\assets\icon\Group 6.svg"
			ImageIcon iconHome = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/Home_duotone.png")), 32, 32);
			ImageIcon iconProduct = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/Database.png")), 24, 24);
			ImageIcon iconStaff = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/Group.png")), 24, 24);
			ImageIcon iconBill = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/Bill.png")), 24, 24);
			ImageIcon iconStat = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/Statistic.png")), 24, 24);
			ImageIcon iconStorage = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/3D Rectangle.png")), 24, 24);
			ImageIcon iconAccount = resizeImgIcon(new ImageIcon(getClass().getResource("../../icon/sidebar/Account.png")), 24, 24);

			//  create submenu product
			subProduct_1 = new MenuItem(null, "Thêm sản phẩm", new HandleSubProduct_1());
			subProduct_2 = new MenuItem(null, "\tDanh sách", new HandleSubProduct_2());

			//  create submenu staff
			subStaff_1 = new MenuItem(null, "Thêm nhân viên", new HandleSubStaff_1());
			subStaff_2 = new MenuItem(null, "Danh sách nhân viên", new HandleSubStaff_2());
			subStaff_3 = new MenuItem(null, "Ca làm việc", new HandleSubStaff_3());
			subStaff_4 = new MenuItem(null, "Bảng lương", new HandleSubStaff_4());

			//  create submenu bill
			subBill_1 = new MenuItem(null, "Danh sách hóa đơn", new HandleSubBill_1());

			// create submenu statistic
			subStat_1 = new MenuItem(null, "Thống kê sản phẩm", new HandleSubStat_1());
			subStat_2 = new MenuItem(null, "Thống kê doanh thu", new HandleSubStat_2());
			subStat_3 = new MenuItem(null, "Thống kê chi tiêu của khách hàng", new HandleSubStat_3());

			// create submenu storage
			subStorage_1 = new MenuItem(null, "Thêm phiếu nhập", new HandleSubStorage_1());
			subStorage_2 = new MenuItem(null, "Danh sách phiếu nhập", new HandleSubStorage_2());
			subStorage_3 = new MenuItem(null, "Sản phẩm tồn kho", new HandleSubStorage_3());

			menuHome = new MenuItem(iconHome, "Trang chủ", new HandleMenuHome());
			menuProduct = new MenuItem(iconProduct, "Sản phẩm", null, subProduct_1, subProduct_2);
			menuStaff = new MenuItem(iconStaff, "Nhân viên", null, subStaff_1, subStaff_2, subStaff_3, subStaff_4);
			menuBill = new MenuItem(iconBill, "Hóa đơn", null, subBill_1);
			menuStatistic = new MenuItem(iconStat, "Thống kê", null, subStat_1, subStat_2, subStat_3);
			menuStorage = new MenuItem(iconStorage, "Kho", null, subStorage_1, subStorage_2, subStorage_3);
			menuAccount = new MenuItem(iconAccount, "Tài khoản", new HandleMenuAccount());
			addMenu(menuHome, menuProduct, menuStaff, menuBill, menuStatistic, menuStorage, menuAccount);

//        subProduct_1.addMouseListener(new HandleSubProduct_1());
		}

		private void setDefaultColor() {

//		setColor(subProduct_1,
//				subProduct_2,
//				subStaff_1,
//				subStaff_2,
//				subStaff_3,
//				subStaff_4,
//				subBill_1,
//				subStorage_1,
//				subStorage_2,
//				subStorage_3);

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

		private void clearSubMenuSelected(MenuItem c) {
			if (c != null) {
				ArrayList<MenuItem> sub = c.getSubMenu();
				if (sub != null && sub.size() > 0) {
					sub.forEach(e -> e.setSelected(false));
				}
			}
			getParent().revalidate();
			getParent().repaint();
		}

		private void clearExistSelected() {
			menuHome.setSelected(false);
			menuProduct.setSelected(false);
			menuStaff.setSelected(false);
			menuBill.setSelected(false);
			menuStatistic.setSelected(false);
			menuStorage.setSelected(false);
			menuAccount.setSelected(false);
			clearSubMenuSelected(menuHome);
			clearSubMenuSelected(menuProduct);
			clearSubMenuSelected(menuStaff);
			clearSubMenuSelected(menuBill);
			clearSubMenuSelected(menuStatistic);
			clearSubMenuSelected(menuStorage);
			clearSubMenuSelected(menuAccount);
			getParent().getParent().revalidate();
			getParent().getParent().repaint();
		}

		private void setSelectedSubMenu(MenuItem item) {
			clearExistSelected();
			item.setSelected(true);
			item.setEffectColor(Color.BLUE, new Color(234, 240, 252));
			item.setBackground(item.getContainerColor());
			item.getItem().setBackground(item.getItemColor());

			getParent().getParent().revalidate();
			getParent().getParent().repaint();
		}

		private void setSelectedMenu(MenuItem item) {
			clearExistSelected();
			item.setSelected(true);
			item.setEffectColor(new Color(188, 203, 209), new Color(188, 203, 209));
			item.setBackground(item.getContainerColor());
			item.getItem().setBackground(item.getItemColor());

			getParent().getParent().revalidate();
			getParent().getParent().repaint();
		}

		/**
		 * CONTROLLER
		 *
		 * @author WHISPER
		 */

		class HandleMenuHome implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedMenu(menuHome);
				if (contentPanel != null) {
					contentPanel.removeAll();
					contentPanel.getParent().revalidate();
					contentPanel.getParent().repaint();
				}
				contentPanel = new MainContent("Trang chu");
				contentPanel.addContent(new POS());
				if (containerContent != null) {
					containerContent.removeAll();
					containerContent.getParent().getParent().revalidate();
					containerContent.getParent().getParent().repaint();
					containerContent.add(contentPanel, BorderLayout.CENTER);
					containerContent.getParent().getParent().revalidate();
					containerContent.getParent().getParent().repaint();
				}
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}

		}

		class HandleMenuAccount implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedMenu(menuAccount);
				if (contentPanel != null) {
					contentPanel.removeAll();
					contentPanel.getParent().revalidate();
					contentPanel.getParent().repaint();
				}
				contentPanel = new MainContent("Tai khoan");
				if (containerContent != null) {
					containerContent.removeAll();
					containerContent.getParent().getParent().revalidate();
					containerContent.getParent().getParent().repaint();
					containerContent.add(contentPanel, BorderLayout.CENTER);
					containerContent.getParent().getParent().revalidate();
					containerContent.getParent().getParent().repaint();
				}
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}

		}

		class HandleSubProduct_1 implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedSubMenu(subProduct_1);
				if (containerContent != null) {
					containerContent.removeAll();
					containerContent.getParent().revalidate();
					containerContent.getParent().repaint();
				}

				FormProduct content = new FormProduct();
				MainContent m = new MainContent("Sản Phẩm");
				m.addContent(content);
				containerContent.add(m, BorderLayout.CENTER);
				containerContent.getParent().getParent().revalidate();
				containerContent.getParent().getParent().repaint();
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}
		}

		class HandleSubProduct_2 implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedSubMenu(subProduct_2);
				if (containerContent != null) {
					containerContent.removeAll();
					containerContent.getParent().revalidate();
					containerContent.getParent().repaint();
				}

				ListProductContent content = new ListProductContent();
				MainContent m = new MainContent("Sản Phẩm");
				m.addContent(content);
				containerContent.add(m, BorderLayout.CENTER);
				containerContent.getParent().getParent().revalidate();
				containerContent.getParent().getParent().repaint();
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}
		}

		class HandleSubStaff_1 implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedSubMenu(subStaff_1);
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}
		}

		class HandleSubStaff_2 implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedSubMenu(subStaff_2);
				if (containerContent != null) {
					containerContent.removeAll();
					containerContent.getParent().revalidate();
					containerContent.getParent().repaint();
				}

				ListStaffContent content = new ListStaffContent();
				MainContent m = new MainContent("Nhân viên");
				m.addContent(content);
				containerContent.add(m, BorderLayout.CENTER);
				containerContent.getParent().getParent().revalidate();
				containerContent.getParent().getParent().repaint();
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}
		}

		class HandleSubStaff_3 implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedSubMenu(subStaff_3);
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}
		}

		class HandleSubStaff_4 implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedSubMenu(subStaff_4);
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}
		}

		class HandleSubBill_1 implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedSubMenu(subBill_1);
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}
		}

		class HandleSubStat_1 implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedSubMenu(subStat_1);
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}
		}

		class HandleSubStat_2 implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedSubMenu(subStat_2);
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}
		}

		class HandleSubStat_3 implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedSubMenu(subStat_3);
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}
		}

		class HandleSubStorage_1 implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedSubMenu(subStorage_1);
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}
		}

		class HandleSubStorage_2 implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedSubMenu(subStorage_2);
				if (containerContent != null) {
					containerContent.removeAll();
					containerContent.getParent().revalidate();
					containerContent.getParent().repaint();
				}

				DSPNContent content = new DSPNContent();
				MainContent m = new MainContent("Sản Phẩm");
				m.addContent(content);
				containerContent.add(m, BorderLayout.CENTER);
				containerContent.getParent().getParent().revalidate();
				containerContent.getParent().getParent().repaint();
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}
		}

		class HandleSubStorage_3 implements MouseListener {

			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
				setSelectedSubMenu(subStorage_3);
			}

			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub

			}
		}
}
