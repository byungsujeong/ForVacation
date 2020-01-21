<%@page import="bean.WorkerDAO"%>
<%@page import="bean.WorkerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.AddressDAO"%>
<%@page import="bean.AddressDTO"%>
<%@page import="bean.WorkerBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 본인 정보 확인하는 select출력하는 부분
등록하는 화면과 동일하게 autocomplete api 활용
update / delete 버튼 외 모두 동일 -->
<%
	WorkerDTO workerDTO = new WorkerDTO();
	WorkerDAO workerDAO = new WorkerDAO();
	workerDTO.setMid((String) session.getAttribute("id"));
	workerDAO.check(workerDTO);
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#regworker {
	margin: 0 auto;
	width: 330px;
	height: auto;
}

#reg {
	width: 150px;
	height: 30px;
}

#reg2 {
	color: black;
	background: gainsboro;
	border: 1px solid;
	border-color: gray;
	outline: 1;
	text-decoration: none;
	padding-left: 55px;
	padding-right: 55px;
	padding-top: 3px;
	padding-bottom: 3px;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="../js/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../js/main.js"></script>
<script src="../js/jquery.form.js"></script>
<script src="../js/jquery-ui.js"></script>

<script>
	$(function() {

		//이미지 업로드 펑션
		$("#imgsubmit").submit(function() {
			var formdata = new FormData();
			file = $("#fileselect")[0].files[0];
			formdata.append("file1", file);
			$.ajax({
				url : "upload_result_worker.jsp",
				data : formdata,
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(result) {
					result2 = result.trim();
					alert("이미지 업로드 성공");
					//파일전송완료 후 result 업로드 이미지 파일 경로
					//console.log("result: " + result2);
					var src="img/worker/"+result2;
					$("#image").val(src);
					//업로드 후 해당 경로 hidden input에 입력
					//console.log($("#img").val());
				}
			})
			return false;
		}); //submit function
		//이미지 업로드 펑션

		var list1 = [];
		var list2 = [];

		$("#address1").focus(function() {

			$.ajax({

				url : "../selectregworker.jsp",
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

				url : "../selectregworker2.jsp",
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

<body>
	<input type="hidden" name="mid" id="mid"
		value="<%=session.getAttribute(" id ")%>">
	<div style="padding-top: 5%;"></div>
	<form name="imgsubmit" id="imgsubmit" enctype="multipart/form-data">
	<table align="center">
			<tr>
				<td colspan="2"><input id="fileselect" type="file" name="file1"
					accept="image/*"></td>
			<tr>
			</tr>
			<td><input id="upload" type="submit" value="업로드"></td>
			<td>파일 선택 후 누르시오.</td>
			</tr>
		<!-- 사진 첨부하기? -->
		<!-- 사진 첨부를 위한 창 띄우기, 첨부한 사진을 Spic에 입력하기-->
	</table>
	</form>
	<form action="updateWorker.jsp">
		<input type="hidden" name="wnum" id="wnum" value="<%=workerDTO.getWnum()%>">
		<div id="regworker">
			<table>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="image" id="image" value="<%=workerDTO.getImage()%>">
					</td>
				</tr>
				<tr>
					<td>경력업종1</td>
					<td><select name="type1" id="type1">
							<option value="cafe"
								<%if (workerDTO.getType1().equals("cafe")) {%> selected <%}%>>cafe</option>
							<option value="factory"
								<%if (workerDTO.getType1().equals("factory")) {%> selected <%}%>>factory</option>
							<option value="design"
								<%if (workerDTO.getType1().equals("design")) {%> selected <%}%>>design</option>
					</select></td>
				</tr>
				<tr>
					<td>경력기간1(개월)</td>
					<td><input type="text" name="period1" id="period1"
						value="<%=workerDTO.getPeriod1()%>"></td>
				</tr>
				<tr>
					<td>경력업종2</td>
					<td><select name="type2" id="type2">
							<option value="" <%if (workerDTO.getType2() == null) {%> selected
								<%}%>></option>
							<option value="cafe" <%if (workerDTO.getType2() == "cafe") {%>
								selected <%}%>>cafe</option>
							<option value="factory"
								<%if (workerDTO.getType2() == "factory") {%> selected <%}%>>factory</option>
							<option value="design"
								<%if (workerDTO.getType2() == "design") {%> selected <%}%>>design</option>
					</select></td>
				</tr>
				<tr>
					<td>경력기간2</td>
					<td><input type="text" name="period2" id="period2"
						value="<%=workerDTO.getPeriod2()%>"></td>
				</tr>
				<tr>
					<td>경력업종3</td>
					<td><select name="type3" id="type3">
							<option value="" <%if (workerDTO.getType3() == null) {%> selected
								<%}%>></option>
							<option value="cafe" <%if (workerDTO.getType3() == "cafe") {%>
								selected <%}%>>cafe</option>
							<option value="factory"
								<%if (workerDTO.getType3() == "factory") {%> selected <%}%>>factory</option>
							<option value="design"
								<%if (workerDTO.getType3() == "design") {%> selected <%}%>>design</option>
					</select></td>
				</tr>
				<tr>
					<td>경력기간3</td>
					<td><input type="text" name="period3" id="period3"
						value="<%=workerDTO.getPeriod3()%>"></td>
				</tr>
				<tr>
					<td>근무지역(시/군)</td>
					<td><input type="text" name="address1" id="address1"
						value="<%=workerDTO.getAddress2()%>"></td>
				</tr>
				<tr>
					<td>근무지역(구/읍/면)</td>
					<td><input type="text" name="address2" id="address2"
						value="<%=workerDTO.getAddress1()%>"></td>
				</tr>
				<tr>
					<td colspan="2">본인소개</td>
				</tr>

				<tr>
					<td colspan="2"><textarea rows="5" cols="42" name="wcontent"
							id="wcontent"><%=workerDTO.getWcontent()%></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button id="reg" type="submit">수정</button> <a id="reg2"
						href="deleteWorker.jsp?wnum=<%=workerDTO.getWnum()%>">삭제</a>
					</td>
				</tr>
				<tr>
					<td><input type="button"
						onclick="location.href='..\\ReservationListFinal_Ver3.jsp?wnum=<%=workerDTO.getWnum()%>'"
						value="예약관리">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>

</html>