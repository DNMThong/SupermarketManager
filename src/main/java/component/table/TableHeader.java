package component.table;

import component.PanelRounded;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;

public class TableHeader extends JPanel {

	public TableHeader(String text) {
		setLayout(new GridLayout(1, 0));
		setBorder(new EmptyBorder(15, 25, 15, 25));
		setBackground(Color.white);
		
		PanelRounded inner = new PanelRounded();
		inner.setBackground(Color.LIGHT_GRAY);
		inner.setRoundBottomLeft(20);
		inner.setRoundBottomRight(20);
		inner.setRoundTopLeft(20);
		inner.setRoundTopRight(20);
		inner.setBorder(new EmptyBorder(0, 10, 0, 10));
		add(inner);
        
        JLabel lbHeader = new JLabel(text);
        lbHeader.setForeground(Color.white);
        lbHeader.setHorizontalAlignment(JLabel.CENTER);
        inner.add(lbHeader);
	}

}
