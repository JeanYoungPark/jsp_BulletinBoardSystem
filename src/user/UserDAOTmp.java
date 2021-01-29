package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAOTmp {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAOTmp() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword="";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL); //������ ���
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery(); //���
			if(rs.next()) { //��� �� ����
				if(rs.getString(1).equals(userPassword)) {
					return 1;//�α��� ����
				}
				else 
					return 0; //��й�ȣ ����ġ
			}
			return -1;//���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -2;//�����ͺ��̽� ����
	}
}