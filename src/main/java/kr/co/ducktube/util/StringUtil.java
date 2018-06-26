package kr.co.ducktube.util;

public class StringUtil {

	/**
	 * 문자열 요약 메소드
	 * @param length 최대 표현 길이 ( 5길이 이하 문자열은 무시 )
	 * @param str 잘라낼 문자
	 * @return 잘라진 문자 + "..."
	 */
	public static String getShortString(int length, String str) {
		
		int strLen = str.length();
		if(strLen < 5) return str;
		
		if(strLen > length) {
			return str.substring(0, length-1) + "...";
		}
		
		return str;
	}
	
}
