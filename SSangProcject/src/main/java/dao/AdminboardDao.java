package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import dto.AdminboardDto;
import dto.ClassDto;
import dto.QusAnsDto;


public class AdminboardDao {

	DbConnect db=new DbConnect();
	
	//inesert
	public void insertAdminboard(AdminboardDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="insert into adminboard values (null,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getAd_id());
			pstmt.setString(2, dto.getAd_subject());
			pstmt.setString(3, dto.getAd_content());
			pstmt.setString(4, dto.getAd_image());
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//그냥 전체 출력
	public List<AdminboardDto> getAllDatas(){
		
		List<AdminboardDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from adminboard order by ab_num desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				AdminboardDto dto=new AdminboardDto();
				
				dto.setAb_num(rs.getString("ab_num"));
				dto.setAd_id(rs.getString("ad_id"));
				dto.setAd_subject(rs.getString("ad_subject"));
				dto.setAd_content(rs.getString("ad_content"));
				dto.setAd_image(rs.getString("ad_image"));
				dto.setAd_date(rs.getTimestamp("ad_date"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} db.dbClose(rs, pstmt, conn);
		
		return list;
	}
	
	//page
	//전체수
		public int getTotalCount() {
			int n=0;
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select count(*) from adminboard";
			
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
		
		//검색된 값들의 전체수
				public int getTotalCountSearch(String keyword) {
					int n=0;
					
					Connection conn=db.getConnection();
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					
					String sql="select count(*) from adminboard where ad_subject like ?";
					
					try {
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, "%"+keyword+"%");
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
		
	//페이징 전체 출력
		public List<AdminboardDto> getpagelist(int start,int perpage){
			List<AdminboardDto> list=new Vector<>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from adminboard order by ab_num desc limit ?,?";
	                  //select * from Question where que_subject like '%두번%' order by que_num desc;
			
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, perpage);
				rs=pstmt.executeQuery();
				
				while(rs.next())
				{
					AdminboardDto dto=new AdminboardDto();
					
					dto.setAb_num(rs.getString("ab_num"));
					dto.setAd_id(rs.getString("ad_id"));
					dto.setAd_subject(rs.getString("ad_subject"));
					dto.setAd_content(rs.getString("ad_content"));
					dto.setAd_image(rs.getString("ad_image"));
					dto.setAd_date(rs.getTimestamp("ad_date"));
					
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
		public List<AdminboardDto> getlistsearch(int start,int perpage,String keyword){
			List<AdminboardDto> list=new Vector<>();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from adminboard where ad_subject like ? order by ab_num desc limit ?,?";
	                  //select * from Question where que_subject like '%두번%' order by que_num desc;
			
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, perpage);
				rs=pstmt.executeQuery();
				
				while(rs.next())
				{
					AdminboardDto dto=new AdminboardDto();
					
					dto.setAb_num(rs.getString("ab_num"));
					dto.setAd_id(rs.getString("ad_id"));
					dto.setAd_subject(rs.getString("ad_subject"));
					dto.setAd_content(rs.getString("ad_content"));
					dto.setAd_image(rs.getString("ad_image"));
					dto.setAd_date(rs.getTimestamp("ad_date"));
					
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
	
	//list based on num
		public AdminboardDto getdata(String num) {
			AdminboardDto dto=new AdminboardDto();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from adminboard where ab_num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
				rs=pstmt.executeQuery();
				
				if(rs.next())
				{			
					dto.setAb_num(rs.getString("ab_num"));
					dto.setAd_id(rs.getString("ad_id"));
					dto.setAd_subject(rs.getString("ad_subject"));
					dto.setAd_content(rs.getString("ad_content"));
					dto.setAd_image(rs.getString("ad_image"));
					dto.setAd_date(rs.getTimestamp("ad_date"));
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
	
	//delete
	
	
}
