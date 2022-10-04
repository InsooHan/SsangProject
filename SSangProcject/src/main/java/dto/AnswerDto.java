package dto;

import java.sql.Timestamp;

public class AnswerDto {
	
	private int ana_num;
	public int getAna_num() {
		return ana_num;
	}
	public void setAna_num(int ana_num) {
		this.ana_num = ana_num;
	}
	public String getAna_id() {
		return ana_id;
	}
	public void setAna_id(String ana_id) {
		this.ana_id = ana_id;
	}
	public String getAna_content() {
		return ana_content;
	}
	public void setAna_content(String ana_content) {
		this.ana_content = ana_content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getQue_num() {
		return que_num;
	}
	public void setQue_num(int que_num) {
		this.que_num = que_num;
	}
	private String ana_id;
	private String ana_content;
	private String image;
	private String reg_date;
	private int que_num;

}
