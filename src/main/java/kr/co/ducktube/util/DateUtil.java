package kr.co.ducktube.util;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil {
	
	public static String getStringDateWithTime(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return getDateTimeFormat(sdf.format(date), "");
	}
	
	public static String getStringDateWithoutTime(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return getDateFormat(sdf.format(date));
	}
	/**
	 * 두 Date간의 시간차이를 초 단위로 반환합니다 ㅎㅎ
	 * @param start java.util.date입니다.
	 * @param end	java.util.date입니다.
	 * @return
	 */
	public static int getGapOfDate(Date start, Date end) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return (int)getDifferHour(sdf.format(start), sdf.format(end));
	}
	
	/**
	 * 날자를 원하는 포멧으로 반환한다
	 * @param sDate yyyyMMdd or yyyy-MM-dd
	 * @param delim ex("-")
	 * @return String delim format 형식으로 리턴
	 */
	public static String getDateFormat(String sDate) {
		//yyyyMMdd 이거나 yyyy-MM-dd 가 아니면 0리턴
		if(sDate == null || (sDate.length() != 8 && sDate.length() != 10) || (sDate.length() == 10 && sDate.indexOf("-") == -1)) {
			return "";
		}
		sDate = sDate.replaceAll("-", "");
		
		String yyyy = sDate.substring(0, 4);
		String MM = sDate.substring(4, 6);
		String dd = sDate.substring(6, 8);
		
		String dateFormat = yyyy + " 년 " + MM + " 월 " + dd + " 일 ";
		
		return dateFormat;
	}
	
	/**
	 * 날자 및 시간을 원하는 포멧으로 반환한다 (yyyy-MM-dd HH:mm:ss)
	 * @param dFormat
	 * yyyy 년, MM 월, dd 일
	 * HH 24시, mm 분, ss 초
	 * aa 오전/오후, hh 12시
	 * ww 년에 있어서 주(수치)
	 * DDD 년에 있어서 날(수치)
	 * F 월에 있어서 요일(수치)
	 * @return String
	 */
	public static String getDateTimeFormat(String sDateTime, String dFormat) {
		if(sDateTime == null || sDateTime.equals("")) {
			return "";
		}
		
		if(dFormat == null || dFormat.equals("")) {
			dFormat = "yyyy-MM-dd HH:mm:ss";
		}
		
		sDateTime = sDateTime.replaceAll("-", "");
		sDateTime = sDateTime.replaceAll(":", "");
		sDateTime = sDateTime.replaceAll(" ", "");
		if(sDateTime.length() != 14) {
			return "";
		} else {
			String yyyy = sDateTime.substring(0, 4);
			String MM = sDateTime.substring(4, 6);
			String dd = sDateTime.substring(6, 8);
			String hh = sDateTime.substring(8, 10);
			String mm = sDateTime.substring(10, 12);
			String ss = sDateTime.substring(12, 14);
			Calendar cal = Calendar.getInstance();
			cal.set(Integer.parseInt(yyyy), Integer.parseInt(MM)-1, Integer.parseInt(dd), Integer.parseInt(hh), Integer.parseInt(mm), Integer.parseInt(ss)); //년월일시분초셋팅
			SimpleDateFormat formatter = new SimpleDateFormat(dFormat);
			return formatter.format(cal.getTime());
		}
	}
	
    /**
     * <p>GregorianCalendar 객체를 반환함.
	 * 
	 * @param yyyymmdd 날짜 인수
	 * @return GregorianCalendar
	 * @see java.util.Calendar 
	 * @see java.util.GregorianCalendar
	 * <p><pre>
	 *  - 사용 예
	 * Calendar cal = DateUtil.getGregorianCalendar(DateUtil.getCurrentYyyymmdd())
	 * </pre>
	*/
	public static GregorianCalendar getGregorianCalendar(String yyyyMMddHHmmss) {
	     int yyyy = Integer.parseInt(yyyyMMddHHmmss.substring(0, 4));
	     int MM = Integer.parseInt(yyyyMMddHHmmss.substring(4, 6));
	     int dd = Integer.parseInt(yyyyMMddHHmmss.substring(6, 8));
	     int HH = Integer.parseInt(yyyyMMddHHmmss.substring(8, 10));
	     int mm = Integer.parseInt(yyyyMMddHHmmss.substring(10, 12));
	     int ss = Integer.parseInt(yyyyMMddHHmmss.substring(12, 14));
	
	     GregorianCalendar calendar = new GregorianCalendar(yyyy, MM - 1, dd, HH, mm, ss);
	
	     return calendar;
	}

	 /** 
     * 시간차 계산기 (초 단위입니다)
     */ 
	public static long getDifferHour(String startDate, String endDate) {
	
	     GregorianCalendar StartDate = getGregorianCalendar(startDate);
	     GregorianCalendar EndDate = getGregorianCalendar(endDate);
	     long difer = (EndDate.getTime().getTime() - StartDate.getTime().getTime()) / 1000;
	     return difer;
	}
	

	/**
	 * 입력된 날짜로부터 지금까지의 차를 형식으로 반환
	 * @param start
	 * @return
	 */
	public static String getLastDateFromNow(Date start) {
		return getLastDate(start, new Date());
	}
	
	/**
	 * 두 날짜의 차를 구해서 1초전,1일전 형식으로 값을 반환
	 * @param start
	 * @param end
	 * @return 
	 */
	public static String getLastDate(Date start, Date end) {

		LocalDateTime startL = start.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
		LocalDateTime endL = end.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();

		long years = ChronoUnit.YEARS.between(startL, endL);
		if(years > 0) return years + "년전";
		
		long months = ChronoUnit.MONTHS.between(startL, endL);
		if(months > 0) return months + "달전";
		
		long days = ChronoUnit.DAYS.between(startL, endL);
		if(days > 0) return days + "일전";
		
		long hours = ChronoUnit.HOURS.between(startL, endL);
		if(hours > 0) return hours + "시간전";
		
		long minutes = ChronoUnit.MINUTES.between(startL, endL);
		if(minutes > 0) return minutes + "분전";
		
		long secs = ChronoUnit.SECONDS.between(startL, endL);	
		if(secs > 0) return secs + "초전";
		
		return null;
	}
	
}
