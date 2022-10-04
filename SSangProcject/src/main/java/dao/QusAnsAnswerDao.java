package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

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
			pstmt.setString(3, dto.getImage());
			pstmt.setString(4, dto.getQue_num());
				
			pstmt.execute();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//답글list
	public List<QusAnsAnswerDto> getAllDatas(){
		List<QusAnsAnswerDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from Answer order by ans_num desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				QusAnsAnswerDto dto=new QusAnsAnswerDto();
				
				dto.setAns_num(rs.getString("ans_num"));
				dto.setAns_id(rs.getString("ans_id"));
				dto.setAns_content(rs.getString("ans_content"));
				dto.setImage(rs.getString("image"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setQue_num(rs.getString("que_num"));
				
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
	
	//답변 수
	public int answerNum(String num) {
		int n=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from Answer where que_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				n=rs.getInt(1);
			}			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return n;
	
	}
	
	
	
	
	
	
	
	
	
	
	
}








