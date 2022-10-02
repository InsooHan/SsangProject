package dto;

public class MemberDto {

	private int user_num;
	private String user_id;
	private String user_pass;
	private String user_name;
	private String user_phone;
	private int gong;
	private int mentor;
	
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public int getGong() {
		return gong;
	}
	public void setGong(int gong) {
		this.gong = gong;
	}
	public int getMentor() {
		return mentor;
	}
	public void setMentor(int mentor) {
		this.mentor = mentor;
	}
	
}
