<%@page import="java.util.ArrayList"%>
<%@page import="bean.WorkerBoardDTO"%>
<%@page import="bean.WorkerBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int wnum1 = Integer.parseInt(request.getParameter("wnum"));
	WorkerBoardDTO workerBoardDTO = new WorkerBoardDTO();
	workerBoardDTO.setWnum(wnum1);
	WorkerBoardDAO workerBoardDAO = new WorkerBoardDAO();
	ArrayList<WorkerBoardDTO> list = workerBoardDAO.selectAll(workerBoardDTO);
%>

<table>
<!-- 리뷰 갯수가 3개보다 큰경우 3개까지만 출력 -->
	<%
		if (list.size() > 3) {
			for (int i = 0; i < 3; i++) {
				workerBoardDTO = list.get(i);
	%>
	<tr>
		<td width="64" style="word-break: break-all;"><%=workerBoardDTO.getMid()%></td>
		<td style="word-break: break-all;">
		<!-- 리뷰 출력 시 평점은 별점 이미지로 전환 -->
			<%
				if (workerBoardDTO.getRating() == 1) {
			%> <img src="../img/one.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 2) {
 %><img src="../img/two.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 3) {
 %><img src="../img/three.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 4) {
 %><img src="../img/four.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 5) {
 %><img src="../img/five.jpg" width=200 height=36.27> <%
 	}
 %>
		</td>
		<td>
			<button type="button" id="deleteReview" value="<%=workerBoardDTO.getWrid()%>"><img src="../img/x.png" width=20 height=20></button>
		</td>
	</tr>
	<tr>
		<td colspan="3" width="344" style="word-break: break-all;"><%=workerBoardDTO.getWrcontent()%></td>
	</tr>

	<tr>
		<td colspan="3"><hr></td>
	</tr>
	<%
		}
	/* 리뷰 갯수가 3개 이하일 경우 리뷰갯수만큼 다 출력 */
	} else {
		for (int i = 0; i < list.size(); i++) {
				workerBoardDTO = list.get(i);
	%>
	<tr>
		<td width="64" style="word-break: break-all;"><%=workerBoardDTO.getMid()%></td>
		<td style="word-break: break-all;">
			<%
				if (workerBoardDTO.getRating() == 1) {
			%> <img src="../img/one.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 2) {
 %><img src="../img/two.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 3) {
 %><img src="../img/three.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 4) {
 %><img src="../img/four.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO.getRating() == 5) {
 %><img src="../img/five.jpg" width=200 height=36.27> <%
 	}
 %>
		</td>
		<td>
			<button type="button" id="deleteReview" value="<%=workerBoardDTO.getWrid()%>"><img src="../img/x.png" width=20 height=20></button>
		</td>
	</tr>
	<tr>
		<td colspan="3" width="344" style="word-break: break-all;"><%=workerBoardDTO.getWrcontent()%></td>
	</tr>

	<tr>
		<td colspan="3"><hr></td>
	</tr>
	<%
		}
	}
	%>
</table>