<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>Insert title here</title>
<style type="text/css">
.kakao{
  background: #fef01b; width: 130px; height: 40px; 
  border-radius: 10px;
}
</style>
<script type="text/javascript">
//카카오로그인
Kakao.init('16c0dc3170eb474e82300752331aef0a'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단

//카카오 로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response);
        	location.href="<%=request.getContextPath()%>/index.jsp";
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
</head>
<body>
<div style="margin-left: 100px; margin-top: 50px;">
		<br><br>
		<b>카카오님, 로그인하셨습니다.</b><br><br>
		<button type="button" class="kakao" onclick="kakaoLogout()">
        <a href="javascript:void(0)" style="color: black;"><span>카카오 로그아웃</span></a></button>
	</div>
</body>
</html>