package com.login.action;

import java.security.SecureRandom;

public class OTP {
	public static void main(String[] args) {
		System.out.println("OTP :"+generateCode());
	}

	public static String generateCode() {
		String password = "12345";
		SecureRandom random = new SecureRandom();
		for (int i = 0; i < 8; i++) {
			//password = password + (char) (random.nextInt(26) + 97);
			password = password +  (random.nextInt(26) + 97);
		}
		return password;
	}
}
