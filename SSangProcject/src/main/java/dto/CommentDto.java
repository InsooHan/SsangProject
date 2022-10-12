package dto;

public class CommentDto {
   private int comm_num;
   private String comm_writer;
   private String comm_content;
   private String comm_datetime;
   private int ans_num;
   
   
   public int getComm_num() {
      return comm_num;
   }
   public void setComm_num(int comm_num) {
      this.comm_num = comm_num;
   }
   public String getComm_writer() {
      return comm_writer;
   }
   public void setComm_writer(String comm_writer) {
      this.comm_writer = comm_writer;
   }
   public String getComm_content() {
      return comm_content;
   }
   public void setComm_content(String comm_content) {
      this.comm_content = comm_content;
   }
   public String getComm_datetime() {
      return comm_datetime;
   }
   public void setComm_datetime(String comm_datetime) {
      this.comm_datetime = comm_datetime;
   }
   public int getAns_num() {
      return ans_num;
   }
   public void setAns_num(int ans_num) {
      this.ans_num = ans_num;
   }
   
   
}