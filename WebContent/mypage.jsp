<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="./common/var.jsp"%>
<jsp:include page="./common/header.jsp" flush="false" />
<jsp:include page="./common/nav.jsp" flush="false">
	<jsp:param name="userID" value="<%= userID %>" />
</jsp:include>
<div class="container">

</div>
<jsp:include page="./common/footer.jsp" flush="false" />