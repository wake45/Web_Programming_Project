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
<jsp:useBean id="findpassword" class="Info.Member" scope="page"/>
<jsp:useBean id="dbconnect" class="Info.DBConnection" scope="page"/>
<jsp:setProperty name="findpassword" property="*"/>
 
<%
	String str = null;
	if( (str = dbconnect.findPwd(findpassword.getId(),findpassword.getName(),findpassword.getNumber())) != null){
		//html���� ���� ���� ���̵�� �̸� ��ȭ��ȣ�� dbconnect.findpwd�� �����ϰ� ã�� �н����带 ��ȯ �޴´�.
		//���������� �н����带 ��ȯ �޾��� ��� 
		session.setAttribute("findpassword",str);
		out.print("<center>");
		out.print("��й�ȣ : " + str);		
		out.print("<br><a href=login.html>�α��� �������� �̵�</a>");
	}
	else{
		//�н����带 ��ȯ ���� �� ���� ���
		out.print("<center>");
		out.print("ã���ô� ��й�ȣ�� ���� �����ʽ��ϴ�.");
		out.print("<br><a href=login.html>�α��� �������� �̵�</a>");
	}
%>
</body>
</html>