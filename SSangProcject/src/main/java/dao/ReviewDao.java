package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

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
				dto.setReviewstar(rs.getInt("reviewstar"));
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
	
	//강의에 해당하는 수강평 총 total count 구하기
	public int getTotalCount(String num){
		int i=0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select count(*) from review where class_num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				i=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return i;
	}
	
	//class_num에 해당하는 수강평 list 가져오기
	public List<ReviewDto> getAllReview(String num){
		List<ReviewDto> list = new Vector<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from review where class_num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewDto dto = new ReviewDto();
				dto.setReview_num(rs.getString("review_num"));
				dto.setClass_num(rs.getString("class_num"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setReview_content(rs.getString("review_content"));
				dto.setReviewstar(rs.getInt("reviewstar"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setReview_chu(rs.getInt("review_chu"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//review list 좋아요 순으로 정렬
	public List<ReviewDto> getAllReviewChu(String num){
		List<ReviewDto> list = new Vector<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from review where class_num=? order by review_chu desc";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewDto dto = new ReviewDto();
				dto.setReview_num(rs.getString("review_num"));
				dto.setClass_num(rs.getString("class_num"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setReview_content(rs.getString("review_content"));
				dto.setReviewstar(rs.getInt("reviewstar"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setReview_chu(rs.getInt("review_chu"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	//review list 최신 순으로 정렬
	public List<ReviewDto> getAllReviewRecent(String num){
		List<ReviewDto> list = new Vector<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from review where class_num=? order by reg_date desc";
		try {				pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewDto dto = new ReviewDto();
				dto.setReview_num(rs.getString("review_num"));
				dto.setClass_num(rs.getString("class_num"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setReview_content(rs.getString("review_content"));
				dto.setReviewstar(rs.getInt("reviewstar"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setReview_chu(rs.getInt("review_chu"));	
				list.add(dto);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	//평점 높은 순으로 출력
	public List<ReviewDto> getAllReviewRating1(String num){
		List<ReviewDto> list = new Vector<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from review where class_num=? order by reviewstar";
		try {				pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewDto dto = new ReviewDto();
				dto.setReview_num(rs.getString("review_num"));
				dto.setClass_num(rs.getString("class_num"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setReview_content(rs.getString("review_content"));
				dto.setReviewstar(rs.getInt("reviewstar"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setReview_chu(rs.getInt("review_chu"));	
				list.add(dto);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	//평점 낮은 순으로 출력
		public List<ReviewDto> getAllReviewRating2(String num){
			List<ReviewDto> list = new Vector<>();
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql="select * from review where class_num=? order by reviewstar desc";
			try {				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ReviewDto dto = new ReviewDto();
					dto.setReview_num(rs.getString("review_num"));
					dto.setClass_num(rs.getString("class_num"));
					dto.setUser_num(rs.getString("user_num"));
					dto.setReview_content(rs.getString("review_content"));
					dto.setReviewstar(rs.getInt("reviewstar"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					dto.setReview_chu(rs.getInt("review_chu"));	
					list.add(dto);
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return list;
		}
		//하트 클릭 시 review_chu 1씩 증가 
		public void increChu(String num){
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			String sql = "update review set review_chu = review_chu +1 where review_num=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
//수강평 평점 별 갯수 가져오기
		public int getReviewStarCount(String num, int star){
			int i= 0;
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql ="select count(*) from review where class_num=? and reviewstar=? group by reviewstar";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.setInt(2, star);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					i=rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return i;
		}
}
