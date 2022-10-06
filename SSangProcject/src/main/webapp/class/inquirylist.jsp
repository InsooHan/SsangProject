<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="dto.InquiryDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.InquiryDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
String class_num = request.getParameter("class_num");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
InquiryDao dao = new InquiryDao();
List<InquiryDto> list = dao.getAllInquiry(class_num);
JSONArray arr = new JSONArray();
for(InquiryDto dto:list){
	JSONObject ob = new JSONObject();
	ob.put("inquiry_num", dto.getInquiry_num());
	ob.put("user_num", dto.getUser_num());
	ob.put("class_num",dto.getClass_num());
	ob.put("inquiry_content",dto.getInquiry_content());
	ob.put("reg_date",sdf.format(dto.getReg_date()));
	arr.add(ob);
}
%>
<%=arr.toString()%>