<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="bean.CalendarListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.CalendarListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String id = (String)session.getAttribute("id");
		CalendarListDTO dto = new CalendarListDTO();
		dto.setId(id);
		CalendarListDAO dao = new CalendarListDAO();
		//	select 사용하여 세션id해당 data 모두 list화 하여 넘겨주기
		//id를 가지고 dao.select(dto) 실행
		ArrayList<CalendarListDTO> list = dao.select(dto);
		JSONArray jarray = null;
		try{
		jarray = new JSONArray();
		for(int i =0; i<list.size(); i++){
			JSONObject jobject = new JSONObject();
			jobject.put("checkdate", list.get(i).getCheckdate());
			jobject.put("content", list.get(i).getContent());
			jarray.add(jobject);
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		%>
		<%= jarray.toJSONString() %>
		 

