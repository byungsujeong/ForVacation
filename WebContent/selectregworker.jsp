<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.AddressDTO"%>
<%@page import="bean.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 주소데이터 db에서 불러와서 jsonArray로 처리 -->
<%
	AddressDAO addressDAO = new AddressDAO();
	AddressDTO addressDTO = new AddressDTO();
	ArrayList<AddressDTO> list = addressDAO.selectAll(addressDTO);
	JSONArray addressList = new JSONArray();
	
	for (int i = 0; i < list.size(); i++) {
 		addressList.add(list.get(i).getAddress1());
	}
%>
<%=addressList.toJSONString()%>