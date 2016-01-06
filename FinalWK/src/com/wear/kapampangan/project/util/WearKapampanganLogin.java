package com.wear.kapampangan.project.util;

import com.wear.kapampangan.project.library.User;

public class WearKapampanganLogin implements LoginUtil {

	public boolean isValidate(String email, String password) {
		UserUtil userUtil = new UserUtil();
		boolean isValid = false;
	
//		for(User user : userUtil.getAllUser()){
//			if(user.getEmail().equals(email) && user.getPassword().equals(password)){
//				isValid = true;
//			}
//		}
		return isValid;
	}

}
