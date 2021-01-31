<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="./common/var.jsp"%>
<jsp:include page="./common/header.jsp" flush="false" />
<jsp:include page="./common/nav.jsp" flush="false">
	<jsp:param name="userID" value="<%= userID %>" />
</jsp:include>
<div class="container">
	<div class="jumbotron">
		<div class="container">
			<h1>웹 사이트 소개</h1>
			<p>이 웹 사이트는 부트스트랩으로 만든 JSP 웹 사이트입니다. 최소한의 간단한 로직만을 이용하여 개발했습니다.</p>
			<p><a class="btn btn-primary btn-pull" href="bbs.jsp" role="button">자세히 알아보기</a></p>
		</div>
	</div>
</div>
<jsp:include page="./common/footer.jsp" flush="false" />