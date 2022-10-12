<%@page import="dto.QusAnsAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.QusAnsAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.QusAnsDto"%>
<%@page import="dao.QusAnsDao"%>
<%@page import="db.DbConnect"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>

<%
request.setCharacterEncoding("utf-8");

String cont = request.getParameter("anscont");
String id = request.getParameter("id");
int num = Integer.parseInt(request.getParameter("num"));


Connection conn=null;
PreparedStatement pt=null;
ResultSet rs=null;
DbConnect db = new DbConnect();
try{
Class.forName("com.mysql.cj.jdbc.Driver");
conn = db.getConnection();
}catch(Exception e){
e.printStackTrace();
}

String sql = "insert into Answer2Dto(ans_id,ans_content,reg_datetime,que_num) values(?,?,now(),?)";
try{
	pt = conn.prepareStatement(sql);
	pt.setString(1, id);
	pt.setString(2, cont);
	pt.setInt(3, num);
	pt.executeUpdate();
	
}catch(SQLException e){
	e.printStackTrace();
}

response.sendRedirect("qusan_listdetail.jsp?num="+num);
%>