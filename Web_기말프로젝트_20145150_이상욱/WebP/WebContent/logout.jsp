<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 자바빈즈를 사용해 classes.java와 DBConnection.java의 정보를 불러와 일치 시킨다. -->
<jsp:useBean id="login" class="Info.Member" scope="page"/>
<jsp:useBean id="dbconnect" class="Info.DBConnection" scope="page"/>
<jsp:setProperty name="login" property="*"/>
<% session.removeAttribute("login"); %>

<%
	//로그아웃을 하기위한 페이지
	out.print("<center>");
	out.println("<a href=login.html>로그인 페이지로 이동</a>");
%>
</body>
</html>