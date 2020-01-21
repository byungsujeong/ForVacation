<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>예약정보확인</title>
<script src="js/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="css/basic.css">
<script src="js/jquery.form.js"></script>
<script>
//세션아이디 필요
	$(function() {
		//ajax, 예약요청내용 리스트 selectAll로 input, 테이블에 순서대로 넣기?-->sort 예약날짜(sql문)
			//예약요청내용 db입력 코드 시작
            //json 전환하여 넣기
            $.ajax({
        		url: "http://localhost:8080/Project_2nd/ReservationListFinal.jsp",
        		dataType: "html",
        		success: function(result) {	
        			result1=result.trim();
        			//console.log(result1);
						$("#reservationlist").append(result1);
						//console.log("append성공");
						}
             		}); //예약요청내용 db ajax
          //예약요청내용 db입력 코드 끝
		//예약요청 취소시 리스트 refresh???? -> dialog아래
		
		
		//dialog 사용 후 reservation-state 확인하여 movecalendarlist btn 상태 변경
	
	});//$(function(){});

	
</script>
</head>

<body>

	<table id="reservationlist" border="1">
		<tr class="header">
			<td>예약요청내역 확인</td>
		</tr>
		<!-- selectAll 결과 들어가는 곳 -->
	</table>

	<div style=float:left>
		<input id="movecalendarlist" type="button" onclick="location.href='1_1_test8.jsp'" value="휴무일 캘린더로">
		<!-- ajax, 예약상태 확인하여 value에 예약상태를 확인해주세요 및 disabled로 변경  -->
	</div>	

</body>

</html>
