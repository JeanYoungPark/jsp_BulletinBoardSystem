<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="/common/var.jsp" %>
<%@ include file="/common/header.jsp" %>
<%@ include file="/common/nav.jsp" %>
<%
	BbsDAO bbsDAO = new BbsDAO();

	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	//게시글 리스트
	ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
	String val = "";
	for (int i = 0; i < list.size(); i++) {
		val += "<tr><td>"+list.get(i).getBbsID()+"</td><td><a href='view.jsp?bbsID="+list.get(i).getBbsID()+"'>"+list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
				.replaceAll("\n", "<br>")+"</a></td><td>"+list.get(i).getUserID()+"</td><td>"+list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
				+ list.get(i).getBbsDate().substring(14, 16) + "분</td></tr>";
	}
	
	//페이저
	int total = bbsDAO.boardNum();
	String pg = "";
	int nextPg, prevPg, stNum = 0;
	stNum = (pageNumber%10 > 0)?pageNumber/10:((pageNumber/10)-1); //0으로 끝나는 페이지 처리 다르게
	
	prevPg = pageNumber/10*10;
	if (pageNumber > 10) pg+= "<a href='main.jsp?pageNumber="+prevPg+"'>&lt;&lt;</a>";
	
	for(int i=stNum*10; i < total && i < stNum*10+10; i++){
		if(pageNumber == i+1) {
			pg += "<span class='on'>"+(i+1)+"</span>";
		}else {
			pg += "<a href='main.jsp?pageNumber="+(i+1)+"'>"+(i+1)+"</a>";	
		}
	}
	
	nextPg = ((stNum+1)*10)+1;
	if (bbsDAO.nextPage(nextPg)) {
		pg+= "<a href='main.jsp?pageNumber="+nextPg+"'>&gt;&gt;</a>";	
	}
	
%>
<div class="container">
	<div class="row">
		<div id="board" class="pull-left col-lg-9">
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
					<%= val %>
				</tbody>
			</table>
			<p id="pg"><%= pg %></p>
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
			<div id = "favArticle" class="row">
				<h5>인기 게시글</h5>
				<ul id="favList"></ul>
			</div>
		</div>
	</div>
</div>
<%@ include file="/common/footer.jsp" %>