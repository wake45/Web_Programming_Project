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
<jsp:useBean id="findId_" class="Info.Member" scope="page"/>
<jsp:useBean id="dbconnect" class="Info.DBConnection" scope="page"/>
<jsp:setProperty name="findId_" property="*"/>

<%
	String str=null;
	if( (str = dbconnect.findId(findId_.getName(),findId_.getNumber())) != null){
		//html에서 전달 받은 이름과 전화번호를 dbconnect.findId로 전달하고 찾은 id를 반환 받는다.
		//성공적으로 id를 반환 받았을 경우 출력 
		session.setAttribute("findId_",str);
		out.print("<center>");
		out.print("아이디 : " + str);		
		out.print("<br><a href=login.html>로그인 페이지로 이동</a>");
	}
	else{
		//아이디를 반환 받지 못 했을 경우
		out.print("<center>");
		out.print("찾으시는 아이디가 존재 하지않습니다.");
		out.print("<br><a href=login.html>로그인 페이지로 이동</a>");
	}
%>
</body>
</html>