package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import dto.CommentDto;

public class CommentDao {

	db.DbConnect db=new db.DbConnect();
	
	//insert
	public void insertComment(CommentDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into comment (comm_num,comm_writer,comm_content,comm_date,ans_num) values (null,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			

			pstmt.setString(1, dto.getComm_writer());
			pstmt.setInt(2, dto.getComm_num());
			pstmt.setString(3, dto.getComm_content());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//전체출력
	public List<CommentDto> getAllComment(String comm_num)
	{
		List<CommentDto> list=new Vector<CommentDto>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from comment where comm_num=? order by cnum";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, comm_num);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				CommentDto dto=new CommentDto();
				dto.setComm_num(rs.getInt("comm_num"));
				dto.setComm_writer(rs.getString("comm_writer"));
				dto.setComm_content(rs.getString("comm_content"));
				dto.setComm_datetime(rs.getString("comm_datetime"));
				dto.setAns_num(rs.getInt("ans_num"));
				
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
	//삭제
	public void deleteComment(int comm_num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="delete from comment where comm_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, comm_num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}
