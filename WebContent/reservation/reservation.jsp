<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<style>
#reservation {
	font-size: 100%;
}
</style>
<script src="../js/main.js"></script>
<%
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
%>

<body>
	<!-- review화면과 worker화면을 한화면에 담으려고 각 각 include한 부분
	컨트롤러를 안써서 이번 프로젝트에서 뭔가 해보려다가 가장 큰 실수 한 부분
	이거 때문에 코드가 복잡하고 퍼포먼스가 굉장히 안좋아짐
	원래 include는 첫줄 menu만 계속 가져오려고 생각해냈던 것.... -->
	<%@include file="../menu.jsp"%>
	<br>
	<br>
	<br>
	
	<!-- worker화면과 review화면에 있는 값도 같이 insert해줘야하는 부분이 있어서 form택 안에 include 포함 -->
	<form action="insertreservation.jsp">
		<table align="center">
			<tr>
				<td width="100"></td>
				<td><%@include file="../worker/worker.jsp"%></td>
				<td width="100"></td>
				<td><%@include file="../review/review.jsp"%></td>
				<td width="100"></td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<input type="hidden" name="regnum" value="test">
					<input type="hidden" name="start" value="<%=request.getParameter("start")%>"> <!-- resdate -->
					<input type="hidden" name="end"	value="<%=request.getParameter("end")%>"> <!-- resdate -->
					<input type="hidden" name="type" value="<%=request.getParameter("type")%>">
					<input type="hidden" name="state" value="0">
					<table>
						<tr>
							<td>기타정보</td>
							<td><textarea rows="5" cols="40" name="etc"></textarea></td>
							<!-- 로그인 한 경우만 리뷰 입력 가능하도록 처리 -->
							<%
								if(session.getAttribute("id")==null){
							%><td><input type="submit" value="예약하기" id="reservation" disabled="disabled"></td><%									
								}else{
							%><td><input type="submit" value="예약하기" id="reservation"></td><%									
								}
							%>
						</tr>
					</table></td>
			</tr>
		</table>
	</form>
</body>
</html>