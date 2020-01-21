<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Bootstrap 4, from LayoutIt!</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- Datepicker -->
<script src="js/main.js"></script>
<script src="js/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
</head>
<body>
	<%@include file="menu.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6" align="center">
				<form action="search.jsp">
					<p>
						시작날짜 : <input type="text" class="datepicker2" id="startdate"
							name="start" autocomplete="off">
					</p>
					<p>~</p>
					<p>
						종료날짜 : <input type="text" class="datepicker2" id="enddate"
							name="end" autocomplete="off">
					</p>
					<p>
						업종 : <select name="type" id="datepicker">
							<option class="form-control mr-sm-2" value="">업종</option>
							<option class="form-control mr-sm-2" value="cafe">카페</option>
							<option class="form-control mr-sm-2" value="factory">피시방</option>
							<option class="form-control mr-sm-2" value="design">서점</option>
						</select>
					</p>
					&nbsp;
					<p>
						지역 : <input type="text" id="address1" name="address1"> <input
							type="text" id="address2" name="address2" value="전체">
					<p>
						<input class="btn btn-primary my-2 my-sm-0" type="submit"
							id="search" value="검색">
					</p>
				</form>

			</div>
			<div class="col-md-6">
				<div class="carousel slide" id="carousel-370605">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-370605"
							class="active"></li>
						<li data-slide-to="1" data-target="#carousel-370605"></li>
						<li data-slide-to="2" data-target="#carousel-370605"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" alt="Carousel Bootstrap First"
								src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg">
							<div class="carousel-caption">
								<h4>핳</h4>
								<p>핳</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Second"
								src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg">
							<div class="carousel-caption">
								<h4>핳</h4>
								<p>핳</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Third"
								src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg">
							<div class="carousel-caption">
								<h4>핳</h4>
								<p>핳</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-370605"
						data-slide="prev"><span class="carousel-control-prev-icon"></span>
						<span class="sr-only">Previous</span></a> <a
						class="carousel-control-next" href="#carousel-370605"
						data-slide="next"><span class="carousel-control-next-icon"></span>
						<span class="sr-only">Next</span></a>
				</div>
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
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
