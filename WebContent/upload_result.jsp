<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
    <%
    	String id = (String)session.getAttribute("id");//세션아이디
        String upload_path = "E:\\choiyoungjin\\choiyoungjin\\project2\\WebContent\\img\\store";
        int size = 2 * 1024 * 1024; //용량제한
        String filename = "";
        int filesize = 0;
   		MultipartRequest multi =null;
        String newfilename = "";
        try {
            multi = new MultipartRequest(request, upload_path, size, "utf-8", new DefaultFileRenamePolicy());
            Enumeration files = multi.getFileNames();
            String file1 = (String) files.nextElement();  
            filename = multi.getFilesystemName(file1);  
			if (filename != null) {
				File upfile1 = new File(upload_path + "/" + filename);
				File upfile2 = new File(upload_path + "/" +id+ filename);
				if (upfile1.renameTo(upfile2)) {
				} else {
				} 
				%>
				<%=upfile2.getName()%>
				<% 
			}
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
