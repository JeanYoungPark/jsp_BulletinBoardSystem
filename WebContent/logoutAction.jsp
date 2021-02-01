<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./common/header.jsp" flush="false" />
<%
	session.invalidate();//할당된 세션 지우기
%>
<script>
	location.href='main.jsp';	
</script>
<jsp:include page="./common/footer.jsp" flush="false" />