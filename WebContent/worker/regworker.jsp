<%@page import="java.util.ArrayList"%>
<%@page import="bean.AddressDAO"%>
<%@page import="bean.AddressDTO"%>
<%@page import="bean.WorkerBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

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
	width: 300px;
	height: 30px;
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
					$("#image").val("img/worker/"+result2);
					alert($("#image").val());
					//console.log("result: " + result2);
					//파일전송완료 후 result 업로드 이미지 파일 경로
					//업로드 후 해당 경로 hidden input에 입력
					//console.log($("#img").val());
				}
			})
			return false;
		}); //submit function
		//이미지 업로드 펑션

		/* 주소 auto complete 기능 사용하기 위한 js 배열 정의 */
		var list1 = [];
		var list2 = [];

		/* jsonArray로 db에 저장되어 있는 데이터 가지고 온 뒤 js배열로 담기 */
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

		/* 하위 주소  */
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

		/* auto comlete api 실행 */
		$("#address1").autocomplete({
			source : list1
		});
		$("#address2").autocomplete({
			source : list2
		});

		/* 인력등록 insert 실행 */
		$("#reg").click(function() {
			var mid = $("#mid").val();
			var type1 = $("#type1").val();
			var period1 = $("#period1").val();
			var type2 = $("#type2").val();
			var period2 = $("#period2").val();
			var type3 = $("#type3").val();
			var period3 = $("#period3").val();
			var address1 = $("#address1").val();
			var address2 = $("#address2").val();
			var wcontent = $("#wcontent").val();
			var image = $("#image").val();

			/* ajax실행 후 메인으로 이동
			동적 처리 안할건데 왜 ajax쓴지 모르겠으나
			이계기로 ajax 동적처리에 대해 완전히 이해함 */
			$.ajax({
				url : "insertregworker.jsp",
				data : {
					mid : mid,
					type1 : type1,
					period1 : period1,
					type2 : type2,
					period2 : period2,
					type3 : type3,
					period3 : period3,
					address1 : address1,
					address2 : address2,
					wcontent : wcontent,
					image : image
				},
				success : function(result) {
					location.href = "../main.jsp";
				}
			});

		});

	});
</script>

<body>
	<input type="hidden" name="mid" id="mid"
		value="<%=session.getAttribute("id")%>">
	<div style="padding-top: 5%;"></div>
		<table align="center">
			<tr>
				<form name="imgsubmit" id="imgsubmit" enctype="multipart/form-data">
				<td colspan="2">
				<input id="fileselect" type="file" name="file1"	accept="image/*"><br>
				<input id="upload" type="submit" value="업로드">
				파일 선택 후 누르시오.
				</form>
			</td>
		</tr>
		<!-- 사진 첨부하기? -->
		<!-- 사진 첨부를 위한 창 띄우기, 첨부한 사진을 Spic에 입력하기-->
	</table>
		<div id="regworker">
		<!-- 원래는 form태그로 submit했어야 하는 부분
		ajax처리하여 form태그가 없는 상환
		각 input태그의 value값을 js에서 $("#id")로 받아 쓰고 있음 -->
			<table>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="image" id="image">
					</td>
				</tr>
				<tr>
					<td>경력업종1</td>
					<td><select name="type1" id="type1">
							<option value="cafe">cafe</option>
							<option value="factory">factory</option>
							<option value="design">design</option>
					</select></td>
				</tr>
				<tr>
					<td>경력기간1(개월)</td>
					<td><input type="text" name="period1" id="period1"></td>
				</tr>
				<tr>
					<td>경력업종2</td>
					<td><select name="type2" id="type2">
							<option value=""></option>
							<option value="cafe">cafe</option>
							<option value="factory">factory</option>
							<option value="design">design</option>
					</select></td>
				</tr>
				<tr>
					<td>경력기간2</td>
					<td><input type="text" name="period2" id="period2"></td>
				</tr>
				<tr>
					<td>경력업종3</td>
					<td><select name="type3" id="type3">
							<option value=""></option>
							<option value="cafe">cafe</option>
							<option value="factory">factory</option>
							<option value="design">design</option>
					</select></td>
				</tr>
				<tr>
					<td>경력기간3</td>
					<td><input type="text" name="period3" id="period3"></td>
				</tr>
				<tr>
					<td>근무지역(시/군)</td>
					<td><input type="text" name="address1" id="address1"></td>
				</tr>
				<tr>
					<td>근무지역(구/읍/면)</td>
					<td><input type="text" name="address2" id="address2"></td>
				</tr>
				<tr>
					<td colspan="2">본인소개</td>
				</tr>

				<tr>
					<td colspan="2"><textarea rows="5" cols="42" name="wcontent"
										id="wcontent"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button id="reg" type="button">등록</button></td>
				</tr>
			</table>
		</div>



			</body>

</html>