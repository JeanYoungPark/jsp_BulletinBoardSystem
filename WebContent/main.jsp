<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@ include file="./common/var.jsp"%>
<jsp:include page="./common/header.jsp" flush="false" />
<jsp:include page="./common/nav.jsp" flush="false">
	<jsp:param name="userID" value="<%=userID%>" />
</jsp:include>
<%
int pageNumber = 1;
if (request.getParameter("pageNumber") != null) {
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
%>
<div class="container">
	<div class="row">
		<div class="pull-left col-lg-9">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #ddd">
				<thead>
					<tr>
						<th style="background-color: #eee; text-align: center;">번호</th>
						<th style="background-color: #eee; text-align: center;">제목</th>
						<th style="background-color: #eee; text-align: center;">작성자</th>
						<th style="background-color: #eee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getBbsID()%></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
		.replaceAll("\n", "<br>")%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
		+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
			if (pageNumber != 1) {
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left">이전</a>
			<%
			}
			if (bbsDAO.nextPage(pageNumber + 1)) {
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-right">다음</a>
			<%
			}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
		<div class="pull-right col-lg-3">
			<div class="row loginBox">
				<%
				if (user.getUserID() == null) {
				%>
				<h5>로그인</h5>
				<form method="post" action="loginAction.jsp">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maclength="20" style="margin-bottom: 10px;">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maclength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="로그인">
				</form>
				<%
				} else {
				%>
				<div class="img pull-left"></div>
				<ol class="pull-left" style="padding: 5px 0; margin-left: 15px;">
					<li class="name"><%= user.getUserName() %></li>
					<li class="email"><%= user.getUserEmail() %></li>
				</ol>
				<%
				}
				%>
			</div>
			<div class="row favArticle">
				<h5>인기 게시글</h5>
				<ul>
					<li><a href="#">안녕하세ssssssssssssssssssssssssssssssssssssssssssssssssss요!</a></li>
					<li><a href="#">안녕하세요!</a></li>
					<li><a href="#">안녕하세요!</a></li>
					<li><a href="#">안녕하세요!</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<jsp:include page="./common/footer.jsp" flush="false" />