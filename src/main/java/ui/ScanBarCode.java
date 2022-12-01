package ui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import com.dynamsoft.dbr.*;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import com.github.sarxos.webcam.Webcam;
import com.github.sarxos.webcam.WebcamPanel;
import com.github.sarxos.webcam.WebcamResolution;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;

import javax.swing.JLabel;
import javax.swing.JOptionPane;

public class ScanBarCode extends JDialog implements Runnable, ThreadFactory {

	private final JPanel contentPanel = new JPanel();
	private WebcamPanel panel = null;
	private Webcam webcam = null;
	private static final long serialVersionUID = 6441489157408381878L;
    private Executor executor = Executors.newSingleThreadExecutor((ThreadFactory) this);

	private String encodeText = "";
	private boolean isOpen = true;

	private ScanBarcodeReponse reponseScanBarcode;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			ScanBarCode dialog = new ScanBarCode(new ScanBarcodeReponse() {

				@Override
				public void getScanBarcodeReponse(String rs) {
					System.out.println(rs);
				}
			});
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */

	public interface ScanBarcodeReponse {
		void getScanBarcodeReponse(String rs);
	}
	public ScanBarCode(ScanBarcodeReponse reponseScanBarcode) {
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		setVisible(true);
		setBounds(100, 100, 450, 300);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(new BorderLayout(0, 0));
		initWebcam();
		handleCloseJDialog();
		this.reponseScanBarcode = reponseScanBarcode;
	}
	
	 private void initWebcam() {
	        Dimension size = WebcamResolution.QVGA.getSize();
	        webcam = Webcam.getWebcams().get(0); //0 is default webcam
	        webcam.setViewSize(size);

	        panel = new WebcamPanel(webcam);
	        panel.setPreferredSize(size);
	        panel.setFPSDisplayed(true);

	        contentPanel.add(panel, BorderLayout.CENTER);

	        executor.execute((Runnable) this);
	 }


	 
	 @Override
	    public void run() {

		 while (isOpen) {
			 try {
				 Thread.sleep(100);
			 } catch (InterruptedException e) {
				 e.printStackTrace();
			 }

			 BufferedImage image = null;

			 if (webcam.isOpen()) {
				 if ((image = webcam.getImage()) == null) {
					 continue;
				 }
			 }

			 try {
				 BarcodeReader.initLicense("t0077xQAAAEIGphBIFNkeW1BxTrUE5L2PlW3p6bduOln/2ejTK7F35aySrgxKlaQiiWQrBi7JMAn703whCYkaghixfYV6eC1yswiPG75tK3o=");
			 } catch (BarcodeReaderException e) {
				 throw new RuntimeException(e);
			 }

			 BarcodeReader br = null;
			 try {
				 br = new BarcodeReader();
			 } catch (BarcodeReaderException e) {
				 throw new RuntimeException(e);
			 }
			 // Read barcode
			 try {

				 //Best coverage settings
				 br.initRuntimeSettingsWithString("{\"ImageParameter\":{\"Name\":\"BestCoverage\",\"DeblurLevel\":9,\"ExpectedBarcodesCount\":512,\"ScaleDownThreshold\":100000,\"LocalizationModes\":[{\"Mode\":\"LM_CONNECTED_BLOCKS\"},{\"Mode\":\"LM_SCAN_DIRECTLY\"},{\"Mode\":\"LM_STATISTICS\"},{\"Mode\":\"LM_LINES\"},{\"Mode\":\"LM_STATISTICS_MARKS\"}],\"GrayscaleTransformationModes\":[{\"Mode\":\"GTM_ORIGINAL\"},{\"Mode\":\"GTM_INVERTED\"}]}}", EnumConflictMode.CM_OVERWRITE);
				 //Best speed settings
				 //br.initRuntimeSettingsWithString("{\"ImageParameter\":{\"Name\":\"BestSpeed\",\"DeblurLevel\":3,\"ExpectedBarcodesCount\":512,\"LocalizationModes\":[{\"Mode\":\"LM_SCAN_DIRECTLY\"}],\"TextFilterModes\":[{\"MinImageDimension\":262144,\"Mode\":\"TFM_GENERAL_CONTOUR\"}]}}",EnumConflictMode.CM_OVERWRITE);
				 //Balance settings
				 //br.initRuntimeSettingsWithString("{\"ImageParameter\":{\"Name\":\"Balance\",\"DeblurLevel\":5,\"ExpectedBarcodesCount\":512,\"LocalizationModes\":[{\"Mode\":\"LM_CONNECTED_BLOCKS\"},{\"Mode\":\"LM_STATISTICS\"}]}}",EnumConflictMode.CM_OVERWRITE);

				 PublicRuntimeSettings runtimeSettings = br.getRuntimeSettings();
				 runtimeSettings.barcodeFormatIds = EnumBarcodeFormat.BF_ALL;
				 runtimeSettings.barcodeFormatIds_2 = EnumBarcodeFormat_2.BF2_POSTALCODE | EnumBarcodeFormat_2.BF2_DOTCODE;
				 runtimeSettings.expectedBarcodesCount = 32;
				 br.updateRuntimeSettings(runtimeSettings);


				 TextResult[] results = null;
				 if(image!=null) {
					 results = br.decodeBufferedImage(image,"");
				 }

				 if (results != null && results.length > 0) {
					 encodeText = results[0].barcodeText;
					 reponseScanBarcode.getScanBarcodeReponse(encodeText);
					 webcam.close();
					 dispose();
					 isOpen = false;
				 }
			 } catch (BarcodeReaderException e) {
				 e.printStackTrace();
			 } catch (IOException e) {
				 throw new RuntimeException(e);
			 }
		 }
	 }

	    @Override
	    public Thread newThread(Runnable r) {
	        Thread t = new Thread(r, "My Thread");
	        t.setDaemon(true);
	        return t;
	    }

		public String getEncodeText() {
			return encodeText;
		}

		public void handleCloseJDialog() {
			addWindowListener(new java.awt.event.WindowAdapter() {
				@Override
				public void windowClosing(java.awt.event.WindowEvent e) {
					webcam.close();
					dispose();
					isOpen = false;
				}
			});
		}
}
