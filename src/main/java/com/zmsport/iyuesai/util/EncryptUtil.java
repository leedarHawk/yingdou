package com.zmsport.iyuesai.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

/**
 * 加密解密
 * @author bilei
 *
 */
public final class EncryptUtil {
	
	/**
	 * md5加密
	 * @param s
	 * @return
	 */
	public static String encryptMD5(String s) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        BASE64Encoder base64en = new BASE64Encoder();
        //加密后的字符串
        String result = null;
		try {
			result = base64en.encode(md5.digest(s.getBytes("utf-8")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return result;
	}
	
	public static void main(String...s) {
		System.out.println(EncryptUtil.encryptMD5("admin123"));
	}
}
