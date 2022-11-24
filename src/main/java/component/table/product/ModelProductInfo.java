package component.table.product;

import javax.swing.ImageIcon;

public class ModelProductInfo {
	
	private ImageIcon icon;
	private String name;
	private String sup;
	
	public ModelProductInfo() {
		super();
	}

	public ModelProductInfo(String name, String sup, ImageIcon icon) {
		// TODO Auto-generated constructor stub
		this.icon = icon;
		this.name = name;
		this.sup = sup;
	}

	public ImageIcon getIcon() {
		return icon;
	}

	public void setIcon(ImageIcon icon) {
		this.icon = icon;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSup() {
		return sup;
	}

	public void setSup(String sup) {
		this.sup = sup;
	}
	
}
