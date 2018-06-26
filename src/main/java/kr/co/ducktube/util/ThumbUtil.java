package kr.co.ducktube.util;

public class ThumbUtil {
	
	public static Integer getSum(Integer up, Integer down) {
		Integer total = up - down;
		if (total < 0) {
			total = 0;
		}
		return total;
	}
}
