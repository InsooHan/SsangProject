package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DbConnect;
import dto.MemberDto;

public class MemberDao {

	DbConnect db = new DbConnect();
	
	//insert
	public void insertMember(MemberDto dto) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO member VALUES (null,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_pass());
			pstmt.setString(3, dto.getUser_name());
			pstmt.setString(4, dto.getUser_phone());
			pstmt.setInt(5, dto.getGong());
			pstmt.setInt(6, dto.getMentor());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//아이디 체크
	public int isIdCheck(String id) {
			
		int isid = 0;
			
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		String sql = "SELECT COUNT(*) FROM member WHERE user_id=?";
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
				
			if(rs.next()) {
					
				isid = rs.getInt(1);
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
			
		return isid;
	}
	
	//아이디와 비밀번호 체크
	public boolean isIdPass(String id, String pass) {
			
		boolean b = false;
			
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		String sql = "SELECT * FROM member WHERE user_id=? and user_pass=?";
			
		try {
			pstmt = conn.prepareStatement(sql);
				
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
				
			rs = pstmt.executeQuery();
				
			if(rs.next())
				b = true;
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
			
		return b;
	}
		
	//아이디 통해서 name얻기
	public String getName(String id) {
			
		String name = "";
			
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		String sql = "SELECT * FROM member WHERE user_id=?";
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
				
			if(rs.next()) {
				name = rs.getString("user_name");
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
			
		return name;
	}
	
}
