<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>회원가입</title>
        <link rel="stylesheet" href="css/basic.css">
        <script src="js/jquery-3.4.1.js"></script>
        <script>
            $(function() {
            	//회원가입 버튼 클릭시 각 입력값 확인
            	$("#joinmember").click(function() {
            		//중복확인 결과값 확인
					if($("#idcheck").val()==false){
						alret("아이디를 확인해주세요.");
					//pw규칙 확인 결과값 확인
					}else if($("#pwlaw").val()==false){
						alret("PW규칙을 확인해주세요.");
					//이름 입력여부 확인
					}else if($("#name").val().length<2){
						alret("이름을 입력해주세요.");
					//생일 입력여부 확인 및 형식 확인(?)
					}else if($("#birth").val().length<10){
						alret("생년월일을 입력해주세요.(yyyy-mm-dd)");
					//이메일 입력여부 및 형식 확인(?)
					}else if($("#email").val().length<1){
						alret("이메일을 입력해주세요.");
					//휴대폰번호 입력여부 및 형식확인(?)
					}else if($("#tel").val().length<12){
						alret("연락처를 입력해주세요.(000-0000-0000)");
					}
				});
            	
                $("#pwre").keyup(function() {
                    //console.log($("#pw").val()); //pw값 확인
                    //console.log($("#pwre").val()); //pw재확인값 확인
					
                    //pw와 pw재확인 값에 따른 출력 메세지 설정
                    if ($("#pw").val() == $("#pwre").val()) {
                        $("#pwrecheck").html("<font color = green>패스워드가 동일합니다.</font>");
                    } else {
                        $("#pwrecheck").html("<font color = red>패스워드가 동일하지 않습니다.</font>");
                    }
                    //console.log($("#pwrecheck").text()); //출력값 확인
                });
            });
        </script>
    </head>

    <body>
        <table border="1">
            <form action="join.jsp">
                <tr class="header">
                    <td colspan="2">제목</td>
                </tr>
                <tr class="input">
                    <td>id:</td>
                    <td><input type="text" name="id" id="id">
                        <!-- id 입력창 -->
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="idcheck">중복확인 내용(아이디 입력창 넘어갈시 자동)
                        <!-- ajax로 id입력창 떠날시 db와 중복 확인 -->
                    </td>
                </tr>
                <tr>
                    <td>pw:</td>
                    <td><input type="text" name="pw" id="pw">
                        <!-- pw입력창 -->
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="pwlaw">PW 규칙 확인
                        <!-- jquery로 pw입력창 떠날시 비밀번호규칙일치여부 확인 -->
                    </td>
                </tr>
                <tr>
                    <td>pw재입력:</td>
                    <td><input type="text" name="pwre" id="pwre">
                        <!-- pw재입력창 -->
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="pwrecheck">PW를 다시 입력 해주세요.
                        <!-- jquery로 pw재입력창 떠날시 pw입력창 입력값과 동일여부 확인 -->
                    </td>
                </tr>
                <tr>
                    <td>이름:</td>
                    <td><input type="text" name="name" id="name">
                        <!-- 이름 입력창 -->
                        <!-- 1글자 입력시 경고창, 2글자 이상시 pass -->
                    </td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td><input type="text" name="birth" id="birth">
                        <!-- 생년월일입력창(yyyy-mm-dd 형식 제한(?)) -->
                        <!-- 캘린더 적용하여 입력할 수 있도록 변경 -->
                    </td>
                </tr>
                <tr>
                    <td>e-mail:</td>
                    <td><input type="text" name="email" id="email">
                        <!-- e-mail입력창 -->
                        <!-- 칸 2개 나눠서 앞에는 아이디 뒤에는 도메인 선택? -->
                    </td>
                </tr>
                <tr>
                    <td>휴대폰번호:</td>
                    <td><input type="text" name="tel" id="tel">
                        <!-- 휴대폰번호 입력창 -->
                    </td>
                </tr>
                <!-- <tr>
				<td>주소</td>
				<td>
					<button type="button">
						주소 찾기
						주소입력 api 실행 버튼
					</button>
				</td>
			</tr>
			<tr>
				<td><input type="text" name="address1" id="address1"> 우편번호 입력창(주소입력 api에서 가져오기)
				</td>
				<td><input type="text" name="address2" id="address2"> 주소 입력창(주소입력 api에서 가져오기)
				</td>
			</tr> -->
                <tr>
                    <td>
                        <button type="submit" id="joinmember">
						회원가입
						<!-- 회원가입 버튼, 입력 데이터 db전송 및 join.jsp로 이동 -->
					</button>
                    </td>
                    <td>
                        <button type="button" onclick="close">
						가입취소
						<!-- 가입창 닫기 혹은 이전으로 돌아가기, 홈화면으로 -->
					</button>
                    </td>
                </tr>
            </form>

        </table>

    </body>

    </html>