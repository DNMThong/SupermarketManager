package component.table.staff;

import javax.swing.ImageIcon;

public class ModelStaffInfo {
	
	private ImageIcon icon;
	private String name;
	private boolean gender;
	
	public ModelStaffInfo() {
		super();
	}

	public ModelStaffInfo(String name, boolean gender, ImageIcon icon) {
		// TODO Auto-generated constructor stub
		this.icon = icon;
		this.name = name;
		this.gender = gender;
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

	public boolean getGender() {
		return gender;
	}

	public void setGender(boolean role) {
		this.gender = role;
	}
	
}
