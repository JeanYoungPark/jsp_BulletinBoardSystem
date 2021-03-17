<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-lg-2">
	<ul class="mypageNav">
		<li><a href="mypage.jsp">내가 쓴 게시글</a></li>
		<li><a href="userModify.jsp">회원정보 수정</a></li>
		<li><a onclick="return confirm('탈퇴하시겠습니까?')" href="secessionAction.jsp">탈퇴하기</a></li>
	</ul>
</div>