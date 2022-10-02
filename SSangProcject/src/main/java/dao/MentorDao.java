package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DbConnect;
import dto.MentorDto;

public class MentorDao {

	DbConnect db=new DbConnect();
	
	//insert
	
	public void insertMentor(MentorDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into mentor vlaues(null,?,?,?,?,?,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMentor_category());
			pstmt.setString(2, dto.getMentor_title());
			pstmt.setString(3, dto.getMentor_mail());
			pstmt.setString(4, dto.getMentor_job1());
			pstmt.setString(5, dto.getMentor_job2());
			pstmt.setString(6, dto.getMentor_career());
			pstmt.setString(7, dto.getMentor_schedule());
			pstmt.setString(8, dto.getMentor_explain());
			pstmt.setString(9, dto.getMentor_notice());
			pstmt.setString(10, dto.getMentor_id());

			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
}
