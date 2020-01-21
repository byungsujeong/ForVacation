<%@page import="bean.MemberDTO"%>
<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");

	MemberDTO dto = new MemberDTO();
	MemberDAO dao = new MemberDAO();
	dto.setMid(id);
	dao.select(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <link rel="stylesheet" href="css/join.css">
        <script src="js/jquery-3.4.1.js"></script>
        <script src="js/main.js"></script>
        
<script>
	$(function() {
		var pw = "<%=dto.getPw()%>";
		var id = "<%=(String)session.getAttribute("id")%>";
		var count = 0;
		var count2 = 0;
		$("#pw").keyup(function() {
			if($("#pw").val() == pw){
                $("#pwcheck").html("<font color = green>비밀번호 확인 체크.</font>");
                count = 0;
			}else{
                $("#pwcheck").html("<font color = red>비밀번호를 확인해주세요.</font>");
                count = 1;
			}
		});//keyup
		$("#pw2").keyup(function() {
			if($("#pw2").val() == "" || $("#pw2").val().length < 8){
                $("#pwcheck2").html("<font color = red>비밀번호는 8자 이상 입력해주세요</font>");
                count2 = 1;
			}else{
                $("#pwcheck2").html("<font color = green>비밀번호 수정이 가능합니다</font>");
                count2 = 0;
			}
		});//keyup
		
		$("#join").click(function() {
			if($("#id").val() != id) {
				alert("아이디는 수정할 수 없습니다.")
				return false;
			} 
			if(count == 1 || $("#pw").val() == "" || count2 == 1){				
				alert("정보를 확인해주세요.");
				return false;
			}
			if($("#pw2").val() == ""){
				alert("비밀번호 수정칸의 주의사항을 확인하세요.");
				return false;
			}
		});//join
		$("#delete").click(function() {
			var id = $("#id").val();
			$.ajax({
				url : "delete.jsp",
				data : {
					id : id
					
				},
				success : function(result) {
					
				}
			});//ajax

		});//delete
	});//fuctiom
</script>
</head>
<body>

 <form action="update.jsp">
            <table align="center" width="300" height="500">
                <tr align="center">
                    <td colspan="3">
                        <h1>
                            <a href="main.jsp">For Vacation</a>
                        </h1> <br>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>아이디 <br>
                    </td>
                </tr>

                <tr align="center">
                    <td colspan="3"><input type="text" style="width: 300px; height: 40px;" id="id" name="id" value = "<%=id%>"></td>
                </tr>

                <tr>
                    <td>비밀번호 확인<br>
                    </td>
                </tr>
                <tr>
                    <td colspan="3"><input type="text" style="width: 300px; height: 40px;" id="pw" name="pw"></td>
                </tr>
                <tr>
                    <td id="pwcheck"></td>
                </tr>
                 <tr>
                    <td>비밀번호 수정<br>
                    </td>
                </tr>
                <tr>
                    <td colspan="3"><input type="text" style="width: 300px; height: 40px;" id="pw2" name="pw2" ><font color = "red">비밀번호 수정을 원하지 않을 시 원래 비밀번호를 기입해주세요.</font></td>
                </tr>
                 <tr>
                    <td id="pwcheck2"></td>
                </tr>

                <tr>
                
                    <td>이름 <br></td>
                </tr>
                <tr>
                    <td colspan="3"><input type="text" style="width: 300px; height: 40px;" id="name" name="name" value = "<%=dto.getName()%>"></td>
                </tr>

                <tr>
                    <td>성별<br>
                    </td>
                </tr>
                <tr>
                    <td><select name="gender" id="gender" style="width: 305px; height: 50px;">
						<option  value = "<%=dto.getGender()%>"><%=dto.getGender()%></option>
						<option value="male">남자</option>
						<option value="female">여자</option>
				</select></td>

                </tr>
                <tr>
                    <td>이메일 <br>
                    </td>
                </tr>
                <tr>
                    <td colspan="3"><input type="text" style="width: 300px; height: 40px;" id="email" name="email" value = "<%=dto.getEmail()%>"></td>
                </tr>
                <tr>
                    <td>휴대전화 <br>
                    </td>
                </tr>
                <tr>
                    <td colspan="3"><input type="text" style="width: 300px; height: 40px;" id="tel" name="tel" value = "<%=dto.getTel()%>"></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td colspan="3"><input type="submit" name="join" id="join" style="width: 305px; height: 50px;" value="수정하기"></td>
                </tr>
                <tr>
                    <td colspan="3"><input type="submit" name="delete" id="delete" style="width: 305px; height: 50px;" value="탈퇴하기"></td>
                </tr>


            </table>
</form>

</body>
</html>