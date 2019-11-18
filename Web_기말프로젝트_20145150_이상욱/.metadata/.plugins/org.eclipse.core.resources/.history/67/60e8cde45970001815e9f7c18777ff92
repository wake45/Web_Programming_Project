<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="find" class="Info.Member" scope="page"/>
<jsp:useBean id="dbconnect" class="Info.DBConnection" scope="page"/>
<jsp:setProperty name="find" property="*"/>

<%
	if(dbconnect.findId(find.getName(),find.getNumber()) != null){
		session.setAttribute("idfind",dbconnect.findId(find.getName(),find.getNumber()));
		out.print("아이디 : " + dbconnect.findId(find.getName(),find.getNumber()));		
		out.print("\n<a href=login.html>로그인 페이지로 이동</a>");
	}
	else{
		out.print("찾으시는 아이디가 존재 하지않습니다.");
		out.print("\n<a href=login.html>로그인 페이지로 이동</a>");
	}
%>
</body>
</html>