package test;

import java.util.Calendar;
import java.util.Date;

public class TestDate {
	public static void main(String[] args){    
        GetNowDate();   
    }    
  
	public static void GetNowDate(){   
		Date curDate = new Date();
		java.sql.Date date=new java.sql.Date(curDate.getTime());
		System.out.println(date);
		System.out.println(transferIntoMin("19:00"));
		System.out.println(getDateSomeDayEalier());
	} 
	
	private static int transferIntoMin(String time){
		String[] result = time.split(":");
		String hour = result[0];
		int h = 0;
		String minute = result[1];
		int m = 0;
		if(hour.startsWith("0")){
			h = Integer.parseInt(hour.substring(1, 2));
		}else{
			h = Integer.parseInt(hour);
		}
		if(minute.startsWith("0")){
			m = Integer.parseInt(minute.substring(1, 2));
		}else{
			m = Integer.parseInt(minute);
		}
		m = h*60+m;
		return m;
	}
	
	private static java.sql.Date getDateSomeDayEalier(){
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) - 1);
		java.sql.Date newDate = new java.sql.Date(calendar.getTimeInMillis());
		return newDate;
	}
}
