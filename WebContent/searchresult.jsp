<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/result.bootstrap.min.css" rel="stylesheet">
<link href="css/result.style.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel=StyleSheet href='css/calendar.css' type=text/css title=style>
<!-- Datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- Datepicker -->
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/jquery-3.4.1.js"></script>
<script>
	$(function() {
		var list1 = [];
		var list2 = [];

		$("#address1").focus(function() {

			$.ajax({

				url : "selectregworker.jsp",
				dataType : "json",
				success : function(result) {
					for (var i = 0; i < result.length; i++) {
						list1[i] = result[i];
					}
				}

			});

		});

		$("#address2").focus(function() {
			var address1 = $("#address1").val();

			$.ajax({

				url : "selectregworker2.jsp",
				dataType : "json",
				data : {
					address1 : address1
				},
				success : function(result) {
					for (var i = 0; i < result.length; i++) {
						list2[i] = result[i];
					}
				}

			});

		});

		$("#address1").autocomplete({
			source : list1
		});
		$("#address2").autocomplete({
			source : list2
		});
	});
</script>
<style>
select {
	width: auto;
	height: auto;
	text-indent: 0;
	white-space: normal;
	padding: .4em 1em;
}
</style>
</head>

<body>
	<%@include file="menu.jsp"%>
	<br />
	<br />
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<form action="search.jsp" class="form-inline">
					<p>
						시작날짜 : <input type="text" class="datepicker2" id="startdate"
							name="start" value="${start}" autocomplete="off">
					</p>
					<p>~</p>
					<p>
						종료날짜 : <input type="text" class="datepicker2" id="enddate"
							name="end" value="${end}" autocomplete="off">
					</p>
					<p>
						업종 : <select name="type" id="datepicker">
							<option class="form-control mr-sm-2" value="cafe"
								<%if ("${type}".equals("cafe")) {%> selected <%}%>>카페</option>
							<option class="form-control mr-sm-2" value="factory"
								<%if ("${type}".equals("factory")) {%> selected <%}%>>피시방</option>
							<option class="form-control mr-sm-2"
								value="design <%if ("${type}".equals("design")) {%>selected<%}%>">서점</option>
						</select>
					</p>
					&nbsp;
					<p>
						지역 :<input type="text" id="address1" name="address1"
							value="${address1}"> <input type="text" id="address2"
							name="address2" value="${address2}">
					<p>
						<input class="btn btn-primary my-2 my-sm-0" type="submit"
							id="search" value="검색">
					</p>
				</form>
			</div>
		</div>
		<br />
		<hr>
		<br />

		<div class="row">
			<c:forEach items="${namelist}" var="dto2">
			<p>${dto2.name}</p>
			</c:forEach>
			<c:forEach items="${list}" var="dto">
				<div class="col-md-4">
					<h2>
						<div class="col-md-12">
							<img alt="Bootstrap Image Preview" src="${dto.image}"
								class="rounded-circle" width="300" height="300">
						</div>
					</h2>
					<p>
					<form action="reservation/reservation.jsp" method="post">
						<input type="hidden" name="wnum" value="${dto.wnum}"> <input
							type="hidden" name="start" value="${start}"> <input
							type="hidden" name="end" value="${end}"> <input
							type="hidden" name="type" value="${type}"> <input
							type="hidden" name="address1" value="${address1}"> <input
							type="hidden" name="address2" value="${address2}"> <input
							class="btn" type="submit" value="예약하기 »">
					</form>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="js/result.jquery.min.js"></script>
	<script src="js/result.bootstrap.min.js"></script>
	<script src="js/result.scripts.js"></script>
	<script language="JavaScript1.2" src="js/calendar.js"></script>
	<script language="JavaScript1.2" src="js/data.js"></script>
	<!-- Datepicker -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- Datepicker -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- Datepicker -->
	<script>
		$(function() {
			$(".datepicker2").datepicker({
				dateFormat : 'yy-mm-dd'
			});
		});
	</script>
</body>

</html>