package utils;

import java.io.FileOutputStream;
import java.io.IOException;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.TableModel;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import utils.Alert;

public class XExcel { // Done //  Chỉ cần truyền Jtable là xuất ra đc

    public static void toExcel(JTable table) throws IOException { // IOException là các exception liên quan tới đọc ghi.
        try {
            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet worksheet = workbook.createSheet("Sheet 1");
            XSSFRow excelRow;
            TableModel model = table.getModel();

            XSSFCell cellTitle;
            excelRow = worksheet.createRow(0);
            for (int i = 0; i < model.getColumnCount(); i++) {
                cellTitle = excelRow.createCell(i);
                cellTitle.setCellValue(model.getColumnName(i));
            }

            for (int i = 0; i < model.getRowCount(); i++) {
                excelRow = worksheet.createRow(i + 1);
                for (int j = 0; j < model.getColumnCount(); j++) {
                    XSSFCell excelCell = excelRow.createCell(j);
                    excelCell.setCellValue(model.getValueAt(i, j).toString());
                }
            }

            JFileChooser fchoose = new JFileChooser();
            int option = fchoose.showSaveDialog(null);
            if (option == JFileChooser.APPROVE_OPTION) {
                String name = fchoose.getSelectedFile().getName();
                String path = fchoose.getSelectedFile().getParentFile().getPath();
                String file = path + "\\" + name + ".xlsx";
                FileOutputStream fos = null; // tạo như thế này để đóng file output stream.
                workbook.write(fos = new FileOutputStream(file));

                /*
                * Khi bạn ghi dữ liệu vào một luồng, nó không được ghi ngay lập tức và nó được lưu vào bộ đệm. 
                * Vì vậy, hãy sử dụng flush()khi bạn cần đảm bảo rằng tất cả dữ liệu của bạn từ bộ đệm đã được ghi.
                 */
                fos.flush();
                fos.close();
                workbook.close();
                Alert.success(null, "Xuất file thành công");
            }
        } catch (Exception ex) {
            Alert.error(null, "Xuất file không thành công");
        }
    }

}
