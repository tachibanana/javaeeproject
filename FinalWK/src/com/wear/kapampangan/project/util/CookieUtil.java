package com.wear.kapampangan.project.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
	
	private String cred_email;
	private String cred_password;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public String getCred_email() {
		return cred_email;
	}



	public void setCred_email(String cred_email) {
		this.cred_email = cred_email;
	}



	public String getCred_password() {
		return cred_password;
	}



	public void setCred_password(String cred_password) {
		this.cred_password = cred_password;
	}



	//SET COOKIE
	public boolean setCookie(HttpServletRequest request , HttpServletResponse response){
		
		this.request = request;
		this.response = response;
		this.response.setContentType("text/html");
		
		Cookie[] cookie = this.request.getCookies();
		
		if(cookie != null){
			for(Cookie c : cookie){
				if(c.getName().equalsIgnoreCase("cred_email")){
					cred_email = c.getValue();
				}else if(c.getName().equalsIgnoreCase("cred_password")){
					cred_password = c.getValue();
				}
			}
		}
		
		if(!cred_email.equals("") && !cred_password.equals(""))
			return true;
		else
			return false;
	}
	//ADD COOKIE
	public void addCookie(String cred_email , String cred_password){
		
		int cookieLife = 3600 * 24 * 7;
		
		Cookie cookieEmail = new Cookie("cred_email" , cred_email);
		Cookie cookiePassword = new Cookie("cred_password" , cred_password);
		
		cookieEmail.setMaxAge(cookieLife);
		cookiePassword.setMaxAge(cookieLife);
		
		this.response.addCookie(cookieEmail);
		this.response.addCookie(cookiePassword);
	}
	
	//REMOVE COOKIE
	public boolean removeCookie(){
		
		Cookie[] cookie = this.request.getCookies();
		boolean flag_email = false;
		boolean flag_password = false;
		
		for(Cookie c : cookie){
			if(c.getName().equalsIgnoreCase("cred_email")){
				c.setMaxAge(0);
				this.response.addCookie(c);
				flag_email = true;
			}else if(c.getName().equalsIgnoreCase("cred_password")){
				c.setMaxAge(0);
				this.response.addCookie(c);
				flag_password = true;
			}
		}
		
		return flag_email && flag_password;
	}
	
	
}
