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
<jsp:useBean id="regist" class="Info.Member" scope="page"/>
<jsp:useBean id="dbconnect" class="Info.DBConnection" scope="page"/>
<jsp:setProperty name="regist" property="*"/>

<%
	if(dbconnect.insertMember(regist)){
		//html에서 전달 받은 정보자체의 묶음인 regist를 dbconnect.isertMember에 전달한다.
		//성공적으로 가입이 됐을 경우
		out.print("<center>");
		out.println("가입되셨습니다.");
		session.setAttribute("regist","success");
		out.println("<br><a href=login.html>로그인 페이지로 이동</a>");
	}
	else{
		//가입에 실패했을 경우
		out.print("<center>");
		out.print("가입되지 않았습니다.");
		out.print("<br><a href=regist.html>회원가입 페이지로 이동</a>");
	}
%>
</body>
</html>