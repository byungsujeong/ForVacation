<%@page import="bean.UserDAO"%>
<%@page import="bean.UserDTO"%>
<%@page import="bean.WorkerDAO"%>
<%@page import="bean.WorkerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
            <script src="js/jquery-3.4.1.js"></script>
                <script src="js/main.js"></script>
    
<%
	WorkerDTO workerDTO2 = new WorkerDTO();
	WorkerDAO workerDAO2 = new WorkerDAO();
	workerDTO2.setMid((String)session.getAttribute("id"));
	workerDAO2.check(workerDTO2);
	UserDTO userDTO2 = new UserDTO();
	UserDAO userDAO2 = new UserDAO();
	userDTO2.setMid((String)session.getAttribute("id"));
	userDAO2.check(userDTO2);
%>       
               
</head>
<body>
&nbsp;&nbsp;<%
if(session.getAttribute("id")!=null){
out.print(session.getAttribute("id"));
%>님 환영합니다.
<%}%>
	<br>
	<h1 align="center">
		<a href="main.jsp">For Vacation</a>
	</h1>
	<br>
	<br>

  <div class="btn-group btn-group-md" role="group" style="float:right">

        
		<%
			if(userDTO2.getRegNum()==null){
        		%><button class="btn btn-primary my-2 my-sm-0" type="button" onclick = "format4()">사업자등록</button><%
			}else{
				%><button class="btn btn-primary my-2 my-sm-0" type="button" onclick = "checkuser()">사업자정보</button><%
			}
		%>		
				
				
		<%
			if(workerDTO2.getWnum()==0){
        		%><button class="btn btn-primary my-2 my-sm-0" type="button" onclick = "regworker()">인력등록</button><%
			}else{
				%><button class="btn btn-primary my-2 my-sm-0" type="button" onclick = "checkworker()">인력정보</button><%
			}
		%>		
				
				
		<% 
		
		if(session.getAttribute("id")==null){
		
		%>
		

        <button class="btn btn-primary my-2 my-sm-0" type="button" onclick = "login()">
					로그인
				</button>
				
		<% }else{ %>
		
        <button class="btn btn-primary my-2 my-sm-0" type="button" onclick = "logout()">
					로그아웃
				</button>
				
		<%} %>
		
		<%
		if(session.getAttribute("id")==null){
		%>
				
        <button class="btn btn-primary my-2 my-sm-0" type="button" onclick = "join()">
					회원가입
				</button>
		<%}else{ %>
		<button class="btn btn-primary my-2 my-sm-0" type="button" onclick = "change()">
					회원정보수정
		<%} %>
		</button>
		
    </div>

</body>
</html>