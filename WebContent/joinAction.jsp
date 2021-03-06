<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.Utility" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>

<%		
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	
	if(userID != null){
		PrintWriter script  = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("locatin.href='main.jsp'");
		script.println("</script>");
	}

	String id = request.getParameter("userID");
	String password = Utility.encoding(request.getParameter("userPassword"));
	String name = request.getParameter("userName");
	String gender = request.getParameter("userGender");
	String email = request.getParameter("userEmail");

	User user = new User();
	user.setUserID(id);
	user.setUserPassword(password);
	user.setUserName(name);
	user.setUserGender(gender);
	user.setUserEmail(email);
	
	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else {
		UserDAO userDAO = new UserDAO();		
		int result = userDAO.join(user);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			session.setAttribute("userID", user.getUserID()); //세션할당
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}	
	}
%>