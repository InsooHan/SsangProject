package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DbConnect;
import dto.QusAnsAnswerDto;

public class QusAnsAnswerDao {
	
	DbConnect db=new DbConnect();
	
	//답글 추가
		public void insertAnswer(QusAnsAnswerDto dto) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="insert into Answer (ans_id,ans_content,image,reg_date,que_num) values(?,?,?,now(),?)";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getAns_id());
				pstmt.setString(2, dto.getAns_content());
				pstmt.setTimestamp(3, dto.getReg_date());
				pstmt.setString(4, dto.getQue_num());
				
				pstmt.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}

}
