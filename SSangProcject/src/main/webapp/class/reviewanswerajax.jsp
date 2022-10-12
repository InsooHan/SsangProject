<%@page import="dto.ReviewAnswerDto"%>
<%@page import="dao.ReviewAnswerDao"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
String review_num = request.getParameter("review_num");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
ReviewAnswerDao dao = new ReviewAnswerDao();
ReviewAnswerDto dto = dao.getranswer(review_num);
MemberDao mdao = new MemberDao();
String gongname = mdao.getGongname(dto.getUser_num());
 System.out.print(review_num);
	JSONObject ob = new JSONObject();
	ob.put("ans_num", dto.getAns_num());
	ob.put("review_num",dto.getReview_num());
	ob.put("gongname",gongname);
	ob.put("ans_content",dto.getAns_content());
	ob.put("ans_chu", dto.getAns_chu());
	//ob.put("reg_date", sdf.format(dto.getReg_date()));
	
%>
<%=ob.toString()%>