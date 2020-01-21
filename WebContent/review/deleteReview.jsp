<%@page import="bean.WorkerBoardDAO"%>
<%@page import="bean.WorkerBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	/* delete실행하는 화면 */
		WorkerBoardDTO workerBoardDTO = new WorkerBoardDTO();
		WorkerBoardDAO workerBoardDAO = new WorkerBoardDAO();
		workerBoardDTO.setWrid(Integer.parseInt(request.getParameter("wrid")));
		workerBoardDAO.select(workerBoardDTO);

		if(session.getAttribute("id").equals(workerBoardDTO.getMid())){
			workerBoardDAO.delete(workerBoardDTO);
		}else{
			out.print(1);
		}			
	%>