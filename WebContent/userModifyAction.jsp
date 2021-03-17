<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.Utility" %>
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
	}
	
	if(request.getParameter("name") == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이름을 입력해주세요')");
		script.println("history.back()");
		script.println("</script>");
	}else if(request.getParameter("email") == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이메일을 입력해주세요')");
		script.println("history.back()");
		script.println("</script>");
	}else {
		UserDAO userUpdate = new UserDAO();
		
		if(request.getParameter("password1") == null){
			int result = userUpdate.userModify(user.getUserID(),request.getParameter("name"),request.getParameter("email"),null);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수정되었습니다.')");
				script.println("location.href='userModify.jsp'");
				script.println("</script>");
			}	
		}else {
			if(request.getParameter("password1").equals(request.getParameter("password2"))){
				int result = userUpdate.userModify(user.getUserID(),request.getParameter("name"),request.getParameter("email"),Utility.encoding(request.getParameter("password1")));
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('수정되었습니다.')");
					script.println("location.href='userModify.jsp'");
					script.println("</script>");
				}	
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 일치하지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}	
	}
%>