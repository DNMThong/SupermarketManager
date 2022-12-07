package component.table.product;

import component.table.ModelAction;
import entity.SanPham;

import javax.swing.*;
import java.awt.*;

public class TableCellAction extends DefaultCellEditor {

	private ModelAction<SanPham, EventAction> data;
	
	public TableCellAction() {
        super(new JCheckBox());
    }

    @Override
    public Component getTableCellEditorComponent(JTable jtable, Object o, boolean bln, int i, int i1) {
        data = (ModelAction<SanPham, EventAction>) o;
        ProductAction cell = new  ProductAction(data);
        return cell;
    }

    //  This method to pass data to cell render when focus lose in cell
    @Override
    public Object getCellEditorValue() {
        return data;
    }

    
    
}
