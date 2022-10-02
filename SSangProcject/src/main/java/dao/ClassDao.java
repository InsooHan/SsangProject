package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import dto.ClassDto;

public class ClassDao {

	DbConnect db=new DbConnect();
	
	//class_num에 해당하는 1개 dto 출력
		public ClassDto getClass(String num) {
			ClassDto dto = new ClassDto();
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql="select * from class where class_num=?";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					dto.setClass_num(rs.getString("class_num"));
					dto.setCategory(rs.getString("category"));
					dto.setSub_category(rs.getString("sub_category"));
					dto.setLevels(rs.getString("levels"));
					dto.setClass_name(rs.getString("class_name"));
					dto.setUser_num(rs.getString("user_num"));
					dto.setClass_price(rs.getInt("class_price"));
					dto.setClass_image(rs.getString("class_image"));
					dto.setClass_video(rs.getString("class_video"));
					dto.setClass_chu(rs.getInt("class_chu"));
					dto.setClass_content(rs.getString("class_content"));
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
		
	//전체출력
	public List<ClassDto> getAllDatas(){
		
		List<ClassDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from class order by class_num desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				ClassDto dto=new ClassDto();
				
				dto.setClass_num(rs.getString("class_num"));
				dto.setCategory(rs.getString("category"));
				dto.setSub_category(rs.getString("sub_category"));
				dto.setLevels(rs.getString("levels"));
				dto.setClass_name(rs.getString("class_name"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setClass_price(rs.getInt("class_price"));
				dto.setClass_image(rs.getString("class_image"));
				dto.setClass_video(rs.getString("class_video"));
				dto.setClass_chu(rs.getInt("class_chu"));
				dto.setClass_content(rs.getString("class_content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} db.dbClose(rs, pstmt, conn);
		
		return list;
	}
	
	//페이징처리1.전체갯수 구하기
	public int getTotalCount() {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from class";
		int n=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				n=rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return n;
	}
	
	//페이징처리2.페이징처리에 필요한 리스트만 보내기
	public List<ClassDto> getList(int start,int perpage){
		
		List<ClassDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from class order by class_num desc limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
                ClassDto dto=new ClassDto();
				
				dto.setClass_num(rs.getString("class_num"));
				dto.setCategory(rs.getString("category"));
				dto.setSub_category(rs.getString("sub_category"));
				dto.setLevels(rs.getString("levels"));
				dto.setClass_name(rs.getString("class_name"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setClass_price(rs.getInt("class_price"));
				dto.setClass_image(rs.getString("class_image"));
				dto.setClass_video(rs.getString("class_video"));
				dto.setClass_chu(rs.getInt("class_chu"));
				dto.setClass_content(rs.getString("class_content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//난이도에 해당하는 것만 출력
    public List<ClassDto> getLevelsDatas(String levels){
		
		List<ClassDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from class where levels=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, levels);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
                ClassDto dto=new ClassDto();
				
				dto.setClass_num(rs.getString("class_num"));
				dto.setCategory(rs.getString("category"));
				dto.setSub_category(rs.getString("sub_category"));
				dto.setLevels(rs.getString("levels"));
				dto.setClass_name(rs.getString("class_name"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setClass_price(rs.getInt("class_price"));
				dto.setClass_image(rs.getString("class_image"));
				dto.setClass_video(rs.getString("class_video"));
				dto.setClass_chu(rs.getInt("class_chu"));
				dto.setClass_content(rs.getString("class_content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//카테고리에 해당하는 것만 출력
	public List<ClassDto> getCategoryDatas(String category){
		
		List<ClassDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from class where category=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
                ClassDto dto=new ClassDto();
				
				dto.setClass_num(rs.getString("class_num"));
				dto.setCategory(rs.getString("category"));
				dto.setSub_category(rs.getString("sub_category"));
				dto.setLevels(rs.getString("levels"));
				dto.setClass_name(rs.getString("class_name"));
				dto.setUser_num(rs.getString("user_num"));
				dto.setClass_price(rs.getInt("class_price"));
				dto.setClass_image(rs.getString("class_image"));
				dto.setClass_video(rs.getString("class_video"));
				dto.setClass_chu(rs.getInt("class_chu"));
				dto.setClass_content(rs.getString("class_content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//서브카테고리에 해당하는 것만 출력
	
	
	
	
	
	
}
