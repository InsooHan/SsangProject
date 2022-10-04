package dto;

import java.sql.Timestamp;

public class CartDto {

	private String cart_num;
	private String class_num;
	private String user_num;
	private Timestamp cart_date;
	
	public String getCart_num() {
		return cart_num;
	}
	public void setCart_num(String cart_num) {
		this.cart_num = cart_num;
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
	public Timestamp getCart_date() {
		return cart_date;
	}
	public void setCart_date(Timestamp cart_date) {
		this.cart_date = cart_date;
	}
	
}
