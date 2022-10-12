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
    pageEncoding="UTF-8" %>
    
  
<%
request.setCharacterEncoding("utf-8");

String cont = request.getParameter("anscont");
String id = (String)(session.getAttribute("id"));
int num = Integer.parseInt(request.getParameter("num"));
int qnum = Integer.parseInt(request.getParameter("qnum"));

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
String sql = "insert into CommentDto(comm_writer,comm_content,comm_datetime,ans_num) values(?,?,now(),?)";
try{
	pt = conn.prepareStatement(sql);
	pt.setString(1, id);
	pt.setString(2, cont);
	pt.setInt(3, num);
	pt.executeUpdate();
	
}catch(SQLException e){
	e.printStackTrace();
}

response.sendRedirect("qusan_listdetail.jsp?num="+qnum);
%>