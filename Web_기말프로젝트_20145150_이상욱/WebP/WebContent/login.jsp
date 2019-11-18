<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 자바빈즈를 사용해 member.java와 DBConnection.java의 정보를 불러와 일치 시킨다. -->
<jsp:useBean id="login" class="Info.Member" scope="page"/>
<jsp:useBean id="dbconnect" class="Info.DBConnection" scope="page"/>
<jsp:setProperty name="login" property="*"/>

<%
	if(dbconnect.isMember(login.getId(),login.getPassword())){
	//html에서 전달 받은 아이디와 패스워드를 dbconnect.isMember에 전달한다.
	//로그인 성공 일경우 
	session.setAttribute("login","success");
	out.println("<center>");
	out.print("<br><a href=class.html>수강생 입력</a>");
	}
	else{ //로그인 실패일 경우
		out.print("<center>");
		out.print("로그인실패");
		out.print("<br><a href=login.html>로그인 페이지로 이동</a>");
	}
%>
</body>
</html>