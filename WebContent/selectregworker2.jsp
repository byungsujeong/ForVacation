<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.AddressDTO"%>
<%@page import="bean.AddressDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String address1 = request.getParameter("address1");
	AddressDAO addressDAO = new AddressDAO();
	AddressDTO addressDTO = new AddressDTO();
	addressDTO.setAddress1(address1);
	ArrayList<AddressDTO> list2 = addressDAO.selectAll2(addressDTO);
	JSONArray addressList2 = new JSONArray();
	
	for (int i = 0; i < list2.size(); i++) {
 		addressList2.add(list2.get(i).getAddress2());
	}
%>
<%=addressList2.toJSONString()%>