<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <!-- Datepicker -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <!-- Datepicker -->
        <link rel="stylesheet" href="css/join.css">
        <script src="js/jquery-3.4.1.js"></script>
        <script>
            $(function() {
                var count = 0;
                var count2 = 0;
                var count3 = 0;
                var count4 = 0;
                var count5 = 0;
                var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
                var exptext2 = /^[0-9]+-[0-9]+-[0-9]+/;




                $("#id").keyup(function() {
                    var idValue = $("#id").val().replace(/ /gi, "");
                    var pattern = /[^(a-zA-Z0-9)]/;
                    
                    if (idValue.length < 5 || pattern.test($("#id").val())) {
                        $("#idcheck").html("<font color = red>아이디는 5자 이상 영문,숫자로 입력해야합니다.</font>");
                        count4 = 1;
                    } else {
                    	count4 = 0;
                        $.ajax({
                            url: "overlapcheck.jsp",
                            data: {
                                id: idValue
                            },
                            success: function(result) {
                                count = result;
                                if (count == 1) {
                                    $("#idcheck").html("<font color = red>중복된 아이디 입니다</font>");
                                } else {
                                    $("#idcheck").html("<font color = green>멋진 아이디 입니다</font>");

                                }

                            }
                        });
                    }
                });

                $("#pw").keyup(function() {
                    if ($("#pw").val().length < 8) {
                        $("#pwcheck").html("<font color = red>패스워드는 8자 이상 입력해야합니다.</font>");
                        count3 = 0;
                    } else {
                        $("#pwcheck").html("<font color = green>사용할 수 있는 패스워드입니다.</font>");
                        count3 = 1;
                    }
                });

                $("#pw2").keyup(function() { //pw와 pw재확인 값에 따른 출력 메세지 설정
                    if ($("#pw").val() == $("#pw2").val()) {
                        $("#pwcheck2").html(
                            "<font color = green>패스워드가 동일합니다.</font>");
                        count2 = 0;
                    } else {
                        $("#pwcheck2").html(
                            "<font color = red>패스워드가 동일하지 않습니다.</font>");
                        count2 = 1;
                    }
                    //console.log($("#pwrecheck").text()); //출력값 확인
                });
                $("#email").keyup(function() { //pw와 pw재확인 값에 따른 출력 메세지 설정
                    if (exptext.test($("#email").val()) == false) {
                        $("#emailcheck").html(
                            "<font color = red>이메일 형식을 확인해주세요</font>");
                        count5 = 1;
                    } else {
                        $("#emailcheck").html(
                            "<font color = green>바른 형식입니다.</font>");
                        count5 = 0;
                    }
                    //console.log($("#pwrecheck").text()); //출력값 확인
                });
                $("#birth").keyup(function() { //pw와 pw재확인 값에 따른 출력 메세지 설정
                    if (exptext2.test($("#birth").val()) == false) {
                        $("#birthcheck").html(
                            "<font color = red>형식을 확인해주세요</font>");
                        count5 = 1;
                    } else {
                        $("#birthcheck").html(
                            "<font color = green>바른 형식입니다.</font>");
                        count5 = 0;
                    }
                    //console.log($("#pwrecheck").text()); //출력값 확인
                });

                $("#join").click(function() {
                    if (count == 1) {
                        alert("중복된 아이디는 회원가입하실 수 없습니다.");
                        return false;
                    } else if (count2 == 1 || count3 == 0) {
                        alert("비밀번호 재확인이 필요합니다.");
                        return false;
                    } else if ($("#id").val() == "" || $("#pw").val() == "" || $("#pw2").val() == "" || $("#name").val() == "" ||
                        $("#birth").val() == "" || $("#gender").val() == "gender" || $("#email").val() == "" || $("#tel").val() == "") {
                        alert("모든 정보들을 입력해야 합니다.")
                        return false;
                    } else if (count4 == 1){
                        alert("아이디 재확인이 필요합니다.");
                        return false;
                    	
                    } else if (count5 == 1){
                        alert("이메일 형식을 확인해주세요.");
                        return false;
                    	
                    }




                });
            });
        </script>
    </head>

    <body>
        <form action="joincomplete.jsp">
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
                    <td colspan="3"><input type="text" style="width: 300px; height: 40px;" id="id" name="id"></td>
                </tr>
                <tr>
                    <td id="idcheck"></td>
                </tr>
                <tr>
                    <td>비밀번호 <br>
                    </td>
                </tr>
                <tr>
                    <td colspan="3"><input type="text" style="width: 300px; height: 40px;" id="pw" name="pw"></td>
                </tr>
                <tr>
                    <td id="pwcheck"></td>
                </tr>

                <tr>
                    <td>비밀번호 재확인 <br>
                    </td>
                </tr>
                <tr>
                    <td colspan="3"><input type="text" style="width: 300px; height: 40px;" id="pw2" name="pw2"></td>
                    <tr>
                        <td id="pwcheck2"></td>
                    </tr>
                    <td>이름 <br>
                    </td>
                </tr>
                <tr>
                    <td colspan="3"><input type="text" style="width: 300px; height: 40px;" id="name" name="name"></td>
                </tr>
                <tr>
                    <td>생년월일<br>
                    </td>
                </tr>
                <tr>
                    <td><input type="text" style="width: 300px; height: 40px;" id="birth" name="birth" placeholder="xxxx-xx-xx 형식으로 입력해주세요."></td>

                </tr>
                <tr>
                    <td id="birthcheck"></td>
                </tr>
                <tr>
                    <td>성별<br>
                    </td>
                </tr>
                <tr>
                    <td><select name="gender" id="gender" style="width: 305px; height: 50px;">
						<option value="성별">성별</option>
						<option value="남자">남자</option>
						<option value="여자">여자</option>
				</select></td>

                </tr>
                <tr>
                    <td>이메일 <br>
                    </td>
                </tr>
                <tr>
                    <td colspan="3"><input type="text" style="width: 300px; height: 40px;" id="email" name="email" placeholder="xxxxx@xxx.xxx 형식으로 입력해주세요"></td>
                </tr>
                <tr>
                    <td id="emailcheck"></td>
                </tr>
                <tr>
                    <td>휴대전화 <br>
                    </td>
                </tr>
                <tr>
                    <td colspan="3"><input type="text" style="width: 300px; height: 40px;" id="tel" name="tel" placeholder="'-'없이 입력해주세요."></td>
                </tr>
                <div id="tel1"></div>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td colspan="3"><input type="submit" name="join" id="join" style="width: 305px; height: 50px;" value="가입하기"></td>
                </tr>


            </table>
        </form>

        <!-- Datepicker -->
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <!-- Datepicker -->
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!-- Datepicker -->
        <script>
            $(function() {
                $("#datepicker").datepicker();
            });
        </script>

    </body>

    </html>