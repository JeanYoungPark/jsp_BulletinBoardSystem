<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<%
	String url = request.getRequestURI().replaceAll("/BBS/","");
	String[] arr = {"","","",""};
	if(url.equals("main.jsp"))
		arr[0] = "active";
	else if(url.equals("login.jsp"))
		arr[2] = "active";
	else if(url.equals("join.jsp"))
		arr[3] = "active";
	else
		arr[1] = "active";
%>
<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				area-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>	
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="<%= arr[0] %> <%= user.getUserID() %>"><a href="main.jsp">메인</a></li>
			</ul>
			<%
				if(user.getUserID() == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="<%= arr[2] %>"><a href="login.jsp">로그인</a></li>
				<li class="<%= arr[3] %>"><a href="join.jsp">회원가입</a></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="mypage.jsp">마이페이지</a></li>
				<li><a href="logoutAction.jsp">로그아웃</a></li>
			</ul>
			<%
				}
			%>
		</div>
	</div>
</nav>