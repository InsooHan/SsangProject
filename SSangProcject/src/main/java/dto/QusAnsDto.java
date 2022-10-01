package dto;

import java.sql.Timestamp;

public class QusAnsDto {
	
	private String que_num;
	private String que_id;
	private String que_subject;
	private String que_content;
	private String que_img;
	private Timestamp que_date;
	private int que_chu;
	
	//getter,setter
	public String getQue_num() {
		return que_num;
	}
	public void setQue_num(String que_num) {
		this.que_num = que_num;
	}
	public String getQue_id() {
		return que_id;
	}
	public void setQue_id(String que_id) {
		this.que_id = que_id;
	}
	public String getQue_subject() {
		return que_subject;
	}
	public void setQue_subject(String que_subject) {
		this.que_subject = que_subject;
	}
	public String getQue_content() {
		return que_content;
	}
	public void setQue_content(String que_content) {
		this.que_content = que_content;
	}
	public String getQue_img() {
		return que_img;
	}
	public void setQue_img(String que_img) {
		this.que_img = que_img;
	}
	public Timestamp getQue_date() {
		return que_date;
	}
	public void setQue_date(Timestamp que_date) {
		this.que_date = que_date;
	}
	public int getQue_chu() {
		return que_chu;
	}
	public void setQue_chu(int que_chu) {
		this.que_chu = que_chu;
	}
	
	
	
}
