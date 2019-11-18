package Info;

import java.sql.*;

public class DBConnection {
	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";//jdbc드라이버로드
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTF-8&serverTimezone=UTC";//jdbc url설정
	private static final String USER = "root"; //데이터베이스에 연결할 아이디
	private static final String PASSWD = "1234";  //데이터베이스에 연결할 비밀번호
	

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
	
	public boolean isMember(String id, String pwd) { //로그인 하는 함수
		boolean success = false;
		connect();
		String sql = "select * from member"; //select문으로 테이블의 정보를 조회한다
		ResultSet information = null; //excuteQuery에 사용되는 결과를 받기위한 ResultSet
		
		try { 
			pstmt = con.prepareStatement(sql);  //statement생성
			information = pstmt.executeQuery(sql); //결과를 받기위해 연결
			
			while(information.next()) { //table의 행을 조회하면서 일치하는 id와 패스워드가 있으면 로그인이 되었다는 걸 알리기위해 success를 true로 바꿈
				if(id.equals(information.getString(1)) && pwd.equals(information.getString(2))) {	
					success = true;
				}
			}
			
			information.close();  //결과를 받기 위한 변수 해제
			disconnection(); //연결해제
			
			return success;
		}catch(SQLException e) {
			e.printStackTrace();
			return success;
		}
	}
	
	public String findId(String name, String number) { //아이디를 찾는 함수
		connect();  //데이터베이스에 연결
		String sql = "select * from member where name=? and number=?"; //조건 name 이름과 전화번호를 조회합니다.
		ResultSet information=null;  //excuteQuery에 사용되는 결과를 받기위한 ResultSet
		String str = null;
		try { 
			pstmt = con.prepareStatement(sql);  //statement생성
			pstmt.setString(1, name); //정보를 set해줍니다.
			pstmt.setString(2, number);
			information = pstmt.executeQuery(); //결과를 받기위해 연결

			while(information.next()) { //같은 정보를가지고 있는 table행의 id를 str에 저장합니다.
					str = information.getString(1);
			}
			
			information.close(); //결과를 받기 위한 변수 해제
			disconnection();  //연결해제
			
			return str;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String findPwd(String id ,String name, String number) { //비밀번호를 찾는 함수
		connect();
		String sql = "select * from member where id=? and name=? and number=?"; //조건 아이디 이름 전화번호를 조회합니다.
		ResultSet information = null;  //excuteQuery에 사용되는 결과를 받기위한 ResultSet
		String str = null;
		try { 
			pstmt = con.prepareStatement(sql); //statement생성
			pstmt.setString(1, id);  //정보를 set해줍니다.
			pstmt.setString(2, name);
			pstmt.setString(3, number);
			information = pstmt.executeQuery();//결과를 받기위해 연결
			
			while(information.next()) { //같은 정보를가지고 있는 table행의 pwd를 str에 저장합니다.
					str = information.getString(2);
			}
			
			information.close();//결과를 받기 위한 변수 해제
			disconnection();  //연결해제
			
			return str;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean insertMember(Member mem) { //회원가입 정보를 테이블에 입력하는 함수
		boolean success = true;

		connect(); //데이터베이스에 연결
		String sql = "insert into member values(?, ?, ?, ?)"; //4개의 인자를 테이블에 insert한다

		try {
			pstmt = con.prepareStatement(sql);  //statement생성

			pstmt.setString(1, mem.getId()); //mem의 정보를 하나씩set해준다.
			pstmt.setString(2, mem.getPassword());
			pstmt.setString(3, mem.getName());
			pstmt.setString(4, mem.getNumber());
			pstmt.executeUpdate();  //sql문 전송


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
