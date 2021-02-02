package util;

import java.security.MessageDigest;

public class Utility {
	//문자열을 받아 암호화 하여 반환
	public static String encoding(String str) {
		String encodeString = "";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			//byte형태로 전달
			md.update(str.getBytes());
			byte[] encodeData = md.digest();
			for(int i = 0; i < encodeData.length; i++) {
				encodeString += Integer.toHexString(encodeData[i]&0xFF);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return encodeString;
	}
}
