package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import dto.QusAnsDto;

public class QusAnsDao {

	DbConnect db=new DbConnect();
	
	//insert
	public void insertQusAns(QusAnsDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into Question values(null,?,?,?,?,now(),0)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getQue_id());
			pstmt.setString(2, dto.getQue_subject());
			pstmt.setString(3, dto.getQue_content());
			pstmt.setString(4, dto.getQue_img());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//page list
	//전체수
	public int getTotalCount() {
		int n=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from Question";
		
		try {
			pstmt=conn.prepareStatement(sql);
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
	//전체출력
	public List<QusAnsDto> getlist(int start,int perpage){
		List<QusAnsDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from Question order by que_num desc limit ?,?";
                  //select * from Question where que_subject like '%두번%' order by que_num desc;
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				QusAnsDto dto=new QusAnsDto();
				
				dto.setQue_num(rs.getString("que_num"));
				dto.setQue_id(rs.getString("que_id"));
				dto.setQue_subject(rs.getString("que_subject"));
				dto.setQue_content(rs.getString("que_content"));
				dto.setQue_img(rs.getString("que_img"));
				dto.setQue_date(rs.getTimestamp("que_date"));
				dto.setQue_chu(rs.getInt("que_chu"));
				
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
	
	//전체 출력과 검색
	public List<QusAnsDto> getlistsearch(int start,int perpage,String keyword){
		List<QusAnsDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from Question where que_subject like ? order by que_num desc limit ?,?";
                  //select * from Question where que_subject like '%두번%' order by que_num desc;
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, perpage);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				QusAnsDto dto=new QusAnsDto();
				
				dto.setQue_num(rs.getString("que_num"));
				dto.setQue_id(rs.getString("que_id"));
				dto.setQue_subject(rs.getString("que_subject"));
				dto.setQue_content(rs.getString("que_content"));
				dto.setQue_img(rs.getString("que_img"));
				dto.setQue_date(rs.getTimestamp("que_date"));
				dto.setQue_chu(rs.getInt("que_chu"));
				
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
	
	//num에 따른 출력
	public QusAnsDto getdata(String num) {
		QusAnsDto dto=new QusAnsDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from Question where que_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setQue_num(rs.getString("que_num"));
				dto.setQue_id(rs.getString("que_id"));
				dto.setQue_subject(rs.getString("que_subject"));
				dto.setQue_content(rs.getString("que_content"));
				dto.setQue_img(rs.getString("que_img"));
				dto.setQue_date(rs.getTimestamp("que_date"));
				dto.setQue_chu(rs.getInt("que_chu"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	//update
	public void updateQusAns(QusAnsDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update Question set que_subject=?,que_content=?,que_img=? where que_num=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getQue_subject());
			pstmt.setString(2, dto.getQue_content());
			pstmt.setString(3, dto.getQue_img());
			pstmt.setString(4, dto.getQue_num());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//delete
	public void deleteQusAns(String num) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from Question where que_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//like
	public void updatelikes(String num) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update Question set que_chu=que_chu+1 where que_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	
	}
	
	//답글 insert

}
