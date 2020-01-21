<%@page import="java.util.ArrayList"%>
<%@page import="bean.WorkerBoardDTO"%>
<%@page import="bean.WorkerBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int wnum2 = Integer.parseInt(request.getParameter("wnum"));
	WorkerBoardDTO workerBoardDTO2 = new WorkerBoardDTO();
	workerBoardDTO2.setWnum(wnum2);
	WorkerBoardDAO workerBoardDAO2 = new WorkerBoardDAO();
	ArrayList<WorkerBoardDTO> list2 = workerBoardDAO2.selectAll(workerBoardDTO2);
%>

<table>
<!--댓글 갯수가 3개보다 많을 경우 나머지 댓글 출력  -->
	<%
	if (list2.size() > 3) {
		for (int i = 3; i < list2.size(); i++) {
			workerBoardDTO2 = list2.get(i);
	%>
	<tr>
		<td width="64" style="word-break: break-all;"><%=workerBoardDTO2.getMid()%></td>
		<td style="word-break: break-all;">
			<%
				if (workerBoardDTO2.getRating() == 1) {
			%> <img src="../img/one.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO2.getRating() == 2) {
 %><img src="../img/two.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO2.getRating() == 3) {
 %><img src="../img/three.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO2.getRating() == 4) {
 %><img src="../img/four.jpg" width=200 height=36.27> <%
 	} else if (workerBoardDTO2.getRating() == 5) {
 %><img src="../img/five.jpg" width=200 height=36.27> <%
 	}
 %>
		</td>
		<td>
			<button type="button" id="deleteReview" value="<%=workerBoardDTO2.getWrid()%>"><img src="../img/x.png" width=20 height=20></button>
		</td>
	</tr>
	<tr>
		<td colspan="3" width="344" style="word-break: break-all;"><%=workerBoardDTO2.getWrcontent()%></td>
	</tr>

	<tr>
		<td colspan="3"><hr></td>
	</tr>
	<%
		}
	}
	%>
</table>