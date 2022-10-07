package dto;

import java.sql.Timestamp;

public class QuestionDto {
	private int que_num;
	private String que_id;
	private String que_subject;
	private String que_content;
	private String que_img;
	private Timestamp que_datetime;
	private int que_chu;
	private int answer_cnt;
	
	public QuestionDto() {}
	public QuestionDto(int num , String id, String subject, String content,String img, Timestamp date, int chu) {
		this.que_num=num;
		this.que_id=id;
		this.que_subject=subject;
		this.que_content=content;
		this.que_img=img;
		this.que_datetime=date;
		this.que_chu=chu;
	}
	
	//getter,setter
	public int getQue_num() {
		return que_num;
	}
	public void setQue_num(int que_num) {
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
	public Timestamp getQue_datetime() {
		return que_datetime;
	}
	public void setQue_datetime(Timestamp que_datetime) {
		this.que_datetime = que_datetime;
	}
	public int getQue_chu() {
		return que_chu;
	}
	public void setQue_chu(int que_chu) {
		this.que_chu = que_chu;
	}
	public int getAnswer_cnt() {
		return answer_cnt;
	}
	public void setAnswer_cnt(int answer_cnt) {
		this.answer_cnt = answer_cnt;
	}
	
	
	
	/*
	public int getAnswer_cnt() {
		return answer_cnt;
	}
	public void setAnswer_cnt(int answer_cnt) {
		this.answer_cnt = answer_cnt;
	}
	public int getQue_num() {
		return que_num;
	}
	public void setQue_num(int que_num) {
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
	public String getQue_date() {
		return que_datetime;
	}
	public void setQue_date(String que_date) {
		this.que_datetime = que_date;
	}
	public int getQue_chu() {
		return que_chu;
	}
	public void setQue_chu(int que_chu) {
		this.que_chu = que_chu;
	}
	*/
	
}
