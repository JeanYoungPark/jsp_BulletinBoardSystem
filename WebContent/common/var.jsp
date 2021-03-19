<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="image.Image" %>
<%@ page import="image.ImageDAO" %>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	
	//회원 정보
	User user = new User();
	UserDAO getUser = new UserDAO();
	user = getUser.userInfo(userID);
	
	Image userImg = new Image();
	ImageDAO imagedao = new ImageDAO();
	userImg = imagedao.userImage(user.getUserID());
%>