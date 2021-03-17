<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="/common/var.jsp"%>
<%
	if(userID == null){
		PrintWriter script  = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}else {
		UserDAO userdao = new UserDAO();
		int result = userdao.userSecession(user.getUserID());
		if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('다시 시도해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			session.invalidate();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('탈퇴처리가 완료되었습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}	
	}
			
%>