<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import=java.sql.* %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border=collapse>
	
		<tr>
  			<td><%out.print("과목 요일 시간 강의실");%>
		<%
		String JDBC_DRIVER = "com.mysql.jdbc.Driver";
		String JDBC_URL = "jdbc:mysql://localhost:3306/class?characterEncoding=UTF-8&serverTimezone=UTC";
		String USER = "root";
		String PASSWD = "1234";
		
		String subject[] = new String[100];
		String day[] = new String[100];
		String time[] = new String[100];
		String classroom[] = new String[100];
		
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int i = 0;

  		try{

 		//String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
	  	//String dbId="jspid";
		//String dbPass="jsppass";
		//Class.forName("com.mysql.jdbc.Driver");

	 		conn=DriverManager.getConnection(JDBC_URL,USER ,PASSWD);
	
		 	String sql= "select * from member";
	
	 		pstmt=conn.prepareStatement(sql);
	
	 		rs=pstmt.executeQuery();
	
			while(rs.next()){
				subject[i]= rs.getString("subject");
				day[i]= rs.getString("day");
				time[i]= rs.getString("time");
				classroom[i]= rs.getString("classroom");
				i++;
				//Timestamp register=rs.getTimestamp("reg_date");
				//String address= rs.getString("address");	
			}
		}catch(Exception e){ 
			e.printStackTrace();
		}
  		
  		for(int j = 0 ; j < i ; j++){
  			%>
  			<tr>
  				<td><%out.println(subject[j] + " " + day[j] +  " " + time[j] +  " " + classroom[j]); %>
  		<%	
  		}
		%>
		</tr>
	</table>
	<a href="logout.html">로그아웃</a>
	<a href="insert.html">수강 강좌 입력</a>
</body>
</html>