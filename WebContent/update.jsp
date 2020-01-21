<%@page import="java.util.ArrayList"%>
<%@page import="bean.MemberDTO"%>
<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="js/main.js"></script>
</head>
<body>


	<%
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String mid = request.getParameter("id");
	String pw = request.getParameter("pw2");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO();
	dao.update(pw, name, gender, email, tel, mid);
	

	


	
	
	%>
		<h1>정보수정이 완료되었습니다. 감사합니다.</h1>
	<button type="button" onclick = "main()">홈으로</button>

</body>
</html>