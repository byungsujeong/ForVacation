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
<!-- delete처리 진행 -->
	<%
		WorkerDTO workerDTO = new WorkerDTO();
		WorkerDAO workerDAO = new WorkerDAO();
		workerDTO.setWnum(Integer.parseInt(request.getParameter("wnum")));
		workerDAO.delete(workerDTO);
		/* delete처리 후 main으로 redirect 하는 부분
		원래는 servlet으로 컨트롤러 구성했어야 하는 부분 */		
		response.sendRedirect("../main.jsp");
	%>
	
</body>
</html>