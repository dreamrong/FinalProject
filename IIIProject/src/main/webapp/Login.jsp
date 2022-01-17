<%@ page language="java" contentType="text/HTML; charset=UTF-8"
	pageEncoding="UTF-8" import="member.jdbc.dao.MemberDaoService,java.sql.*,java.util.*,javax.sql.*,member.jdbc.*"%>
     <%@page import="java.sql.*" %>
    <%@page import="javax.*" %>
    <%@page import="java.lang.*" %>
    <%@page import="java.io.*" %>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
String account=request.getParameter("account");
String password=request.getParameter("password");

MemberDaoService oauth = new MemberDaoService(); %>
 
<%= oauth.OAuthMember(account,password) %>


