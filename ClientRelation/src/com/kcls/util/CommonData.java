package com.kcls.util;

import java.text.DateFormat;
import java.util.Date;
import java.util.UUID;

public class CommonData {

	public static String getTime(){
		Date date = new Date();
		DateFormat ddf = DateFormat.getDateInstance();  
		String time = ddf.format(date);
		return time;
	}
	
	public static String getUuid(){
		String uuid = UUID.randomUUID().toString();
		return uuid;
	}
}
