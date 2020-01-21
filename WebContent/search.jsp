<%@page import="bean.MemberDAO"%>
<%@page import="bean.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.JoinDTO"%>
<%@page import="bean.JoinDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String type = request.getParameter("type");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	JoinDAO joinDAO = new JoinDAO();
	JoinDTO joinDTO = new JoinDTO();
	
	joinDTO.setStartdate(start);
	joinDTO.setEnddate(end);
	joinDTO.setType1(type);
	joinDTO.setAddress1(address1);
	joinDTO.setAddress2(address2);
	MemberDTO memberDTO = new MemberDTO();
	MemberDAO memberDAO = new MemberDAO();

	ArrayList<JoinDTO> list = joinDAO.search(joinDTO);
	ArrayList<MemberDTO> namelist = new ArrayList();
	for(int i=0; i<list.size(); i++){
		joinDTO = list.get(i);
		memberDTO.setMid(joinDTO.getMid());
		memberDTO = memberDAO.select(memberDTO);
		namelist.add(memberDTO);
	}
	request.setAttribute("namelist", namelist);
	request.setAttribute("list", list);//wnum, mid, image
	request.setAttribute("start", start);
	request.setAttribute("end", end);
	request.setAttribute("type", type);
	request.setAttribute("address1", address1);
	request.setAttribute("address2", address2);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("searchresult.jsp");
	dispatcher.forward(request, response);
	
%>
