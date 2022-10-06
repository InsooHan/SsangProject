package dto;

import java.sql.Timestamp;

public class InquiryDto {

	private String inquiry_num;
	private String user_num;
	private String class_num;
	private String inquiry_content;
	private Timestamp reg_date;
	public String getInquiry_num() {
		return inquiry_num;
	}
	public void setInquiry_num(String inquiry_num) {
		this.inquiry_num = inquiry_num;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public String getClass_num() {
		return class_num;
	}
	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}
	public String getInquiry_content() {
		return inquiry_content;
	}
	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
}
