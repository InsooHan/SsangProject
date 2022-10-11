package dto;

import java.sql.Timestamp;

public class ReviewAnswerDto {
	private String ans_num;
	private String review_num;
	private String user_num;
	private String ans_content;
	private int ans_chu;
	private Timestamp reg_date;
	public String getAns_num() {
		return ans_num;
	}
	public void setAns_num(String ans_num) {
		this.ans_num = ans_num;
	}
	public String getReview_num() {
		return review_num;
	}
	public void setReview_num(String review_num) {
		this.review_num = review_num;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public String getAns_content() {
		return ans_content;
	}
	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}
	public int getAns_chu() {
		return ans_chu;
	}
	public void setAns_chu(int ans_chu) {
		this.ans_chu = ans_chu;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
}
