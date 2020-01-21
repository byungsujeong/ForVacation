<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='UTF-8'>

<head>
<meta charset='UTF-8' />
 <title>내 일정 검토</title>

<link rel="stylesheet" href="css/basic.css">
<link href='fullcalendar/core/main.css' rel='stylesheet' />
<link href='fullcalendar/daygrid/main.css' rel='stylesheet' />

<script src='fullcalendar/core/main.js'></script>
<script src='fullcalendar/interaction/main.js'></script>
<script src='fullcalendar/daygrid/main.js'></script>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<input type="hidden" id="mid" value="<%=session.getAttribute("id")%>">
<script>
    		var sessionid = $("#mid").val();
    		//alert($("#mid").val());
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
            	
                plugins: ['interaction', 'dayGrid'],
                selectable: true,
                header: {
                    left: 'prev,next today',
                    center: 'title', //연월
                    right: 'addEventButton'//일정 입력 버튼
                },
                customButtons: {
                    addEventButton: {
                      text: '휴무입력',
                      click: function() {
                        var dateStr = document.getElementById("start-date").value; //날짜 선택 후 값 가져오기
                        var date = new Date(dateStr + 'T00:00:00'); // will be in local time
                        var content = "휴무";
                    	  //해당 날짜 db존재 여부 확인 및 존재시 진행 거부 ajax 시작
                    	  $.ajax({
                    		  url: "1_2_RestCheck.jsp",
                    		  data:{
                    			  id : sessionid,
                    			  checkdate : dateStr
                    		  },
                    		  success: function(result) {
									if (result=="false") {	//선택일 일정 존재시 휴무입력 불가능
										alert("해당 날짜에 일정이 존재합니다. 다른날을 선택하세요.")
										return false;
									} else {	//선택일 일정 없을 시 휴무 입력 시작
                       					  if (!isNaN(date.valueOf())) { // valid?
                      					    calendar.addEvent({
                         					   title: content,
                       						     start: date, //선택한 날짜 가져와서 해당날짜에 추가됨
                      					      allDay: true //false시 반나절기입됨.
                          					}),
                        				  alert('Great. Now, update your database...');
                         				 //ajax db입력 라인
                          				 $.ajax({
                        					  url: "1_3_RestInsert.jsp",
                        					  data:{
                        						  id : sessionid, //세션 아이디 가져오기
                        						  checkdate : dateStr, //선택한 날짜
				                        		  content : content //
                        					  },
                        					  success: function(result) {
												alert("db저장 완료");
												//console.log(result);
											} //success:
                        			  }); //$.ajax
                         		 document.getElementById("start-date").value = null;
                        	  //db에 반영 어찌할까,
                        		}else {
                        		  alert('휴무일을 선택해주세요.');
                       			 } //else 날짜 선택 안했을시
								}	//선택일 일정 없을 시 휴무 입력 끝
							 } //restcheck success close
                    	  }); //ajax
                    	  //해당 날짜 db존재 여부 확인 및 존재시 진행 거부 ajax 끝
                        	
                      } //click: function()
                    } //addEventButton:
                  }, //customButtons:
                	  
                //날짜 클릭시 선택날짜 확인
                dateClick: function(info) { 
                    alert('clicked ' + info.dateStr);
                    document.getElementById("start-date").value = info.dateStr;
                	//document.getElementById("calendar-date").innerHTML = info.dateStr; //해당 날짜 가져오기
                	//해당 날짜 선택시 on/off 선택 -> off시 db에 1로 표기
              	  } 
                  //dateClick: function(info)
                
            }); //new FullCalendar.Calendar(calendarEl,
            calendar.render();
            
            //캘린더 db입력 코드 시작
            //json 전환하여 넣기
            $.ajax({
        		url: "http://localhost:8888/project2/1_4_CalendarList.jsp",
        		dataType: "json",
        		success: function(result) {	
							for(var i=0; i<$(result).length; i++){
								var content = result[i].content;
								var checkdate = result[i].checkdate; //date 형식?
								var date = new Date(checkdate + 'T00:00:00'); // will be in local time 변환
			        			 if (!isNaN(date.valueOf())) { // valid?
			               		 	calendar.addEvent({
			                  	 		title: content,
			                   			start: date, //선택한 날짜 가져와서 해당날짜에 추가됨
			                  	 		allDay: true //false시 반나절기입됨.
			                		})
								}
							}
        				}
             		}); //캘린더 db ajax
          //캘린더 db입력 코드 끝
        }); //('DOMContentLoaded', function()
    </script>
</head>

<body>
<%@include file="menu.jsp"%>
<br><br><br><br>

	<!-- 드래그 선택기능 kill and 휴무일 day by day 입력 -->
	<div id="calendar" style="width: 50%; height: 30%; float: left"></div>
	
	<div style="font-size: 25px; float: left">
		
		<div style="float: left">휴무일:</div>
		<div style="float: left">
			<input type="text" id="start-date">
		</div>
		
		<br>
		<!-- <div style="float: left">휴무 종료일:</div>
		<div style="float: left">
			<input type="text" id="end-date">
		</div> -->
	</div>
	

	<!-- ajax 사용 휴무여부 나타내기? -->
	<!-- ajax로 변경 확인 및 캘린더 반영 즉시 확인 -->
</body>

</html>