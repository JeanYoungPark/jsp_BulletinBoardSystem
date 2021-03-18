<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ include file="/common/var.jsp" %>
<%@ include file="/common/header.jsp" %>
<%@ include file="/common/nav.jsp" %>
<%
	if(user.getUserID() == null){
		PrintWriter script  = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	BbsDAO bbs = new BbsDAO();
	ArrayList<Bbs> list = bbs.myArticleList(user.getUserID());
	
	String myList = "";
	for(int i = 0; i < list.size(); i++){
		myList += "<tr><td><a href='view.jsp?bbsID="+list.get(i).getBbsID()+"'>"+list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
				.replaceAll("\n", "<br>")+"</a></td><td>"+list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + ":"
						+ list.get(i).getBbsDate().substring(14, 16)+"</td></tr>";
	}
%>
<div class="row">
	<div class="container">
		<%@ include file="/common/mypageNav.jsp" %>
		<div class="col-lg-10">
			<h3>내가 쓴 게시글</h3>
			<div>
				<table class="table">
					<thead>
						<tr>
							<th>제목</th>
							<th width="20%">작성일</th>
						</tr>
					</thead>
					<tbody><%= myList %></tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<%@ include file="/common/footer.jsp" %>