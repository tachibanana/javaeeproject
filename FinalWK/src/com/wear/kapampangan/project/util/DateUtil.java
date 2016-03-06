package com.wear.kapampangan.project.util;

public class DateUtil {

	public String getDateAsString(String date){
		
		String dateLang[] = date.split("/");
		String dateString = "January";
		if(dateLang[1].equals("01")){
			dateString = "January";
		}else if(dateLang[1].equals("02")){
			dateString = "Febuary";
		}else if(dateLang[1].equals("03")){
			dateString = "March";
		}else if(dateLang[1].equals("04")){
			dateString = "April";
		}else if(dateLang[1].equals("05")){
			dateString = "May";
		}else if(dateLang[1].equals("06")){
			dateString = "June";
		}else if(dateLang[1].equals("07")){
			dateString = "July";
		}else if(dateLang[1].equals("08")){
			dateString = "August";
		}else if(dateLang[1].equals("09")){
			dateString = "September";
		}else if(dateLang[1].equals("10")){
			dateString = "October";
		}else if(dateLang[1].equals("11")){
			dateString = "November";
		}else if(dateLang[1].equals("12")){
			dateString = "December";
		}
		
		return String.format("%s %s, %s", dateString , dateLang[2] , dateLang[0]);
	}
	
public String getDateAndTimeAsString(String date){
		String datedate = date;		
		String two[] = datedate.split(" ");
		String dateLang[] = two[0].split("/");
		String timeLang[] = two[1].split(":");
		String amPm = "AM";
	
		int intTimeLang = Integer.parseInt(timeLang[0]);
		
		if( intTimeLang > 12 ){
			amPm = "PM";
			intTimeLang -= 12;
		}
		
		String dateString = "January";
		if(dateLang[1].equals("01")){
			dateString = "January";
		}else if(dateLang[1].equals("02")){
			dateString = "Febuary";
		}else if(dateLang[1].equals("03")){
			dateString = "March";
		}else if(dateLang[1].equals("04")){
			dateString = "April";
		}else if(dateLang[1].equals("05")){
			dateString = "May";
		}else if(dateLang[1].equals("06")){
			dateString = "June";
		}else if(dateLang[1].equals("07")){
			dateString = "July";
		}else if(dateLang[1].equals("08")){
			dateString = "August";
		}else if(dateLang[1].equals("09")){
			dateString = "September";
		}else if(dateLang[1].equals("10")){
			dateString = "October";
		}else if(dateLang[1].equals("11")){
			dateString = "November";
		}else if(dateLang[1].equals("12")){
			dateString = "December";
		}
		
		return String.format("%s %s, %s %d:%s %s", dateString , dateLang[2] , dateLang[0] , intTimeLang , timeLang[1] , amPm);
	}

}
