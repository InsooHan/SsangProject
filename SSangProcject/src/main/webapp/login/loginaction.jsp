<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String id = request.getParameter("user_id");
	String pass = request.getParameter("user_pass");
	String cbsave = request.getParameter("cbsave");
	
	MemberDao dao = new MemberDao();
	boolean b = dao.isIdPass(id, pass);
	
	//아이디와 비밀번호가 맞으면 3개의 세션을 저장
	//로그인메인으로 이동
	if(b) {
		session.setMaxInactiveInterval(60*60*8);
		session.setAttribute("loginok", "yes");
		session.setAttribute("myid", id);
		session.setAttribute("saveok", cbsave==null?null:"yes");
		
		//로그인메인으로 이동
		response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
	}
	else {%>
		<script type="text/javascript">
			alert("아이디 또는 비밀번호가 맞지 않습니다.");
			history.back();
		</script>
	<%}
%>