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
	String mid = request.getParameter("id");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO();
	dao.delete(mid);
	

	


	
	
	%>


</body>
</html>