<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="image.Image" %>
<%@ page import="image.ImageDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="/common/var.jsp"%>
<%
	if(userID == null){
		PrintWriter script  = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload");
	
	int size = 1024 * 1024 * 10;
	String file = "";
	String originalFile = "";
	
	try{
		MultipartRequest multi=new MultipartRequest(request, realFolder, size, "UTF-8", new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		String str = (String)files.nextElement();
		
		file = multi.getFilesystemName(str);
		originalFile = multi.getOriginalFileName(str);
		
		Image img = new Image();
		img.setFileName(file);
		img.setOriginName(originalFile);
		img.setUserID(user.getUserID());
		
		ImageDAO imgdao = new ImageDAO();
		int result = imgdao.imageUpload(img);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('다시 시도해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('저장되었습니다.')");
			script.println("location.href='userModify.jsp'");
			script.println("</script>");
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
%>