package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import dto.AnswerDto;

public class AnswerDao {

	db.DbConnect db=new db.DbConnect();
	
	
	//insert
		public void insertAnswer(AnswerDto dto)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			String sql="insert into answer (ana_num,ana_id,ana_content,image,reg_date,que_num) values (?,?,?,now())";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getAna_id());
				pstmt.setInt(2, dto.getAna_num());
				pstmt.setString(3, dto.getAna_content());
				
				//실행
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		
		//전체출력
		public List<AnswerDto> getAllAnswer(int ana_num)
		{
			List<AnswerDto> list = new Vector<AnswerDto>();
		
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs =null;
			
			String sql = "select * from answer where qnum=? order by anum";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, ana_num);
				rs = pstmt.executeQuery();
				
				while(rs.next())
				{
					AnswerDto dto = new AnswerDto();
					
					dto.setAna_num(rs.getInt("ana_num"));
					dto.setAna_id(rs.getString("ana_id"));
					dto.setAna_content(rs.getString("ana_content"));
					dto.setImage(rs.getString("image"));
					dto.setReg_date(rs.getString("reg_date"));
					dto.setQue_num(rs.getInt("que_num"));
					
					//list추가
					list.add(dto);
					
				}
			}catch (SQLException e) {
				e.printStackTrace();
				
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return list;
		} 
		
		//삭제
		
		public void deleteAnswer(String anum)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="delete from answer where anum=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, anum);
				pstmt.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
		}
		

}
