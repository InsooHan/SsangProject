package dto;

import java.sql.Timestamp;

public class ReviewDto {
	private String review_num;
	private String class_num;
	private String user_num;
	private String review_content;
	private String reviewstar;
	private Timestamp reg_date;
	private int review_chu;
	public String getReview_num() {
		return review_num;
	}
	public void setReview_num(String review_num) {
		this.review_num = review_num;
	}
	public String getClass_num() {
		return class_num;
	}
	public void setClass_num(String class_num) {
		this.class_num = class_num;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReviewstar() {
		return reviewstar;
	}
	public void setReviewstar(String reviewstar) {
		this.reviewstar = reviewstar;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReview_chu() {
		return review_chu;
	}
	public void setReview_chu(int review_chu) {
		this.review_chu = review_chu;
	}
}
