<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.WorkerBoardDAO"%>
<%@page import="bean.WorkerBoardDTO"%>
<%@page import="bean.WorkerDTO"%>
<%@page import="bean.MemberDTO"%>
<%@page import="bean.WorkerDAO"%>
<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 직원번호 wnum 받아서 결과 출력하는 화면 -->
<%	
	int wnum = Integer.parseInt(request.getParameter("wnum"));
	WorkerDTO workerDTO = new WorkerDTO();
	workerDTO.setWnum(wnum);
	WorkerDAO workerDAO = new WorkerDAO();
	workerDAO.select(workerDTO);
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO memberDTO = new MemberDTO();
	memberDTO.setMid(workerDTO.getMid());
	memberDAO.select(memberDTO);
	/* WorkerBoardDTO workerBoardDTO3 = new WorkerBoardDTO();
	workerBoardDTO3.setWnum(wnum);
	WorkerBoardDAO workerBoardDAO3 = new WorkerBoardDAO();
	workerBoardDAO3.selectRating(workerBoardDTO3);
	String avg = new DecimalFormat("0.0").format(workerBoardDTO3.getAvg()); */
	
%>

<input type="hidden" name="wnum" id="wnum" value="<%=workerDTO.getWnum()%>">

	<table>
		<tr>
			<td colspan="2"><img src="../img/worker/worker1.jpg" width="250" height="250"></td>
		</tr>
		<tr>
			<td><%=memberDTO.getName()%></td>
			<%-- <td><%=avg%></td> --%>
		</tr>
		<%-- <tr>
			<td><img src="../img/rating/<%=avg%>.jpg" width=200 height=36.27></td>
		</tr> --%>
		<tr>
			<td colspan="2"><hr></td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:bold;">경력사항</td>
		</tr>
		<tr>
			<td style="font-weight:bold;">업종</td>
			<td><%=workerDTO.getType1()%></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">기간</td>
			<td><%=workerDTO.getPeriod1()%>개월</td>
		</tr>
		<%if(workerDTO.getType2()!=null){%>
		<tr>
			<td style="font-weight:bold;">업종</td>
			<td><%=workerDTO.getType2()%></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">기간</td>
			<td><%=workerDTO.getPeriod2()%>개월</td>
		</tr>
		<%}%>
		<%if(workerDTO.getType3()!=null){%>
		<tr>
			<td style="font-weight:bold;">업종</td>
			<td><%=workerDTO.getType3()%></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">기간</td>
			<td><%=workerDTO.getPeriod3()%>개월</td>
		</tr>
		<%}%>
		<tr>
			<td colspan="2"><hr></td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:bold;">근무가능지역</td>
		</tr>
		<tr>
			<td style="font-weight:bold;">시/군</td>
			<td><%=workerDTO.getAddress1()%></td>
		</tr>
		<tr>
			<td style="font-weight:bold;">구/읍/면</td>
			<td><%=workerDTO.getAddress2()%></td>
		</tr>
		<tr>
			<td colspan="2"><hr></td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight:bold;">소개</tr>
		<tr>
		<tr>
			<td colspan="2"><%=workerDTO.getWcontent()%></tr>
		<tr>
	</table>

</body>
</html>