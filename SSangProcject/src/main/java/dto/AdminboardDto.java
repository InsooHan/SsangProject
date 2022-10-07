package dto;

import java.sql.Timestamp;

public class AdminboardDto {
	private String ab_num;
	private String ad_id;
	private String ad_subject;
	private String ad_content;
	private String ad_image;
	private Timestamp ad_date;
	
	//setter, getter
	public String getAb_num() {
		return ab_num;
	}
	public void setAb_num(String ab_num) {
		this.ab_num = ab_num;
	}
	public String getAd_id() {
		return ad_id;
	}
	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}
	public String getAd_subject() {
		return ad_subject;
	}
	public void setAd_subject(String ad_subject) {
		this.ad_subject = ad_subject;
	}
	public String getAd_content() {
		return ad_content;
	}
	public void setAd_content(String ad_content) {
		this.ad_content = ad_content;
	}
	public String getAd_image() {
		return ad_image;
	}
	public void setAd_image(String ad_image) {
		this.ad_image = ad_image;
	}
	public Timestamp getAd_date() {
		return ad_date;
	}
	public void setAd_date(Timestamp ad_date) {
		this.ad_date = ad_date;
	}
	
	
}
