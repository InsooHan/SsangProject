package dto;

import java.sql.Timestamp;

public class MentorDto {
	private String mentor_num;
	private String mentor_category;
	private String mentor_title;
	private String mentor_mail;
	private String mentor_job1;
	private String mentor_job2;
	private String mentor_career;
	private String mentor_schedule;
	private String mentor_explain;
	private String mentor_notice;
	private String mentor_id;
	private Timestamp reg_date;
	
	public String getMentor_num() {
		return mentor_num;
	}
	public void setMentor_num(String mentor_num) {
		this.mentor_num = mentor_num;
	}
	public String getMentor_category() {
		return mentor_category;
	}
	public void setMentor_category(String mentor_category) {
		this.mentor_category = mentor_category;
	}
	public String getMentor_title() {
		return mentor_title;
	}
	public void setMentor_title(String mentor_title) {
		this.mentor_title = mentor_title;
	}
	public String getMentor_mail() {
		return mentor_mail;
	}
	public void setMentor_mail(String mentor_mail) {
		this.mentor_mail = mentor_mail;
	}
	public String getMentor_job1() {
		return mentor_job1;
	}
	public void setMentor_job1(String mentor_job1) {
		this.mentor_job1 = mentor_job1;
	}
	public String getMentor_job2() {
		return mentor_job2;
	}
	public void setMentor_job2(String mentor_job2) {
		this.mentor_job2 = mentor_job2;
	}
	public String getMentor_career() {
		return mentor_career;
	}
	public void setMentor_career(String mentor_career) {
		this.mentor_career = mentor_career;
	}
	public String getMentor_schedule() {
		return mentor_schedule;
	}
	public void setMentor_schedule(String mentor_schedule) {
		this.mentor_schedule = mentor_schedule;
	}
	public String getMentor_explain() {
		return mentor_explain;
	}
	public void setMentor_explain(String mentor_explain) {
		this.mentor_explain = mentor_explain;
	}
	public String getMentor_notice() {
		return mentor_notice;
	}
	public void setMentor_notice(String mentor_notice) {
		this.mentor_notice = mentor_notice;
	}
	public String getMentor_id() {
		return mentor_id;
	}
	public void setMentor_id(String mentor_id) {
		this.mentor_id = mentor_id;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
}
