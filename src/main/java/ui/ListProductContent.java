package ui;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import component.table.product.ListProductTable;
import component.Button;
import utils.ImageUtil;
import utils.Util;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class ListProductContent extends JPanel {
	
	private ListProductTable tb;

	public ListProductContent() {
		initComponent();
		
//		fillTable();
	}
	
	public static void main(String[] args) {
		JFrame f = new JFrame();
		f.setSize(800, 800);
		MainContent m = new MainContent("Sản phẩm");
		m.addContent(new ListProductContent());
		f.setContentPane(m);
		
		f.setVisible(true);
	}
	
	public void initComponent() {
		setLayout(new BorderLayout(0, 0));
		
		JPanel panel = new JPanel();
		panel.setPreferredSize(new Dimension(10, 90));
		add(panel, BorderLayout.NORTH);
		SpringLayout sl_panel = new SpringLayout();
		panel.setLayout(sl_panel);
		
		JLabel lbSubTitle = new JLabel("Danh sách sản phẩm");
		lbSubTitle.setFont(new Font("Tahoma", Font.BOLD, 20));
		lbSubTitle.setBorder(new EmptyBorder(5, 5, 0, 5));
		lbSubTitle.setHorizontalAlignment(SwingConstants.CENTER);
		lbSubTitle.setVerticalAlignment(SwingConstants.TOP);
		sl_panel.putConstraint(SpringLayout.NORTH, lbSubTitle, 10, SpringLayout.NORTH, panel);
		sl_panel.putConstraint(SpringLayout.WEST, lbSubTitle, 10, SpringLayout.WEST, panel);
		sl_panel.putConstraint(SpringLayout.SOUTH, lbSubTitle, 50, SpringLayout.NORTH, panel);
		panel.add(lbSubTitle);
		
		JPanel panel_1 = new JPanel();
		sl_panel.putConstraint(SpringLayout.WEST, panel_1, 241, SpringLayout.WEST, panel);
		sl_panel.putConstraint(SpringLayout.EAST, lbSubTitle, -6, SpringLayout.WEST, panel_1);
		sl_panel.putConstraint(SpringLayout.NORTH, panel_1, 40, SpringLayout.NORTH, panel);
		sl_panel.putConstraint(SpringLayout.SOUTH, panel_1, -10, SpringLayout.SOUTH, panel);
		panel.add(panel_1);
		panel_1.setLayout(new GridLayout(1, 0, 0, 0));
		
		JLabel lbSample = new JLabel("SearchBox");
		lbSample.setHorizontalAlignment(SwingConstants.CENTER);
		panel_1.add(lbSample);
		
		Button btnToInsertProduct = new Button();
		btnToInsertProduct.setIcon(ImageUtil.read(this.getClass().getResource("/icon/close_24px.png"), 24, 24));
		btnToInsertProduct.setText("Thêm sản phẩm");
		btnToInsertProduct.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnToInsertProduct.setIconTextGap(8);
		btnToInsertProduct.setForeground(Color.WHITE);
		btnToInsertProduct.setColor(new Color(27, 89, 248));
		btnToInsertProduct.setColorOver(new Color(60, 112, 239));	
		btnToInsertProduct.setColorClick(new Color(38, 69, 237));
		btnToInsertProduct.setFocusPainted(false);
		btnToInsertProduct.setBorderPainted(false);
		btnToInsertProduct.setBorderColor(btnToInsertProduct.getBackground());
		btnToInsertProduct.setRadius(40);
		btnToInsertProduct.setCursor(new Cursor(Cursor.HAND_CURSOR));
		btnToInsertProduct.addActionListener(i -> {
			Util.siderbarMenu.setSelectedSubMenu(Util.siderbarMenu.subProduct_1);
			if (Util.containerContent != null) {
				Util.containerContent.removeAll();
				Util.containerContent.revalidate();
				Util.containerContent.repaint();
			}

			FormProduct content = new FormProduct();
			MainContent m = new MainContent("Sản phẩm");
			m.addContent(content);
			Util.containerContent.add(m, BorderLayout.CENTER);
			Util.containerContent.revalidate();
			Util.containerContent.repaint();
		});

		Button btnRenderQR = new Button();
		btnRenderQR.setIcon(ImageUtil.read(this.getClass().getResource("/icon/QR.png"), 24, 24));
		btnRenderQR.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnRenderQR.setForeground(Color.WHITE);
		btnRenderQR.setColor(new Color(255,255,255));
		btnRenderQR.setColorOver(new Color(243, 237, 237));
		btnRenderQR.setColorClick(new Color(255,255,255));
		btnRenderQR.setFocusPainted(false);
		btnRenderQR.setBorderPainted(false);
		btnRenderQR.setBorderColor(btnToInsertProduct.getBackground());
		btnRenderQR.setRadius(40);
		btnRenderQR.setCursor(new Cursor(Cursor.HAND_CURSOR));
		btnRenderQR.addActionListener(i -> {
			try {
				DefaultTableModel model = (DefaultTableModel) tb.getModel();
				int row = tb.getSelectedRow();
				if(row>-1) {
					String QrCodeData= model.getValueAt(row,1)+"";
					String filePath= getClass().getResource("../image/qr_product").getPath()+"/"+QrCodeData+".png";

					String charset= "UTF-8";
					Map<EncodeHintType, ErrorCorrectionLevel> hintMap= new HashMap<EncodeHintType, ErrorCorrectionLevel>();
					hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
					BitMatrix matrix= new MultiFormatWriter().encode(
							new String (QrCodeData.getBytes(charset),charset),
							BarcodeFormat.QR_CODE,200,200,hintMap);

					MatrixToImageWriter.writeToFile(matrix, filePath.substring(filePath.lastIndexOf('.')+1),new File(filePath));

					JDialog dialog = new JDialog();
					ImageIcon icon = new ImageIcon(filePath);
					JLabel label = new JLabel(icon);
					dialog.add(label);
					dialog.setSize(200,200);
					dialog.setVisible(true);
				}

			}catch (Exception e) {
				e.printStackTrace();
			}
		});

		JPanel wapperButton = new JPanel(new FlowLayout(100));
		wapperButton.add(btnToInsertProduct);
		wapperButton.add(btnRenderQR);

		sl_panel.putConstraint(SpringLayout.EAST, panel_1, -30, SpringLayout.WEST, btnToInsertProduct);
		sl_panel.putConstraint(SpringLayout.WEST, wapperButton, -250, SpringLayout.EAST, panel);
		sl_panel.putConstraint(SpringLayout.NORTH, wapperButton, 0, SpringLayout.NORTH, panel_1);
		sl_panel.putConstraint(SpringLayout.SOUTH, wapperButton, -10, SpringLayout.SOUTH, panel);
		sl_panel.putConstraint(SpringLayout.EAST, wapperButton, -22, SpringLayout.EAST, panel);
		panel.add(wapperButton);
		
		JLabel lbProductCount = new JLabel("Sản phẩm: 34");
		lbProductCount.setBorder(new EmptyBorder(0, 10, 0, 10));
		sl_panel.putConstraint(SpringLayout.NORTH, lbProductCount, 6, SpringLayout.SOUTH, lbSubTitle);
		sl_panel.putConstraint(SpringLayout.WEST, lbProductCount, 10, SpringLayout.WEST, panel);
		sl_panel.putConstraint(SpringLayout.SOUTH, lbProductCount, -10, SpringLayout.SOUTH, panel);
		sl_panel.putConstraint(SpringLayout.EAST, lbProductCount, -41, SpringLayout.WEST, panel_1);
		lbProductCount.setFont(new Font("Tahoma", Font.PLAIN, 12));
		panel.add(lbProductCount);
		
		JPanel panel_2 = new JPanel();
		panel_2.setBorder(new EmptyBorder(10, 20, 5, 20));
		add(panel_2, BorderLayout.CENTER);
		panel_2.setLayout(new GridLayout(1, 0, 0, 0));
		
		JScrollPane scrollPane = new JScrollPane();
		panel_2.add(scrollPane);
		tb = new ListProductTable(new ListProductTable.ListProductTableRes() {
			@Override
			public void setAmountProduct(int amount) {
				lbProductCount.setText("Sản phẩm: "+amount);
			}
		});
		scrollPane.setViewportView(tb);
		// TODO Auto-generated constructor stub
	}
	
//	public List<SanPham> getListSP(String condition) {
//		List<SanPham> list = new ArrayList<>();
//		if (condition == null) {
//			list = 
//		}
//	}
}
