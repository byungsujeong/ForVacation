
<%@page import="bean.WorkerBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="workerBoardDTO" class="bean.WorkerBoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="workerBoardDTO" />
<%
	WorkerBoardDAO workerBoardDAO = new WorkerBoardDAO();
	workerBoardDAO.insert(workerBoardDTO);
	workerBoardDAO.key(workerBoardDTO);
%>

<table>
<!-- insert실행하여 db로 데이터 추가 
ajax로 append 실행해야하므로 해당 화면에 결과 출력 -->
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
			<button type="button" id="deleteReview2" value="<%=workerBoardDTO.getWrid()%>"><img src="../img/x.png" width=20 height=20></button>
		</td>
	</tr>
	<tr>
		<td colspan="2" width="344" style="word-break: break-all;"><%=workerBoardDTO.getWrcontent()%></td>
	</tr>

	<tr>
		<td colspan="2"><hr></td>
	</tr>
</table>