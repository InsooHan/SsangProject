<%@page import="dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
String class_num = request.getParameter("class_num");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
ReviewDao dao = new ReviewDao();
List<ReviewDto> list = dao.getAllReviewRecent(class_num);
JSONArray arr = new JSONArray();
MemberDao mdao = new MemberDao();
for(ReviewDto dto:list){
	JSONObject ob = new JSONObject();
	String name = mdao.getNamenum(dto.getUser_num());
	ob.put("review_num", dto.getReview_num());
	ob.put("class_num",dto.getClass_num());
	ob.put("name",name);
	ob.put("review_content",dto.getReview_content());
	ob.put("reviewstar", dto.getReviewstar());
	ob.put("reg_date",sdf.format(dto.getReg_date()));
	ob.put("review_chu", dto.getReview_chu());
	arr.add(ob);
}
%>
<%=arr.toString()%>