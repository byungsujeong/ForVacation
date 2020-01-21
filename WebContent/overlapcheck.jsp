<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="bean.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO();
	ArrayList<MemberDTO> list = dao.selectAll();
	
	int data = 0;
	for(int i = 0; i < list.size(); i++){
		MemberDTO dto2 = list.get(i);
		if(id.equals(dto2.getMid())){
	data = 1;
		}
	}
	
	
		
 out.print(data);
	
	

%>