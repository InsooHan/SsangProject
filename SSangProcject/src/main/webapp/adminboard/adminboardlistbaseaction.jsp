<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="dto.AdminboardDto"%>
<%@page import="dao.AdminboardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
AdminboardDao dao=new AdminboardDao();


//변수
int totalCount;
int totalPage;
int startPage;
int endPage;
int start;
int perPage=5;
int perBlock=5;
int currentPage;
int no;


totalCount=dao.getTotalCount();

if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;

if(endPage>totalPage)
	endPage=totalPage;

start=(currentPage-1)*perPage;


//검색 내용 추가 필요
//String searchtool=request.getParameter("searchtool");
//
//if(searchtool==null){
//	List<AdminboardDto> list=dao.getlistsearch(start, perPage, "");
//}else{
//	List<AdminboardDto> list=dao.getlistsearch(start, perPage, searchtool);
//}


//List<AdminboardDto> list=dao.getlist(start, perPage);

no=totalCount-(currentPage-1)*perPage;

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");









//int start=Integer.parseInt(request.getParameter("start"));
//int perpage=Integer.parseInt(request.getParameter("perpage"));
//String searchtool=request.getParameter("searchtool");


List<AdminboardDto> list=dao.getpagelist(start, perPage);
//List<AdminboardDto> list=dao.getlistsearch(start, perpage, searchtool);

JSONArray arr=new JSONArray();

for(AdminboardDto dto:list)
{
	JSONObject ob=new JSONObject();
	
	ob.put("ab_num", dto.getAb_num());
	ob.put("ad_id", dto.getAd_id());
	ob.put("ad_subject",dto.getAd_subject());
	ob.put("ad_content", dto.getAd_content());
	ob.put("ad_image", dto.getAd_image());
	ob.put("ad_date", sdf.format(dto.getAd_date()));
	
	arr.add(ob);
}

%>
<%=arr.toString()%>