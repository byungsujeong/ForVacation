<%@page import="bean.MemberDAO"%>
<%@page import="bean.MemberDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="js/main.js"></script>

</head>
<body align = "center">
<%
	//1. 클라이언트가 입력한 map 형태의 파라메터 값을 받는다.
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");

		//2. DAO 사용하여 DB 처리
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		dto.setMid(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setBirth(birth);
		dto.setGender(gender);
		dto.setEmail(email);
		dto.setTel(tel);
		dao.insert(dto);
		

		//3. 처리 결과를 클라이언트에게 다시 알려준다.
		//  = > 클라이언트가 볼 수 있는 형태로 만들어서 알려준다.
		//  = > HTML 로 만들어 클라이언트에게 전송한다.
%>
	<h1>회원가입이 완료되었습니다. 감사합니다.</h1>
	<button type="button" onclick = "main()">홈으로</button>
</body>
</html>