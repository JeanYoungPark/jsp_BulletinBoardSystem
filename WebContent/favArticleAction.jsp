<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@page import="java.util.ArrayList"%>
<%@ page import = "com.google.gson.Gson,
				   com.google.gson.JsonObject" %>

<% 	
	BbsDAO bbsDAO = new BbsDAO(); 	
	ArrayList<Bbs> list = bbsDAO.favArticleList();
	
	//json사용을 위해
	Gson gson = new Gson();
	JsonObject obj = new JsonObject();
	
	String val = "";
	
	//html로 만들어서 전달
	for (int i = 0; i < list.size(); i++) {
		val += "<li><a href='view.jsp?bbsID="+list.get(i).getBbsID()+"'>"+list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
				.replaceAll("\n", "<br>")+"</a></li>";
	}
	
	obj.addProperty("result",val);
	out.print(gson.toJson(obj));
%>