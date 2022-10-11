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
		
		String sql = "INSERT INTO member VALUES (null,?,?,?,?,0,0)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_pass());
			pstmt.setString(3, dto.getUser_name());
			pstmt.setString(4, dto.getUser_phone());
			
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
	
	//아이디 통해서 user_num 얻기
	public String getNum(String user_id) {
			
			String user_num="";
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql="select user_num from member where user_id=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, user_id);
				rs=pstmt.executeQuery();
				
				if(rs.next())
					user_num=rs.getString("user_num");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return user_num;
		}
	
	//아이디 통해서 user_phone 얻기
	public String getPhone(String user_id) {
		
		String user_phone="";
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="select user_phone from member where user_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				user_phone=rs.getString("user_phone");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return user_phone;
	}
	
	//지식공유자(gong=1)의 user_num에 대한 이름 반환
	public String getGongname(String user_num) {
		
		String user_name="";
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="select user_name from member where user_num=? and gong=1";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user_num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				user_name=rs.getString("user_name");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} db.dbClose(rs, pstmt, conn);
		
		return user_name;
	} 
	

//user_num을 이용해서 이름 얻기
public String getNamenum(String num) {
	
	String name = "";
		
	Connection conn = db.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	String sql = "SELECT * FROM member WHERE user_num=?";
		
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);
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