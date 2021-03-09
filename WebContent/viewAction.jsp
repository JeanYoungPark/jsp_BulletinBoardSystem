<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import = "com.google.gson.Gson,
				   com.google.gson.JsonObject" %>
<% 
	request.setCharacterEncoding("utf-8");
	
	BbsDAO bbsDAO = new BbsDAO(); 
	String bbsID = request.getParameter("bbsID");
	Gson gson = new Gson();
	JsonObject obj = new JsonObject();
	
	if(bbsID != null){
		//viewCount 추가
		bbsDAO.viewCountAdd(bbsID);
		obj.addProperty("result",1);
	}else {
		obj.addProperty("result",2);
	}
	
	out.print(gson.toJson(obj));
%>