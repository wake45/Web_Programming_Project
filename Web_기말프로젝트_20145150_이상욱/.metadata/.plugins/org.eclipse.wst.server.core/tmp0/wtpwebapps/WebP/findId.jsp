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
<jsp:useBean id="findId_" class="Info.Member" scope="page"/>
<jsp:useBean id="dbconnect" class="Info.DBConnection" scope="page"/>
<jsp:setProperty name="findId_" property="*"/>

<%
	String str=null;
	if( (str = dbconnect.findId(findId_.getName(),findId_.getNumber())) != null){
		//html���� ���� ���� �̸��� ��ȭ��ȣ�� dbconnect.findId�� �����ϰ� ã�� id�� ��ȯ �޴´�.
		//���������� id�� ��ȯ �޾��� ��� ��� 
		session.setAttribute("findId_",str);
		out.print("<center>");
		out.print("���̵� : " + str);		
		out.print("<br><a href=login.html>�α��� �������� �̵�</a>");
	}
	else{
		//���̵� ��ȯ ���� �� ���� ���
		out.print("<center>");
		out.print("ã���ô� ���̵� ���� �����ʽ��ϴ�.");
		out.print("<br><a href=login.html>�α��� �������� �̵�</a>");
	}
%>
</body>
</html>