package image;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ImageDAOTmp {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ImageDAOTmp() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int imageUpload(Image image) {
		String SQL = "INSERT INTO imageUpload (fileName, originName, userID) VALUES (?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, image.getFileName());
			pstmt.setString(2, image.getOriginName());
			pstmt.setString(3, image.getUserID());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public Image userImage(String userID) {
		String SQL = "SELECT * FROM imageUpload WHERE userID=? ORDER BY id DESC LIMIT 1";
		Image img = new Image();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				img.setFileName(rs.getString(2));
				img.setOriginName(rs.getString(3));
			}
			return img;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return img;
	}
}
