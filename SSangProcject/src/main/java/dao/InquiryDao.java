package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import dto.InquiryDto;

public class InquiryDao {

	DbConnect db = new DbConnect();
	
	//전체 리스트 출력
	public List<InquiryDto> getAllInquiry(String num){
		List<InquiryDto> list = new Vector<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from inquiry where class_num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				InquiryDto dto = new InquiryDto();
				dto.setInquiry_num(rs.getString("inquiry_num"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setClass_num(rs.getString("class_num"));
				dto.setInquiry_content(rs.getString("inquiry_content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				
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
	
	//내가 작성한 글 list 출력
	public List<InquiryDto> getMyInquiry(String num, String id){
		List<InquiryDto> list = new Vector<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select a.* from inquiry a left join member b on a.user_num=b.user_num where class_num=? and user_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				InquiryDto dto = new InquiryDto();
				dto.setInquiry_num(rs.getString("inquiry_num"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setClass_num(rs.getString("class_num"));
				dto.setInquiry_content(rs.getString("inquiry_content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				
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
}
