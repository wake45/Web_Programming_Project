<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="insert" class="classes.Info" scope="page"/>
<jsp:useBean id="dbconnect" class="classes.DBConnection" scope="page"/>
<jsp:setProperty name="login" property="*"/>

<%
	if(dbconnect.insertMember(insert)){
	session.setAttribute("insert","success");
	out.println("<a href=class.html>수강내역 보기</a>");
	}
	else{
		out.print("수강 강좌 입력 실패");
		out.print("<a href=class.html>수강 강좌 내역 페이지로 이동</a>");
	}
%>
</body>
</html>