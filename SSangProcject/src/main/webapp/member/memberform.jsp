<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/4f8084f592.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>memberform</title>
<script type="text/javascript">
	$(function() {
		
		//id중복체크
		$("#btncheck").click(function() {
			
			var id = $("#user_id").val();
			//alert(id);
			
			$.ajax({
				type:"get",
				url:"member/idcheck.jsp",
				dataType:"json",
				data:{"user_id":id},
				success:function(res) {
					console.log(res.count);
					
					if(res.count==1) {
						$("span.idsuccess").text('이미 사용중인 아이디입니다.');
						//$("#user_id").val(' ');
					}
					else {
						$("span.idsuccess").text('가입 가능한 아이디입니다.');
					}
				}
			});
		})
		
	});
	
	//비밀번호 체크
	function check(f) {
		
		if(f.user_pass.value!=f.user_pass2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			f.user_pass.value = "";
			f.user_pass2.value = "";
			return false;
		}
	}
	
</script>
</head>
<body>
	<div style="padding-left: 660px;">
		<h3 style="padding-left: 150px;"><b>회원가입</b></h3><br>
		<form action="member/memberadd.jsp" method="post" class="form-inline" onsubmit="return check(this)">
			<table class="table table-borderless" style="width: 500px; margin-left: 40px;">
				<tr>
					<th width="100">아이디</th>
				</tr>
				<tr>
					<td>
						<input type="text" name="user_id" id="user_id" class="form-control" required="required" style="width: 300px;">
						<button type="button" class="btn btn-success btn-sm" id="btncheck">중복체크</button><br>
						<span class="idsuccess" style="color: gray; margin-left: 10px;"></span>
					</td>				
				</tr>
				<tr>
					<th width="100">비밀번호</th>
				</tr>
				<tr>
					<td>
						<input type="text" name="user_pass" class="form-control" required="required" style="width: 300px; margin-bottom: 10px;" placeholder="비밀번호"><br>
						<input type="text" name="pass2" class="form-control" required="required" style="width: 300px;" placeholder="비밀번호확인">
					</td>
				</tr>
				<tr>
					<th width="100"><br>이름</th>
				</tr>
				<tr>
					<td>
						<input type="text" name="user_name" class="form-control" required="required" style="width: 300px;">
					</td>
				</tr>
				<tr>
					<th width="100"><br>휴대전화</th>
				</tr>
				<tr>
					<td>
						<input type="text" name="user_phone" class="form-control" required="required" style="width: 300px;">
					</td>
				</tr>
				<tr>
					<td>
						<br><b>지식공유자</b>&nbsp;
						<input class="form-check-input" type="checkbox" id="gong" name="gong" value="1">
					</td>
				</tr>
				<tr>
					<td>
						<br><b>멘토</b>&nbsp;
						<input class="form-check-input" type="checkbox" id="mentor" name="mentor" value="1">
					</td>
				</tr>
				<tr>
					<td>
						<br>
						<button type="submit" class="btn btn-success" style="width: 300px; height: 50px;">가입하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>