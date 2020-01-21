<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
DateTimeFormatter fomatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
LocalDate start = LocalDate.parse("2019-09-26");
LocalDate end = LocalDate.parse("2019-10-03");
long index = ChronoUnit.DAYS.between(start, end);

/* 예약번호 알고리즘(인력mid+현재날짜+고객mid) */
for(int i=0; i<=index;i++){
String resnum = ""+start.plusDays(i);
out.print(resnum+"<br>");

}
%>


</body>
</html>