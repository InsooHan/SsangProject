package dto;

import java.sql.Timestamp;

public class ClassDto {
  
	private String class_num;
	private String category;
	private String sub_category;
	private String levels;
	private String class_name;
	private String user_num;
	private int class_price;
	private String class_image;
	private String class_video;
	private int class_chu;
	private String class_content;
	private Timestamp reg_date;
	
	public String getClass_image() {
		return class_image;
	}
	public void setClass_image(String class_image) {
		this.class_image = class_image;
	}
	public String getClass_num() {
		return class_num;
	}
	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSub_category() {
		return sub_category;
	}
	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}
	public String getLevels() {
		return levels;
	}
	public void setLevels(String levels) {
		this.levels = levels;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public int getClass_price() {
		return class_price;
	}
	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}
	public String getClass_video() {
		return class_video;
	}
	public void setClass_video(String class_video) {
		this.class_video = class_video;
	}
	public int getClass_chu() {
		return class_chu;
	}
	public void setClass_chu(int class_chu) {
		this.class_chu = class_chu;
	}
	public String getClass_content() {
		return class_content;
	}
	public void setClass_content(String class_content) {
		this.class_content = class_content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

}
