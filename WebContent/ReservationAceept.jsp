<%@page import="bean.CalendarListDTO"%>
<%@page import="bean.CalendarListDAO"%>
<%@page import="bean.ReservationDTO"%>
<%@page import="bean.ReservationListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="bean.ReservationDTO"></jsp:useBean>    
<jsp:setProperty property="*" name="dto"/>
	<%
		//ReservationListDTO dto = new ReservationListDTO();
		//예약확정 혹은 거절 state 변경
		//String id = request.getParameter("id"); 세션아이디
		ReservationListDAO dao = new ReservationListDAO();
		//	select 사용하여 세션id해당 data 모두 list화 하여 넘겨주기
		//id를 가지고 dao.select(dto) 실행
		dao.acceptupdate(dto);
		CalendarListDAO dao2 = new CalendarListDAO();
		CalendarListDTO dto2 = new CalendarListDTO();
		dto2.setId((String)session.getAttribute("id"));
		dto2.setCheckdate(request.getParameter("reserveDate"));
		dto2.setContent(request.getParameter("type1"));
		dao2.insert(dto2);
		out.print("예약확정 완료");
	%>