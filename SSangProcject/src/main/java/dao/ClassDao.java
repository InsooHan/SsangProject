package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import dto.CartDto;
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
	
	//전체리스트에서 난이도에 해당하는 것만 출력
    public List<ClassDto> getLevelsDatas(String levels){
		
		List<ClassDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from class where levels=? order by class_num desc";
		
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
    
    //카테고리에서 난이도에 해당하는 것만 출력
    public List<ClassDto> getCategoryLevelsDatas(String category,String levels){
		
		List<ClassDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from class where category=? and levels=? order by class_num desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, levels);
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
    
  //서브카테고리에서 난이도에 해당하는 것만 출력
    public List<ClassDto> getSubcategoryLevelsDatas(String category,String sub_category,String levels){
		
		List<ClassDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from class where category=? and sub_category=? and levels=? order by class_num desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, sub_category);
			pstmt.setString(3, levels);
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
		
		String sql="select * from class where category=? order by class_num desc";
		
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
    public List<ClassDto> getSubcategoryDatas(String sub_category){
		
		List<ClassDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from class where sub_category=? order by class_num desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sub_category);
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
    
    //강좌명 검색시 리스트
    public List<ClassDto> getSearchDatas(String class_name){
    	
        List<ClassDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from class where class_name like ? order by class_num desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+class_name+"%");
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
    
    //cart에 insert
    public void insertCart(CartDto dto) {
    	
    	Connection conn=db.getConnection();
    	PreparedStatement pstmt=null;
    	
    	String sql="insert into cart values(null,?,?,now())";
    	
    	try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getClass_num());
			pstmt.setString(2, dto.getUser_num());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
    }
    
    //장바구니 출력_해당 user_id가 장바구니에 담은 강의만 출력되도록
    public List<HashMap<String, String>> getCartList(String user_id){
    	
    	List<HashMap<String, String>> list=new ArrayList<>();
    	
    	Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select c.cart_num,s.class_name,s.class_num,s.class_image,s.class_price,c.cart_date "
				+ "from cart c,class s,member m "
				+ "where c.class_num=s.class_num and c.user_num=m.user_num and m.user_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				HashMap<String, String> map=new HashMap<>();
				
				map.put("cart_num", rs.getString("cart_num"));
				map.put("class_name", rs.getString("class_name"));
				map.put("class_num", rs.getString("class_num"));
				map.put("class_image", rs.getString("class_image"));
				map.put("class_price", rs.getString("class_price"));
				map.put("cart_date", rs.getString("cart_date"));
				
				list.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
    	
    	return list; 
    }
    
    //장바구니에서 체크한 상품 삭제
    public void deleteCart(String cart_num) {
    	
    	Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from cart where cart_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cart_num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
    }
    
}
