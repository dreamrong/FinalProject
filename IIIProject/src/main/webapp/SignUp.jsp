<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.jdbc.dao.MemberDaoService,java.sql.*,java.util.*,javax.sql.*,member.jdbc.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.io.*"%>
<%
request.setCharacterEncoding("UTF-8");
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Headers", "*");
response.setHeader("Access-Control-Allow-Methods", "*");
response.setHeader("Access-Control-Allow-Credentials", "true");     
 
%>
<html>
<head>
<title>SignUp Page</title>
</head>
<body>
<%

String account=request.getParameter("account");
String password=request.getParameter("password");
String name=request.getParameter("name");
String email=request.getParameter("email");
String birthdate=request.getParameter("birthDate");
String gender=request.getParameter("gender");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String pagefrom=request.getParameter("page");
String status=request.getParameter("status");

System.out.println(birthdate);
if(pagefrom == null){pagefrom="";}

MemberDaoService signUp = new MemberDaoService(); 
try{
	System.out.println("註冊身份:"+status);
	
	if(account!=null){
		if(status.equals("admin")){
			signUp.createAdmin(name,account,password,email,birthdate,gender,address,phone);
			out.print("Success,註冊成功!");	
			System.out.println("Success,註冊成功!");
		}else{
			signUp.signUp(name,account,password,email,birthdate,gender,address,phone);
			out.print("Success,註冊成功!");	
			System.out.println("Success,註冊成功!");
		}
	}else{
		out.print("Fail,沒更新任何資料!");
		System.out.println("Fail,沒更新任何資料!");
	}
	
	
	if(pagefrom.equals("admin")){
		response.sendRedirect("http://localhost:8080/IIIProject/AdminPage/MemberAdmin.html");
	}else{
		if(account.equals(email)){//Google登入
			response.sendRedirect("http://localhost:8080/IIIProject/Home.html");
		}else{
			response.sendRedirect("http://localhost:8080/IIIProject/login.html");	
		}
	}
	
	   
	
}catch(Exception e){
	e.printStackTrace();
}

%>

</body>
</html>