package dto;

import java.sql.Timestamp;

public class QusAnsAnswerDto {
	
	private String ans_num;
	private String ans_id;
	private String ans_content;
	private String image;
	private Timestamp reg_date;
	private String que_num;
	
	//setter,getter
	public String getAns_num() {
		return ans_num;
	}
	public void setAns_num(String ans_num) {
		this.ans_num = ans_num;
	}
	public String getAns_id() {
		return ans_id;
	}
	public void setAns_id(String ans_id) {
		this.ans_id = ans_id;
	}
	public String getAns_content() {
		return ans_content;
	}
	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getQue_num() {
		return que_num;
	}
	public void setQue_num(String que_num) {
		this.que_num = que_num;
	}
	


}
