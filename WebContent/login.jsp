<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="./common/var.jsp"%>
<jsp:include page="./common/header.jsp" flush="false" />
<jsp:include page="./common/nav.jsp" flush="false">
	<jsp:param name="userID" value="<%= userID %>" />
</jsp:include>
<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbotron" style="padding-top:20px">
			<form method="post"action="loginAction.jsp">
				<h3 style="text-align:center;">로그인화면</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="userID" maclength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maclength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="로그인">
			</form>
		</div>
	</div>
</div>
<jsp:include page="./common/footer.jsp" flush="false" />