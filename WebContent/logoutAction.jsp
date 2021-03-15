<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<%
	session.invalidate();//할당된 세션 지우기
%>
<script>
	location.href='main.jsp';	
</script>
<%@ include file="/common/footer.jsp" %>