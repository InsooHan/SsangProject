package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DbConnect;
import dto.ReviewAnswerDto;

public class ReviewAnswerDao {
 DbConnect db = new DbConnect();
 //수강평에 해당하는 답글 불러오기
 public ReviewAnswerDto getranswer(String num){
	 ReviewAnswerDto dto = new ReviewAnswerDto();
	 Connection conn = db.getConnection();
	 PreparedStatement pstmt = null;
	 ResultSet rs = null;
	 String sql = "select * from review_answer where review_num=?";
	 try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dto.setAns_num(rs.getString("ans_num"));
			dto.setReview_num(rs.getString("review_num"));
			dto.setUser_num(rs.getString("user_num"));
			dto.setAns_content(rs.getString("ans_content"));
			dto.setAns_chu(rs.getInt("ans_chu"));
			dto.setReg_date(rs.getTimestamp("reg_date"));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(rs, pstmt, conn);
	}
	 return dto;
 }
}
