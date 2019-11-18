<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 자바빈즈를 사용해 classes.java와 DBConnection.java의 정보를 불러와 일치 시킨다. -->
<jsp:useBean id="class_" class="classes.Info" scope="page"/>
<jsp:useBean id="dbconnect" class="classes.DBConnection" scope="page"/>
<jsp:setProperty name="class_" property="*"/>
<center>
<!-- 테이블에 입력되어 있는 수강생이름을 가진 필드를 모두 출력 -->
<h1>수강강좌</h1>
	<table width="100%" border=collapse>
	<tr>
		<td>과목
		<td>요일
		<td>시간
		<td>강의실		
	<%
	String str = class_.getName(); //수강생 이름 저장
	int temp = 0;
	String inf[][] = new String[100][5];
	dbconnect.tableMember(inf); //테이블의 정보를 반환 받는다.
		for(int i = 0 ; i < 100 ; i++){ //테이블의 정보출력
			out.print("<tr>");
			for(int j = 0 ; j < 5 ; j++){
				if(inf[i][j] != null){ //맨 마지막줄 null 마지막줄을 나타내기 위해 사용
					if(inf[i][0].equals(str) && j != 0){ //첫번 째열을 수강생 이름을 가지고 있으므로 제외하고 수강생이 수강하는 과목만 출력
						out.print("<td align=center>" + inf[i][j]);
					}
				}
				else{//마지막 줄일 경우 다음 포문도 나가기위해 temp가 변경 후 break
					temp = -1;
					break;
				}
				
			}
			if(temp == -1){ //마지막 줄일 경우 break
				break;
			}
		}
	
	%>
		<tr>
			<td colspan="4" align="center">
			<a href="logout.jsp">로그아웃</a>
			<a href="insert.html">수강강좌 입력</a>
			<a href="delete.html">수강강좌 삭제</a>
		</tr>
	</table>
</center>
</body>
</html>