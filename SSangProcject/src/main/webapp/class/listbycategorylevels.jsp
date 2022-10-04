<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="dto.ClassDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClassDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String category=request.getParameter("category");
String levels=request.getParameter("levels");

ClassDao dao=new ClassDao();
List<ClassDto> list=dao.getCategoryLevelsDatas(category, levels);

JSONArray arr=new JSONArray();
NumberFormat nf=NumberFormat.getCurrencyInstance();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

for(ClassDto dto:list){
	JSONObject ob=new JSONObject();
	
	ob.put("class_num", dto.getClass_num());
	ob.put("category", dto.getCategory());
	ob.put("sub_category", dto.getSub_category());
	ob.put("levels", dto.getLevels());
	ob.put("class_name", dto.getClass_name());
	ob.put("user_num", dto.getUser_num());
	ob.put("class_price", nf.format(dto.getClass_price()));
	ob.put("class_image", dto.getClass_image());
	ob.put("class_video", dto.getClass_video());
	ob.put("class_chu", dto.getClass_chu());
	ob.put("class_content", dto.getClass_content());
	ob.put("reg_date", sdf.format(dto.getReg_date()));
	
	arr.add(ob);
}
%>
<%=arr.toString()%>