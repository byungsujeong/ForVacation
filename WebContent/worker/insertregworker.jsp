
<%@page import="bean.WorkerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- insert처리 진행 -->
<jsp:useBean id="workerDTO" class="bean.WorkerDTO"></jsp:useBean>
<jsp:setProperty property="*" name="workerDTO" />
<%
	WorkerDAO workerDAO = new WorkerDAO();
	workerDAO.insert(workerDTO);
%>
