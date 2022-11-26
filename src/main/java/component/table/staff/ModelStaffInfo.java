package component.table.staff;

import javax.swing.ImageIcon;

public class ModelStaffInfo {
	
	private ImageIcon icon;
	private String name;
	private boolean role;
	
	public ModelStaffInfo() {
		super();
	}

	public ModelStaffInfo(String name, boolean role, ImageIcon icon) {
		// TODO Auto-generated constructor stub
		this.icon = icon;
		this.name = name;
		this.role = role;
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

	public boolean getRole() {
		return role;
	}

	public void setRole(boolean role) {
		this.role = role;
	}
	
}
