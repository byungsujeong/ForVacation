<%@page import="bean.UserDAO"%>
<%@page import="bean.UserDTO"%>
<%@page import="bean.WorkerDAO"%>
<%@page import="bean.WorkerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		UserDTO userDTO = new UserDTO();
		UserDAO userDAO = new UserDAO();
		userDTO.setRegNum(request.getParameter("regNum"));
		userDAO.delete(userDTO);
		
		response.sendRedirect("main.jsp");
	%>
	
</body>
</html>