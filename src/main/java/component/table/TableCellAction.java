package component.table;

import component.table.product.Action;

import javax.swing.*;
import java.awt.*;

public class TableCellAction extends DefaultCellEditor {

	private ModelAction data;
	
	public TableCellAction() {
        super(new JCheckBox());
    }

    @Override
    public Component getTableCellEditorComponent(JTable jtable, Object o, boolean bln, int i, int i1) {
        data = (ModelAction) o;
        Action cell = new Action(data);
        return cell;
    }

    //  This method to pass data to cell render when focus lose in cell
    @Override
    public Object getCellEditorValue() {
        return data;
    }

    
    
}
