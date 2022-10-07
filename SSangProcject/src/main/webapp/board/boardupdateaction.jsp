<%@page import="dao.BoardDao"%>
<%@page import="dto.BoardDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
String board_id=(String)session.getAttribute("myid");

String realPath=getServletContext().getRealPath("/save");

System.out.println(realPath);

int uploadSize=1024*1024*4;//4mb

BoardDao dao=new BoardDao();
MultipartRequest multi=null;

try{
multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());

String board_num=multi.getParameter("num");

//request가 아닌 멀티로 폼데이타 읽어와야함
String board_content=multi.getParameter("content");
String board_photo=multi.getFilesystemName("photo");
//페이지 번호 가져오기
String currentPage=multi.getParameter("currentPage");

//기존의 포토명 가져오기
String old_board_photo=dao.getData(board_num).getBoard_photo();

//dto저장
BoardDto dto=new BoardDto();

dto.setBoard_content(board_content);
dto.setBoard_num(board_num);
//dto.setBoard_photo(board_photo);
//사진 선택을 안할경우 기존의 사진으로 저장
dto.setBoard_photo(board_photo==null?old_board_photo:board_photo);


dao.updateBoard(dto);

//System.out.print(realPath);

//수정한 페이지로 이동

}catch(Exception e){
	System.out.println("업로드 오류:"+ e.getMessage());
};
%>
</body>
</html>