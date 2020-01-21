<%@page import="bean.ReservationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ReservationListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="css/basic.css">
<script src="js/jquery-3.4.1.js"></script>
<%int wnum= Integer.parseInt(request.getParameter("wnum")); %>
<input type="hidden" id="wnum" value="<%=wnum%>">	

<script>
	$(function() {
	
		var wnum =$("#wnum").val();		
	<%
		//int wnum= Integer.parseInt(request.getParameter("wnum"));
//		String id = request.getParameter("id"); 세션아이디
		ReservationDTO dto = new ReservationDTO();
		dto.setWnum(wnum);
		ReservationListDAO dao = new ReservationListDAO();
		ArrayList<ReservationDTO> list = dao.selectAll(dto);
		//	select 사용하여 세션id해당 data 모두 list화 하여 넘겨주기
		//id를 가지고 dao.select(dto) 실행

	%>
		for (var i = 0; i < <%=list.size()%>; i++) {
		var check = $("#statecheck"+i).text();
		
		if (check=="0") {
		$("#append"+i).append("<button class='statechange' id='stateaccept'>예약확정"+"</button>");
		$("#append"+i).append("<button class='statechange' id='staterefuse'>예약취소"+"</button>");
		}else if(check=="1"){
		$("#append"+i).append("<button class='statechange' id='stateaccept' disabled='true'>예약확정됨"+"</button>");
		}else{
		$("#append"+i).append("<button class='statechange' id='stateaccept' disabled='true'>예약취소됨"+"</button>");
		}//if
		
		}//for
		
		
		
	//state 상태에 따른 버튼 변경... 해야함
	 //confirm accept
	$(".reservationvalue").on("click","#stateaccept", function() {
		//$("#reservation-confirm").click(function(){
		//console.log("accept click");
		//예약상태 변경 버튼
		//alert("컨펌창을 띄우자");
		var acceptcheck = confirm("예약을 수락하시겠습니까?");
		if (acceptcheck) {
			//예약수락
			//테이블 값 받기 실행
			console.log("accept 완료");
			
			//버튼 누를시 테이블 값 받기
 			//$("#stateaccept").click(function(){ 
				console.log("값 받기 버튼 눌렀다");
				var tdArr = new Array();	// 배열 선언
				var checkBtn = $(this);
				// checkBtn.parent() : checkBtn의 부모는 <td>이다.
				// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkBtn.parent().parent();
				var td = tr.children();
		
				console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
				var reserveNum = td.eq(0).text();
				var regNum = td.eq(1).text();
				var reserveDate = td.eq(2).text();
				var type1 = td.eq(3).text();
				var Kdate = td.eq(4).text();
				var address1 = td.eq(5).text();
				var state = 1;
				//ajax로 버튼값에 따라 전송장소 변경
				 $.ajax({
					url: "ReservationAceept.jsp",
					data:{
						wnum : wnum,
						resnum : reserveNum,
						regNum : regNum,
						reserveDate : reserveDate,
						type1 : type1,
						Kdate : Kdate,
						state : state
						},
						success: function(result){
							location.reload();	
						}//success
			});//ajax 
				alert("값 가져오기 성공 예약확정 ㄱㄱ");
		
			//});
			//버튼 누를시 테이블 값 받기
	
		}else{
			//예약수락취소
			return false;
		}
		//컨펌창 이용 true false
	});//click
	//confirm accept
	
	
	 //confirm refuse
	$(".reservationvalue").on("click","#staterefuse", function() {
		//$("#reservation-confirm").click(function(){
		//console.log("refuse click");
		//예약상태 변경 버튼
		//alert("컨펌창을 띄우자");
		var refusecheck = confirm("예약을 거절하시겠습니까?");
		if (refusecheck) {
			//예약거절
			console.log("refuse 완료");
			//버튼 누를시 테이블 값 받기
 			//$("#stateaccept").click(function(){ 
				console.log("값 받기 버튼 눌렀다");
				var tdArr = new Array();	// 배열 선언
				var checkBtn = $(this);
				// checkBtn.parent() : checkBtn의 부모는 <td>이다.
				// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkBtn.parent().parent();
				var td = tr.children();
		
				console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
				var reserveNum = td.eq(0).text();
				var regNum = td.eq(1).text();
				var reserveDate = td.eq(2).text();
				var type1 = td.eq(3).text();
				var Kdate = td.eq(4).text();
				var address1 = td.eq(5).text();
				var state = -1;
		
				//ajax로 버튼값에 따라 전송장소 변경
				 $.ajax({
					url: "ReservationRefuse.jsp",
					data:{
						wnum : wnum,
						resnum : reserveNum,
						regNum : regNum,
						reserveDate : reserveDate,
						type1 : type1,
						Kdate : Kdate,
						state : state
						},
						success: function(result){
							location.reload();
						}//success
			});//ajax 
				alert("값 가져오기 성공 예약확정 ㄱㄱ");
		
			//});
			//버튼 누를시 테이블 값 받기
			
		}else{
			//예약거절취소
			return false;
		}
		//컨펌창 이용 true false
	});//click
	//confirm refuse
	
	
	
	
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
<br><br>
<table align="center">
	<tr>
		<td>
			<input id="movecalendarlist" type="button" onclick="location.href='1_1_test8.jsp'" value="휴무일 캘린더로">
			<!-- ajax, 예약상태 확인하여 value에 예약상태를 확인해주세요 및 disabled로 변경  -->
		</td>
	</tr>
</table>
<br><br><br><br>