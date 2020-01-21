<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.UserDAO"%>
<%@page import="bean.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.WorkerBoardDTO"%>
<%@page import="bean.WorkerBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
#deleteReview{
	background: none;
	border: none;
	outline: none;
}
#deleteReview2{
	background: none;
	border: none;
	outline: none;
}
#dis2 {
	display: none;
}

#btn {
	background: none;
	border: none;
	outline: none;
	color: blue;
}

#btn:hover {
	text-decoration: underline;
}
</style>
<script src="../js/jquery-3.4.1.js"></script>
<script>
	$(
			/* 토글 버튼으로 리뷰 더보기 기능 정의 */
			function() {
				var flag = 1;
				$("#btn").on("click", function() {
					if(flag==1){
						$(this).html($(this).text().replace($("#btn").text(),'닫기'));
						flag=0;
					}else if(flag==0){
						$(this).html($(this).text().replace($("#btn").text(),'더보기'));
						flag=1;
					}
					$("#dis2").slideToggle("middle");
				});

				$(".radio")
						.click(
								/* 점수에 따라 별점 이미지로 출력 */
								function() {
									if ($(".radio:checked").val() == 1) {
										$("#rating")
												.html(
														"<img src = ../img/one.jpg width=200 height=36.27>");
									} else if ($(".radio:checked").val() == 2) {
										$("#rating")
												.html(
														"<img src = ../img/two.jpg width=200 height=36.27>");
									} else if ($(".radio:checked").val() == 3) {
										$("#rating")
												.html(
														"<img src = ../img/three.jpg width=200 height=36.27>");
									} else if ($(".radio:checked").val() == 4) {
										$("#rating")
												.html(
														"<img src = ../img/four.jpg width=200 height=36.27>");
									} else if ($(".radio:checked").val() == 5) {
										$("#rating").html("<img src = ../img/five.jpg width=200 height=36.27>");
									}
								})

				/* 리뷰 insert페이지에서 댓글 추가하는 js */
				$("#review").click(function() {
					var resnum = $("#regNum").val();
					var wnum = $("#wnum").val();
					var mid = $("#mid").val();
					var rating = $(".radio:checked").val();
					var wrcontent = $("#wrcontent").val();
					if (rating == null) {
						alert("평점을 선택해주세요!");
					} else {
						$.ajax({
							url : "../review/insertreview.jsp",
							type : 'POST',
							data : {
								resnum : resnum,
								wnum : wnum,
								mid : mid,
								rating : rating,
								wrcontent : wrcontent
							},
							success : function(result) {
								location.reload();
							}
						});
						
					}
										
				});
				/* 삭제버튼 클릭 시 delete를 실행하는 화면에서 처리 삭제 처리(기존 select로 뿌려준 부분) */
				$(document).on("click","#deleteReview",function() {
					
					var wrid = $(this).val();
						$.ajax({
							url : "../review/deleteReview.jsp",
							type : 'POST',
							data : {
								wrid : wrid
							},
							success : function(result) {
								console.log(result);
								if(result == 1){
									alert("본인 댓글이 아닙니다.");
								}else{
									location.reload();
								}
							}
						});	
					
						
										
				});
				/* 삭제버튼 클릭 시 delete를 실행하는 화면에서 처리 삭제 처리(새로 append 되는 부분) */
				$(document).on("click","#deleteReview2",function() {
					$(this).parent().parent().parent().remove();
					var wrid = $(this).val();
						$.ajax({
							url : "../review/deleteReview.jsp",
							type : 'POST',
							data : {
								wrid : wrid
							},
							success : function(result) {
								consoel.log(result);
							}
						});
										
				});
				
			})
</script>
<body>
<input type="hidden" name="mid" id="mid" value="<%=session.getAttribute("id")%>">
<%
	UserDTO userDTO3 = new UserDTO();
	UserDAO userDAO3 = new UserDAO();
	userDTO3.setMid((String)session.getAttribute("id"));
	userDAO3.check(userDTO3);
	int wnum3 = Integer.parseInt(request.getParameter("wnum"));
	WorkerBoardDTO workerBoardDTO3 = new WorkerBoardDTO();
	workerBoardDTO3.setWnum(wnum3);
	WorkerBoardDAO workerBoardDAO3 = new WorkerBoardDAO();
	workerBoardDAO3.selectRating(workerBoardDTO3);
	String avg = new DecimalFormat("0.0").format(workerBoardDTO3.getAvg());
%>
<input type="hidden" name="regNum" id="regNum" value="<%=userDTO3.getRegNum()%>">
<input type="hidden" name="wnum" id="wnum" value="<%=request.getParameter("wnum")%>">
	<table>
		<tr>
		<!-- 해당 인력의 별점 출력 -->
			<td colspan="2"><%=avg%><img src="../img/rating/<%=avg%>.jpg" width=200 height=36.27></td>
		</tr>
		<tr>
			<td colspan="2">
					<table>
						<tr>
						<!-- 로그인 후 리뷰 입력 할 수 있도록 조건 정의
						라디오 버튼으로 평점 부여하도록 정의  -->
							<%
								if(session.getAttribute("id")==null){
								%><td>리뷰 입력은 로그인 후 가능합니다.</td><%
								}else{
								%><td><input type="radio" name="rating" class="radio"
								value="1">1</td>
								<td><input type="radio" name="rating" class="radio"
								value="2">2</td>
								<td><input type="radio" name="rating" class="radio"
								value="3">3</td>
								<td><input type="radio" name="rating" class="radio"
								value="4">4</td>
								<td><input type="radio" name="rating" class="radio"
								value="5">5</td>
								<!-- 0점을 default -->
								<td id="rating"><img src="../img/zero.jpg" width="200"
								height="auto"></td><%
								}
							%>	
						</tr>
					</table>
			</td>
		</tr>
		<tr>
			<td>댓글입력</td>
			<td>
			<!-- 로그인 해야만 리뷰 작성 할 수 있도록 조건 정의 -->
			<%
				if(session.getAttribute("id")==null){
					%><textarea rows="5" cols="40" name="wrcontent" id="wrcontent" disabled="disabled"></textarea><%
				}else{
					%><textarea rows="5" cols="40" name="wrcontent" id="wrcontent"></textarea><%
				}
			%>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<!-- ajax로 리뷰 append -->
				<button id="review" type="button" onclick="">등록</button>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<hr color="red">
			</td>
		</tr>
		<tr>
		<!-- 리뷰 리스트 출력 -->
			<td colspan="2" height="300">
				<div style="width: 100%; height:100% ; overflow: auto;">
				<div id="dis"></div>
				<!-- 리스트 3개만 먼저 출력하고
				더보기 클릭 시 나머지 더 볼 수 있도록 화면 분활 -->
				<%@include file = "selectreview.jsp"%>
				<div id="dis2"><%@include file = "selectreview2.jsp"%></div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button id="btn" type="button">더보기</button>
			</td>
		</tr>
		
	</table>
</body>
</html>