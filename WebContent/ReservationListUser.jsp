<%@page import="bean.ReservationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ReservationListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="css/basic.css">
<script src="js/jquery-3.4.1.js"></script>
<%String regnum= (String)request.getParameter("regnum"); %>
<input type="hidden" id="regnum" value="<%=regnum%>">	

<script>
	$(function() {
	
		var regnum =$("#regnum").val();		
	<%
		//int wnum= Integer.parseInt(request.getParameter("wnum"));
//		String id = request.getParameter("id"); 세션아이디
		ReservationDTO dto = new ReservationDTO();
		dto.setRegnum(regnum);
		ReservationListDAO dao = new ReservationListDAO();
		ArrayList<ReservationDTO> list = dao.selectAllU(dto);
		//	select 사용하여 세션id해당 data 모두 list화 하여 넘겨주기
		//id를 가지고 dao.select(dto) 실행

	%>
		for (var i = 0; i < <%=list.size()%>; i++) {
		var check = $("#statecheck"+i).text();
		
		if (check=="0") {
		$("#append"+i).append("<button class='statechange' id='stateaccept' disabled='true'>예약대기중"+"</button>");
		}else if(check=="1"){
		$("#append"+i).append("<button class='statechange' id='stateaccept' disabled='true'>예약확정됨"+"</button>");
		}else{
		$("#append"+i).append("<button class='statechange' id='stateaccept' disabled='true'>예약취소됨"+"</button>");
		}//if
		
		}//for
		
		
		
	
	
	
	
	});
</script>
<%@include file="menu.jsp"%>
<br><br><br><br>
<div>
<table id="reservationlist" border="1" align="center">
<tr>
			<td>예약번호 <!-- (클릭 시 일꾼/사업자 정보창 이동) -->
			</td>
			<td>사업자번호 <!-- (클릭 시 사업자 정보 이동) -->
			</td>
			<td>예약날짜</td>
			<td>업종</td>
			<td>예약요청시간</td>
			<td>기타</td>
			<td colspan="2">현 상태 출력<!--(예약 확인 대기/예약확정등)  (버튼누르면 alert? confirm 출력하여 해당 버튼값으로 상태 출력) -->
			</td>
		</tr>
		<%
		//for문으로 selectAll table생성
		if(list.size()>0){
			for(int i=0; i<list.size(); i++){ 
		%>
			<tr class="reservationvalue">
				<td><%=list.get(i).getResnum()%></td>
				<td><%=list.get(i).getRegnum()%></td>
				<td><%=list.get(i).getResdate()%></td>
				<td><%=list.get(i).getType()%></td>
				<td><%=list.get(i).getKdate()%></td>
				<td><%=list.get(i).getEtc()%></td>
				<td id = "statecheck<%=i%>"><%=list.get(i).getState() %></td>
				<td id="append<%=i%>"></td>
			</tr>
		<%
		}//for
			//list에 값이 없을 경우 table에 예약내역 없음 출력
		}else{ %>
			<tr>
			<td colspan="8">예약내역이 존재하지 않습니다.</td>
			</tr>
		<%
		}//if
		%>
		</table>
</div>
<div style=float:left>
		<input id="movemain" type="button" onclick="location.href='main.jsp'" value="홈으로">
		<!-- ajax, 예약상태 확인하여 value에 예약상태를 확인해주세요 및 disabled로 변경  -->
</div>
<br><br><br><br>