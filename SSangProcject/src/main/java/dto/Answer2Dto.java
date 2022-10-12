package dto;

import java.sql.Timestamp;

public class Answer2Dto {
   private int ans_num;
   private String ans_id;
   private String ans_content;
   private String image;
   private Timestamp reg_datetime;
   private int que_num;
   
   public Answer2Dto() {}
   public Answer2Dto(int num, String id, String content,String image, Timestamp datetime, int qnum) {
      this.ans_num = num;
      this.ans_id=id;
      this.ans_content=content;
      this.image=image;
      this.reg_datetime=datetime;
      this.que_num=qnum;
   }
   
   //setter,getter
public int getAns_num() {
	return ans_num;
}
public void setAns_num(int ans_num) {
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
public Timestamp getReg_datetime() {
	return reg_datetime;
}
public void setReg_datetime(Timestamp reg_datetime) {
	this.reg_datetime = reg_datetime;
}
public int getQue_num() {
	return que_num;
}
public void setQue_num(int que_num) {
	this.que_num = que_num;
}
   
   
   /*
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
   
   public Timestamp getReg_datetime() {
      return reg_datetime;
   }
   public void setReg_datetime(Timestamp reg_datetime) {
      this.reg_datetime = reg_datetime;
   }
   public int getQue_num() {
      return que_num;
   }
   public void setQue_num(int que_num) {
      this.que_num = que_num;
   }
*/
   
}