<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- �ڹٺ�� ����� classes.java�� DBConnection.java�� ������ �ҷ��� ��ġ ��Ų��. -->
<jsp:useBean id="insert" class="classes.Info" scope="page"/>
<jsp:useBean id="dbconnect" class="classes.DBConnection" scope="page"/>
<jsp:setProperty name="insert" property="*"/>

<%
	if(dbconnect.insertMember(insert)){
	//html���� ���� ���� ������ ������ insert�� DBConnection.insertMember�� ���� 
	//���������� ���������� �ԷµǸ� ���
	session.setAttribute("insert","success");
	out.print("<center>");
	out.println("<a href=class.html>ó������</a>");
	}
	else{
		//�������� �Է¿� �����ϸ� ���
		out.print("<center>");
		out.print("���� ���� �Է� ����");
		out.print("<br><a href=class.jsp>�������� �������� �̵�</a>");
	}
%>
</body>
</html>