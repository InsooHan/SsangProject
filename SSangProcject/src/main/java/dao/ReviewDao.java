package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DbConnect;
import dto.ReviewDto;

public class ReviewDao {
	DbConnect db = new DbConnect();
	
	//하나의 review dto 가져오기
	public ReviewDto getReview(String num) {
		ReviewDto dto = new ReviewDto();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from review where review_num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setReview_num(rs.getString("review_num"));
				dto.setClass_num(rs.getString("class_num"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setReview_content(rs.getString("review_content"));
				dto.setReviewstar(rs.getString("reviewstar"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setReview_chu(rs.getInt("review_chu"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
// 강의에 대한 총 수강평점 평균 구하기
	public double getReviewStar(String num) {
		double star= 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select avg(reviewstar) from review where class_num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				star=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return star;
	}
}
