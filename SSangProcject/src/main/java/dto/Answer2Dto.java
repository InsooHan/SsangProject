package dto;

public class Answer2Dto {
	private int ans_num;
	private String ans_id;
	private String ans_content;
	private String reg_date;
	private int que_num;
	
	public Answer2Dto() {}
	public Answer2Dto(int num, String id, String content, String datetime, int qnum) {
		this.ans_num = num;
		this.ans_id=id;
		this.ans_content=content;
		this.reg_date=datetime;
		this.que_num=qnum;
	}
	
	
	
	public int getAns_num() {
		return ans_num;
	}
	public void setAns_num(int ans_num) {
		this.ans_num = ans_num;
	}
	public String getAns_id() {
		return ans_id;
	}
	public void setAns_id(String ana_id) {
		this.ans_id = ana_id;
	}
	public String getAns_content() {
		return ans_content;
	}
	public void setAns_content(String ana_content) {
		this.ans_content = ana_content;
	}
	
	public String getReg_datetime() {
		return reg_date;
	}
	public void setReg_datetime(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getQue_num() {
		return que_num;
	}
	public void setQue_num(int que_num) {
		this.que_num = que_num;
	}

	
}
