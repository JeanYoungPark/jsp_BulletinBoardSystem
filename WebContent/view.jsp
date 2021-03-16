<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="/common/var.jsp" %>
<%@ include file="/common/header.jsp" %>
<%@ include file="/common/nav.jsp" %>
<%
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		PrintWriter script  = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
%>
<div id="view" class="container">
	<div class="row">
		<div class="title">
			<h2><%= bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></h2>
			<p>
				<span class="by">by.<%= bbs.getUserID() %></span>
				<span class="date"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + ":" + bbs.getBbsDate().substring(14,16) %></span>
			</p>
			<span class="view"><i class="far fa-eye"></i><%= bbs.getBbsViewCount() %></span>
		</div>
		<p class="content"><%= bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></p>
		<a href="main.jsp" class="btn btn-primary">목록</a>
		<%
			if(userID != null && userID.equals(bbs.getUserID())){
		%>
			<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
			<a onclick="return confirm('삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
		<%
			}
		%>
		<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
	</div>
</div>
<script type="text/javascript">
	var bbsID = <%= bbsID %>;
</script>
<%@ include file="/common/footer.jsp" %>