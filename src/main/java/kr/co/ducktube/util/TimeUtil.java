package kr.co.ducktube.util;

public class TimeUtil {

	private static String time;
	
	private static String getHourFormat(int num) {
		String result = "";
		if(num == 0) {
			result = "00:";
		}
		
		if(num < 10 && num > 0) {
			result = "0"+num+":";
		} else if (num >= 10) {
			result = Integer.toString(num)+":";
		}
		
		return result;
	}
	private static String getMinFormat(int num) {
		String result = "00:";
	
		if(num < 10 && num > 0) {
			result = "0"+num+":";
		} else if (num >= 10) {
			result = Integer.toString(num)+":";
		}
		
		return result;
	}
	private static String getSecFormat(int num) {
		String result = "";
		
		if(num == 0) {
			result = "00";
		}
		
		if(num < 10 && num > 0) {
			result = "0"+num;
		} else if (num >= 10) {
			result = Integer.toString(num);
		}
		
		return result;
	}
	/**
	 * 매개변수 안에 초를 넣으면 00:00:00 형식의 시간을 얻을 수 있다.
	 * @param second
	 * @return
	 */
	public static String getTime(int second) {
		int hour = second / 3600;
		int min = second % 3600 / 60;
		int sec = second % 3600 % 60;
		String sHour = "";
		String sMin = "";
		String sSec = "";
		
		sHour = getHourFormat(hour);
		sMin = getMinFormat(min);
		sSec = getSecFormat(sec);
		time = sHour+sMin+sSec;
		return time;
	}
}
