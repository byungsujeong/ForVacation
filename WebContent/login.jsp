<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
input[type="submit"] {
	background: #79AAFF;
	width: 250px;
	height: 30px;
}
</style>

<script src="js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		var count = 0;
		
		$("#pw").keyup(function() {
			var idValue = $("#id").val();
			var pwValue = $("#pw").val();
			$.ajax({
				url : "logincheck.jsp",
				data : {
					id : idValue,
					pw : pwValue
					
				},
				success : function(result) {
					count = result;

				}
			});
		});

		
		$("#login").click(function() {
			if(count == 0){
				$("#logincheck").html("<font color = red>아이디 또는 비밀번호를 확인해주세요.</font>");
				return false;
			}
		});
	});

</script>
</head>

<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<table align="center">
		<tr>
			<td><img src="img/login.jpg"></td>
			<td>
				<table align="center">
					<form action = "main.jsp" method="post">
						<!-- 데이터 전송 -->
						<tr>
							<td align="right">ID</td>
							<td><input type="text" name="id" id="id"></td>
						</tr>
						<tr>
							<td align="right">Password</td>
							<td><input type="password" name="pw" id="pw"></td>
						</tr>
						<tr>
							<td></td>
                    		<td id="logincheck"></td>
               			</tr>
						<tr>
							<td><br /></td>
							<td><br /></td>
						</tr>
						<tr align="center">
							<td colspan="2"><input class="login" type="submit" id = "login" name = "login"
								value="로그인"></td>
						</tr>

					</form>
				</table>
			</td>
		</tr>
	</table>
	<br />
	<p style="text-align: center; margin: 0">
		<a href="">아이디를 잊으셨나요?</a><br /> <a href="">비밀번호를 잊으셨나요?</a><br /> <a
			href="">메인화면으로</a><br />
	</p>

</body>

</html>