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
<jsp:useBean id="findpassword" class="Info.Member" scope="page"/>
<jsp:useBean id="dbconnect" class="Info.DBConnection" scope="page"/>
<jsp:setProperty name="findpassword" property="*"/>
 
<%
	String str = null;
	if( (str = dbconnect.findPwd(findpassword.getId(),findpassword.getName(),findpassword.getNumber())) != null){
		//html에서 전달 받은 아이디와 이름 전화번호를 dbconnect.findpwd에 전달하고 찾은 패스워드를 반환 받는다.
		//성공적으로 패스워드를 반환 받았을 경우 
		session.setAttribute("findpassword",str);
		out.print("<center>");
		out.print("비밀번호 : " + str);		
		out.print("<br><a href=login.html>로그인 페이지로 이동</a>");
	}
	else{
		//패스워드를 반환 받지 못 했을 경우
		out.print("<center>");
		out.print("찾으시는 비밀번호가 존재 하지않습니다.");
		out.print("<br><a href=login.html>로그인 페이지로 이동</a>");
	}
%>
</body>
</html>