package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;


import db.DbConnect;
import dto.BoardDto;
import dto.ClassDto;

public class BoardDao {

	DbConnect db=new DbConnect();
	
	//insert
	public void InsertBoard(BoardDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into board (board_id,board_content,board_photo,board_likes,reg_date) values(?,?,?,0,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getBoard_id());
			pstmt.setString(2, dto.getBoard_content());
			pstmt.setString(3, dto.getBoard_photo());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//전체 갯수
	public int getTotalCount() {
		int n=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from board";
		
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
	
	//페이지에서 필요한 만큼만 리턴되는 전체 출력
	public List<BoardDto> getlist(int start,int perpage){
		List<BoardDto> list=new Vector<BoardDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from board order by board_num desc limit ?,?";
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				BoardDto dto=new BoardDto();
				
				dto.setBoard_id(rs.getString("board_id"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_num(rs.getString("board_num"));
				dto.setBoard_photo(rs.getString("board_photo"));
				dto.setBoard_likes(rs.getInt("board_likes"));
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
	
	//num에 해당하는 dto 반환
	public BoardDto getData(String num){
		BoardDto dto=new BoardDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from board where board_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				
				dto.setBoard_id(rs.getString("board_id"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_photo(rs.getString("board_photo"));
				dto.setBoard_photo(rs.getString("board_photo"));
				dto.setBoard_likes(rs.getInt("board_likes"));
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
	
	//update
	public void updateBoard(BoardDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update board set board_content=?,board_photo=? where board_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getBoard_content());
			pstmt.setString(2, dto.getBoard_photo());
			pstmt.setString(3, dto.getBoard_num());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//delete
	public void deleteBoard(String num){
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from board where board_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,num);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//추천클릭시 추천수 증가
	public void updateBoard_likes(String num) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update board set board_likes=board_likes+1 where board_num=?";
		
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
	


	 
}