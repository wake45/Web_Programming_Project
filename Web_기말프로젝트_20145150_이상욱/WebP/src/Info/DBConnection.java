package Info;

import java.sql.*;

public class DBConnection {
	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";//jdbc����̹��ε�
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/webdb?characterEncoding=UTF-8&serverTimezone=UTC";//jdbc url����
	private static final String USER = "root"; //�����ͺ��̽��� ������ ���̵�
	private static final String PASSWD = "1234";  //�����ͺ��̽��� ������ ��й�ȣ
	

	private Connection con = null; //������ ���̽� ���� ����
	private PreparedStatement pstmt = null;	 //statement ����
	
	public DBConnection() { //������ ���� forname���� jdbc����̹��ε�
		try {
			Class.forName(JDBC_DRIVER);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void connect() { //�����ͺ��̽��� ����
		try{
			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		}catch(Exception e){
			e.printStackTrace();
		}		
	}
	
	public boolean isMember(String id, String pwd) { //�α��� �ϴ� �Լ�
		boolean success = false;
		connect();
		String sql = "select * from member"; //select������ ���̺��� ������ ��ȸ�Ѵ�
		ResultSet information = null; //excuteQuery�� ���Ǵ� ����� �ޱ����� ResultSet
		
		try { 
			pstmt = con.prepareStatement(sql);  //statement����
			information = pstmt.executeQuery(sql); //����� �ޱ����� ����
			
			while(information.next()) { //table�� ���� ��ȸ�ϸ鼭 ��ġ�ϴ� id�� �н����尡 ������ �α����� �Ǿ��ٴ� �� �˸������� success�� true�� �ٲ�
				if(id.equals(information.getString(1)) && pwd.equals(information.getString(2))) {	
					success = true;
				}
			}
			
			information.close();  //����� �ޱ� ���� ���� ����
			disconnection(); //��������
			
			return success;
		}catch(SQLException e) {
			e.printStackTrace();
			return success;
		}
	}
	
	public String findId(String name, String number) { //���̵� ã�� �Լ�
		connect();  //�����ͺ��̽��� ����
		String sql = "select * from member where name=? and number=?"; //���� name �̸��� ��ȭ��ȣ�� ��ȸ�մϴ�.
		ResultSet information=null;  //excuteQuery�� ���Ǵ� ����� �ޱ����� ResultSet
		String str = null;
		try { 
			pstmt = con.prepareStatement(sql);  //statement����
			pstmt.setString(1, name); //������ set���ݴϴ�.
			pstmt.setString(2, number);
			information = pstmt.executeQuery(); //����� �ޱ����� ����

			while(information.next()) { //���� ������������ �ִ� table���� id�� str�� �����մϴ�.
					str = information.getString(1);
			}
			
			information.close(); //����� �ޱ� ���� ���� ����
			disconnection();  //��������
			
			return str;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String findPwd(String id ,String name, String number) { //��й�ȣ�� ã�� �Լ�
		connect();
		String sql = "select * from member where id=? and name=? and number=?"; //���� ���̵� �̸� ��ȭ��ȣ�� ��ȸ�մϴ�.
		ResultSet information = null;  //excuteQuery�� ���Ǵ� ����� �ޱ����� ResultSet
		String str = null;
		try { 
			pstmt = con.prepareStatement(sql); //statement����
			pstmt.setString(1, id);  //������ set���ݴϴ�.
			pstmt.setString(2, name);
			pstmt.setString(3, number);
			information = pstmt.executeQuery();//����� �ޱ����� ����
			
			while(information.next()) { //���� ������������ �ִ� table���� pwd�� str�� �����մϴ�.
					str = information.getString(2);
			}
			
			information.close();//����� �ޱ� ���� ���� ����
			disconnection();  //��������
			
			return str;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean insertMember(Member mem) { //ȸ������ ������ ���̺� �Է��ϴ� �Լ�
		boolean success = true;

		connect(); //�����ͺ��̽��� ����
		String sql = "insert into member values(?, ?, ?, ?)"; //4���� ���ڸ� ���̺� insert�Ѵ�

		try {
			pstmt = con.prepareStatement(sql);  //statement����

			pstmt.setString(1, mem.getId()); //mem�� ������ �ϳ���set���ش�.
			pstmt.setString(2, mem.getPassword());
			pstmt.setString(3, mem.getName());
			pstmt.setString(4, mem.getNumber());
			pstmt.executeUpdate();  //sql�� ����


			disconnection(); //��������
	        return success;
			
		}catch(SQLException e) {
			e.printStackTrace();
			return !success;
		}
	}
	
	public void disconnection() { //���� ���� �Լ�
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
