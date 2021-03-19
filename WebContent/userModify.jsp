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
		myList += "<tr><td>"+list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
				.replaceAll("\n", "<br>")+"</td><td>"+list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + ":"
						+ list.get(i).getBbsDate().substring(14, 16)+"</td></tr>";
	}
%>
<div class="row">
	<div class="container">
		<%@ include file="/common/mypageNav.jsp" %>
		<div id="userModify" class="col-lg-10">
			<h2>회원정보 수정</h2>
			<div class="form">
				<form method="post" enctype="multipart/form-data" action="userModifyAction.jsp">
					<p class="img">
						<label for="image">
							<i class="fas fa-camera"></i>
						</label>
						<input id="image" type="file" name="image">
					</p>
					<p>
						<label for="name">이름</label>
						<input id="name" name="name" type="text" value="<%= user.getUserName() %>">
					</p>
					<p>
						<label for="email">이메일</label>
						<input id="email" name="email" type="text" value="<%= user.getUserEmail() %>">
					</p>
					<p>
						<label for="password1">비밀번호</label>
						<input id="password1" name="password1" type="password">
					</p>
					<p>
						<label for="password2">비밀번호 확인</label>
						<input id="password2" name="password2" type="password">
					</p>
					<div class="submit"><input type="submit" value="수정"></div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="/common/footer.jsp" %>