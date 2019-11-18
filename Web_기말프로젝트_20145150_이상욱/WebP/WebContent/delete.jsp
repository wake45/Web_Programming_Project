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
<jsp:useBean id="delete" class="classes.Info" scope="page"/>
<jsp:useBean id="dbconnect" class="classes.DBConnection" scope="page"/>
<jsp:setProperty name="delete" property="*"/>

<%
	if(dbconnect.deteleMember(delete.getSubject())){
		//html에서 전달 받은 강좌명을 dbconnect.deleteMember로 전달
		//삭제가 성공적으로 되면 출력
		session.setAttribute("delete","success");
		out.print("<center>");
		out.println("<a href=class.html>처음으로</a>");
	}
	else{
		//삭제 실패하면 출력
		out.print("<center>");
		out.print("삭제 실패");
		out.print("<br><a href=class.html>처음으로</a>");
	}
%>

</body>
</html>