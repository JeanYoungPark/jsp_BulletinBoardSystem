<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.Utility" %>
<%@ page import="user.UserDAO" %><!-- 내가 만든 클래스 불러오기 -->
<%@ page import="java.io.PrintWriter" %><!-- 자바스크립트를 작성하기 위해 사용 -->
<% request.setCharacterEncoding("utf-8"); %> <!-- 넘어오는 모든 데이터를 UTF-8으로 받을 수 있도록 도움 -->
<jsp:useBean id="user" class="user.User" scope="page"/><!-- java bean 사용 표시 page사용으로 현재페이지에서만 사용을 알림-->
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

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
	UserDAO userDAO = new UserDAO();
	String password = Utility.encoding(user.getUserPassword());
	int result = userDAO.login(user.getUserID(),password);
	if(result == 1){
		session.setAttribute("userID", user.getUserID());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}else if (result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else if (result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else if (result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
<%-- <jsp:include page="./common/footer.jsp" flush="false" /> --%>