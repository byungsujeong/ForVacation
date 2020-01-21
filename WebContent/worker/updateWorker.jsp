<%@page import="bean.WorkerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 수정 데이터 받아서 update문 실행 처리 -->
<jsp:useBean id="workerDTO" class="bean.WorkerDTO"></jsp:useBean>
<jsp:setProperty property="*" name="workerDTO"/>

	<%
		WorkerDAO workerDAO = new WorkerDAO();
		workerDAO.update(workerDTO);
		
		/* update처리 후 main으로 redirect 하는 부분
		원래는 servlet으로 컨트롤러 구성했어야 하는 부분 */		
		response.sendRedirect("../main.jsp");
	%>
	
</body>
</html>