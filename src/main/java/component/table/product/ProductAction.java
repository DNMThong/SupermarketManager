package component.table.product;

import component.Button;
import component.table.ModelAction;
import entity.SanPham;
import utils.ImageUtil;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ProductAction extends JPanel {

	Button btnEdit;
	Button btnDelete;

	public ProductAction(ModelAction<SanPham, EventAction> data) {
		// TODO Auto-generated constructor stub
		setOpaque(true);
		setLayout(new GridLayout(1, 2, 10, 0));
		setBorder(new EmptyBorder(15, 60, 15, 60));
		
		btnEdit = new Button();
		setButtonProp(btnEdit, ImageUtil.read(getClass().getResource("/icon/edit.png"), 12, 12));

		btnEdit.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				data.getEvent().update(data.getEntity());
			}
			
		});
		
		btnDelete = new Button();
		setButtonProp(btnDelete, ImageUtil.read(getClass().getResource("/icon/delete.png"), 12, 12));
		btnDelete.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				data.getEvent().delete(data.getEntity());;
			}
			
		});
	}
	
	private void setButtonProp(Button btn, ImageIcon icon) {
		btn.setIcon(icon);
		btn.setBorder(new EmptyBorder(5, 10, 5, 10));
		btn.setColor(new Color(27, 89, 248));
		btn.setColorOver(new Color(65, 118, 255));
		btn.setColorClick(new Color(6, 60, 200));
		btn.setBorderColor(new Color(27, 89, 248));
		btn.setForeground(Color.white);
		btn.setFocusPainted(false);
		btn.setIconTextGap(12);
		btn.setRadius(60);
		btn.setOpaque(true);
		btn.setBackground(Color.white);
		btn.setFont(new Font("Tahoma", Font.BOLD, 12));
		add(btn);
	}
	
	public void setSelectedBackground(Color c) {
		btnEdit.setBackground(c);
		btnDelete.setBackground(c);
		setBackground(c);
	}
}
