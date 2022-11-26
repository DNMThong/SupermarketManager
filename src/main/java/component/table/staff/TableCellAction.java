package component.table.staff;

import component.table.ModelAction;
import entity.NhanVien;

import javax.swing.*;
import java.awt.*;

public class TableCellAction extends DefaultCellEditor {

	private ModelAction<NhanVien, EventAction> data;
	
	public TableCellAction() {
        super(new JCheckBox());
    }

    @Override
    public Component getTableCellEditorComponent(JTable jtable, Object o, boolean bln, int i, int i1) {
        data = (ModelAction) o;
        StaffAction cell = new  StaffAction(data);
        return cell;
    }

    //  This method to pass data to cell render when focus lose in cell
    @Override
    public Object getCellEditorValue() {
        return data;
    }

    
    
}
