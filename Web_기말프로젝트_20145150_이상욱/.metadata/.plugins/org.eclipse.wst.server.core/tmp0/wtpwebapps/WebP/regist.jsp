<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- �ڹٺ�� ����� member.java�� DBConnection.java�� ������ �ҷ��� ��ġ ��Ų��. -->
<jsp:useBean id="regist" class="Info.Member" scope="page"/>
<jsp:useBean id="dbconnect" class="Info.DBConnection" scope="page"/>
<jsp:setProperty name="regist" property="*"/>

<%
	if(dbconnect.insertMember(regist)){
		//html���� ���� ���� ������ü�� ������ regist�� dbconnect.isertMember�� �����Ѵ�.
		//���������� ������ ���� ���
		out.print("<center>");
		out.println("���ԵǼ̽��ϴ�.");
		session.setAttribute("regist","success");
		out.println("<br><a href=login.html>�α��� �������� �̵�</a>");
	}
	else{
		//���Կ� �������� ���
		out.print("<center>");
		out.print("���Ե��� �ʾҽ��ϴ�.");
		out.print("<br><a href=regist.html>ȸ������ �������� �̵�</a>");
	}
%>
</body>
</html>