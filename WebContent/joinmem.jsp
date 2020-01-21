<%@page import="bean.UserDAO"%>
<%@page import="bean.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="userDTO" class="bean.UserDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="userDTO"/>
	<%
		UserDAO userDAO = new UserDAO();
		userDAO.insert(userDTO);
		
		response.sendRedirect("main.jsp");
	%>

</body>
</html>