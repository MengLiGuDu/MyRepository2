package com.kcls.util;


import java.io.File;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


public class DateUtil {

	public static void main(String [] str){
		System.out.println("dddd");
	}
	/*
		
	*/
	public static Date getFutureDateExact(int day, int hours, int minutes, int seconds, boolean flag) {
		Date date0 = null;
		Date date1 = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date1);
		calendar.add(Calendar.DATE, day);
		calendar.set(Calendar.HOUR_OF_DAY, hours);
		calendar.set(Calendar.MINUTE, minutes);
		calendar.set(Calendar.SECOND, seconds);
		date0 = calendar.getTime();
		if (flag == true) {
			if (date0.before(date1)) {
				calendar.add(Calendar.DATE, 1);
				date0 = calendar.getTime();
			}
		}
		return date0;
	}

	

	public static Date getFutureDate(Date date, int year, int month, int day, int hours, int minutes, int seconds) {
		Date date0 = null;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.YEAR, year);
		calendar.add(Calendar.MONTH, month);
		calendar.add(Calendar.DATE, day);
		calendar.add(Calendar.HOUR_OF_DAY, hours);
		calendar.add(Calendar.MINUTE, minutes);
		calendar.add(Calendar.SECOND, seconds);
		date0 = calendar.getTime();
		return date0;
	}

	public static Date getFutureDateExact(Date date, int day, int hours, int minutes, int seconds) {
		Date date0 = null;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DATE, day);
		calendar.set(Calendar.HOUR_OF_DAY, hours);
		calendar.set(Calendar.MINUTE, minutes);
		calendar.set(Calendar.SECOND, seconds);
		date0 = calendar.getTime();
		return date0;
	}

	public static Date getFutureDateExact(Date date, int month, int day, int hours, int minutes, int seconds) {
		Date date0 = null;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, month);
		calendar.add(Calendar.DATE, day);
		calendar.set(Calendar.HOUR_OF_DAY, hours);
		calendar.set(Calendar.MINUTE, minutes);
		calendar.set(Calendar.SECOND, seconds);
		date0 = calendar.getTime();
		return date0;
	}

	public static String getFutureDateExact(Date date, int day, String regula) {
		Date date0 = null;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DATE, day);
		date0 = calendar.getTime();
		return GetDateString(date0, regula);
	}

	public static String getFutureDateExact(Integer day, String regula) {
		Date date0 = null;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.DATE, day);
		date0 = calendar.getTime();
		return GetDateString(date0, regula);
	}

	public static Date getFutureDateExact(Date date, int seconds) {
		Date date0 = null;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.SECOND, seconds);
		date0 = calendar.getTime();
		return date0;
	}
	public static Date GetDate(String time1, String regula) {
		SimpleDateFormat df2 = new SimpleDateFormat(regula);
		try {
			Date date1 = df2.parse(time1);
			return date1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new Date();
	}

	public static Date GetLastDate(String time, String regula) {
		return GetLastDate(GetDate(time, regula));
	}

	public static Date GetLastDate(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DATE));
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		return calendar.getTime();
	}

	public static String GetLastDate(String time, String regula, String regula1) {
		return FormatDate(GetLastDate(time, regula), regula1);
	}

	public static String GetLastDateStr(Date date, String regula) {
		return FormatDate(GetLastDate(date), regula);
	}

	public static Date GetFirstDate(String time, String regula) {
		return GetFirstDate(GetDate(time, regula));
	}

	public static Date GetFirstDate(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DATE, calendar.getActualMinimum(Calendar.DATE));
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		return calendar.getTime();
	}

	public static String GetFirstDate(String time, String regula, String regula1) {
		return FormatDate(GetFirstDate(time, regula), regula1);
	}

	public static String GetFirstDateStr(Date date, String regula) {
		return FormatDate(GetFirstDate(date), regula);
	}

	public static Date StrConvertToDate(String time1, String regula) {
		Date date = null;
		SimpleDateFormat df2 = new SimpleDateFormat(regula);
		try {
			date = df2.parse(time1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}

	public static Date ConvertToDate(Object obj, String regula) {
		SimpleDateFormat df2 = new SimpleDateFormat(regula);
		Date date = null;
		try {
			if (obj == null)
				date = new Date();
			else if (obj.getClass() == String.class)
				date = df2.parse((String) obj);
			else if (obj.getClass() == Timestamp.class)
				date = new Date(((Timestamp) obj).getTime());
			else if (obj.getClass() == java.sql.Date.class)
				date = new Date(((java.sql.Date) obj).getTime());
			else if (obj.getClass() == Date.class)
				date = (Date) obj;
			else
				date = new Date();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}

	public static Date ConvertToDate(Object obj) {
		Date date = null;
		try {
			if (obj == null)
				date = new Date();
			else if (obj.getClass() == Timestamp.class)
				date = new Date(((Timestamp) obj).getTime());
			else if (obj.getClass() == java.sql.Date.class)
				date = new Date(((java.sql.Date) obj).getTime());
			else if (obj.getClass() == Date.class)
				date = (Date) obj;
			else
				date = new Date();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}

	public static String GetDateString(Object date, String regula) {
		if (date == null)
			return "";
		SimpleDateFormat df2 = new SimpleDateFormat(regula);
		return df2.format(date);
	}

	
	public static boolean compareDate(String time1, String time2) {
		try {
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = ft.parse(time1);
			Date date2 = ft.parse(time2);
			if (date1.before(date2) || date1.equals(date2))
				return true;
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public static int compareDates(String time1, String time2, String regula) {
		int i = 0;
		try {
			SimpleDateFormat ft = new SimpleDateFormat(regula);
			Date date1 = ft.parse(time1);
			Date date2 = ft.parse(time2);
			if (date1.before(date2))
				i = -1;
			else if (date1.equals(date2))
				i = 0;
			else if (i == 1)
				i = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public static boolean IsInRange(String begin, String end, String time) {
		try {
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = ft.parse(begin);
			Date date2 = ft.parse(end);
			Date date3;
			if (time.equals(""))
				date3 = ft.parse(getCurrentDate("yyyy-MM-dd"));
			else
				date3 = ft.parse(time);

			if ((date3.after(date1) && date3.before(date2)) || date3.equals(date1) || date3.equals(date2))
				return true;
			else
				return false;
		} catch (Exception e) {

		}
		return false;
	}

	public static boolean IsInRange(Date begin, Date end, Date time) {
		try {
			if ((time.after(begin) && time.before(end)) || time.compareTo(begin) == 0 || time.compareTo(end) == 0)
				return true;
			else
				return false;
		} catch (Exception e) {
		}
		return false;
	}

	public static String getCurrentDate(String regula) {
		Date date = new Date();
		SimpleDateFormat df2 = new SimpleDateFormat(regula);
		return df2.format(date);
	}

	public static String getFutureDate(int day, String regula) {
		// date.setDate(date.getDay() + day);
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, day);

		SimpleDateFormat df2 = new SimpleDateFormat(regula);
		return df2.format(calendar.getTime());
	}

	public static String getFutureDate(int day, String date, String regula) {
		SimpleDateFormat df2 = new SimpleDateFormat(regula);
		Calendar calendar = Calendar.getInstance();
		try {
			Date date1 = df2.parse(date);
			calendar.setTime(date1);
			calendar.add(Calendar.DATE, day);
			return df2.format(calendar.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return df2.format(calendar.getTime());
	}

	public static Date getFutureDate(int day) {
		Date date = null;
		Calendar calendar = Calendar.getInstance();
		try {
			Date date1 = new Date();
			calendar.setTime(date1);
			calendar.add(Calendar.DATE, day);
			date = calendar.getTime();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}

	public static Date getFutureDate(Date date, int day) {
		Calendar calendar = Calendar.getInstance();
		try {
			calendar.setTime(date);
			calendar.add(Calendar.DATE, day);
			date = calendar.getTime();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}

	public static String getFutureMonthDate(int day, String regula) {
		// date.setDate(date.getDay() + day);
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.MARCH, day);
		SimpleDateFormat df2 = new SimpleDateFormat(regula);
		return df2.format(calendar.getTime());
	}

	

	public static String FormatDate(Date date, String regula1) {
		String result = "";
		try {
			if (date != null) {
				SimpleDateFormat df1 = new SimpleDateFormat(regula1);
				result = df1.format(date);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	 /**  
	   * 灏嗛暱鏃堕棿鏍煎紡瀛楃涓茶浆鎹负鏃堕棿 yyyy-MM-dd HH:mm:ss  
	   *  
	   * @param strDate  
	   * @return  
	   */  
	public static Date strToDateLong(String strDate) {   
	   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
	   ParsePosition pos = new ParsePosition(0);   
	   Date strtodate = formatter.parse(strDate, pos);   
	   return strtodate;   
	}   
	
	/**  
	   * 灏嗛暱鏃堕棿鏍煎紡鏃堕棿杞崲涓哄瓧绗︿覆 yyyy-MM-dd HH:mm:ss  
	   *  
	   * @param dateDate  
	   * @return  
	   */  
	public static String dateToStrLong(java.util.Date dateDate) {   
	   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
	   String dateString = formatter.format(dateDate);   
	   return dateString;   
	}   
	public static String getTime(){
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strTime = df.format(date);
		return strTime;
	}
	public static String getDate(){
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String strTime = df.format(date);
		return strTime;
	}
	//springmvc上传文件
	public static String conmmonFile(MultipartFile head_img,HttpServletRequest request,String fileName){
		
		if (!head_img.isEmpty()) {
            String servletPath = request.getServletContext().getRealPath(fileName);
            String head_imgName = head_img.getOriginalFilename();
            File filepath = new File(servletPath, head_imgName);
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }
            try {
            	head_img.transferTo(new File(servletPath+File.separator+head_imgName));//把文件写入目标文件地址
            } catch (Exception e) {
                e.printStackTrace();
            }
            return head_imgName;
        } else {
        	return "error";
        }
		
	}
	
	public static HashMap<String, Object> page(@RequestParam HashMap<String, Object> input){
		
		if(input.get("pageNumber") != null && input.get("pageSize") != null){
			Integer pageNumber = Integer.parseInt(input.get("pageNumber")+"");
			Integer pageSize = Integer.parseInt(input.get("pageSize")+"");
			int page = (pageNumber-1)*pageSize;
			input.put("pageNumber", page);
		}
		return input;
	}
	
	public static String getUUID(){
		String uuid = UUID.randomUUID().toString();
		return uuid;
	};
	
	
}