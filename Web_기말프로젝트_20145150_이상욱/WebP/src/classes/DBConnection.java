package classes;

import java.sql.*;

public class DBConnection {
	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver"; //jdbc드라이버로드
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTF-8&serverTimezone=UTC"; //jdbc url설정
	private static final String USER = "root"; //데이터베이스에 연결할 아이디
	private static final String PASSWD = "1234"; //데이터베이스에 연결할 비밀번호
	

	private Connection con = null; //데이터 베이스 연결 변수
	private PreparedStatement pstmt = null;	 //statement 변수
	
	public DBConnection() { //생성자 역할 forname으로 jdbc드라이버로드
		try {
			Class.forName(JDBC_DRIVER);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void connect() { //데이터베이스에 연결
		try{
			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		}catch(Exception e){
			e.printStackTrace();
		}		
	}
	
	public boolean deteleMember(String subject) { //수강강좌를 삭제하는 함수
		boolean success = true;
		connect(); //데이터베이스에 연결
		String sql = "delete from class where subject=?"; //수강강좌 일치하면 삭제
		
		try {
			pstmt = con.prepareStatement(sql); //statement생성
			pstmt.setString(1, subject); //setString설정
			pstmt.executeUpdate(); //sql문 전송
			
			disconnection();//연결 해제
			
			return success;
		}
		catch(SQLException e) {
		e.printStackTrace();
		
		return !success;
	}
}
	
	public String[][] tableMember(String inf[][]) { //table의 모든 데이터 반환
		
		connect(); //데이터 베이스연결
		String sql = "select * from class"; //테이블 조회
		ResultSet rs = null; //excuteQuery에 사용되는 결과를 받기위한 ResultSet
		int i = 0;
		int j = 0;
		
		try {
			pstmt = con.prepareStatement(sql); //statement생성
			rs = pstmt.executeQuery(sql); //결과를 받기위해 연결
			
			while(rs.next()) { //table의 행을 다음행 다음 열로 넘겨주면서 정보를 하나하나 배열에 입력한다.
				inf[i][j++] = rs.getString(1);
				inf[i][j++] = rs.getString(2);
				inf[i][j++] = rs.getString(3);
				inf[i][j++] = rs.getString(4);
				inf[i++][j] = rs.getString(5);
				j = 0;
			}
			
			for(j = 0 ; j < 5 ; j++) { //정보입력을 다받은 마지막 줄엔 null값 입력
				inf[i][j] = null;
			}
			
			rs.close(); //결과를 받기 위한 변수 해제
			disconnection(); //연결해제
			
			return inf;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public boolean insertMember(Info inf) { //수강강좌 입력 받는 함수
		boolean success = true;
		connect(); //데이터베이스에 연결
		String sql = "insert into class values(?, ?, ?, ?,?)"; //다섯개의 인자를 테이블에 insert한다
		
		try {
			pstmt = con.prepareStatement(sql); //statement생성
			pstmt.setString(1, inf.getName()); //inf의 정보를 하나씩 set해준다.
			pstmt.setString(2, inf.getSubject());
			pstmt.setString(3, inf.getDay());
	        pstmt.setString(4, inf.getTime());
	        pstmt.setString(5, inf.getClassroom());
	        pstmt.executeUpdate(); //sql문 전송
	        
			disconnection(); //연결해제
	        
			return success;
		}catch(SQLException e) {
			e.printStackTrace();
			return !success;
		}
	}
	
	public void disconnection() { //연결 해제 함수
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(con != null) {
			try {
				con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}

