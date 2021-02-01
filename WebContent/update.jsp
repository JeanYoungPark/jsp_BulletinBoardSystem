<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
 <%@ page import="bbs.Bbs" %>
 <%@ page import="bbs.BbsDAO" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="./common/var.jsp"%>
<jsp:include page="./common/header.jsp" flush="false" />
<jsp:include page="./common/nav.jsp" flush="false">
	<jsp:param name="userID" value="<%= userID %>" />
</jsp:include>
<%	
	if(userID == null){
		PrintWriter script  = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하십시오.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	
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
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script  = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
	}
%>
<div class="container">
	<div class="row">
		<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
			<table class="table table-striped" style="text-align:center; border:1px solid #ddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color:#eee; text-align:center;">게시판 글 수정 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%>"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"><%= bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글수정">
		</form>
	</div>
</div>
<jsp:include page="./common/footer.jsp" flush="false" />