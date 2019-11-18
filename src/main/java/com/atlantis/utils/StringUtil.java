package com.atlantis.utils;

/**
 * StringUtil - 字符串工具类
 * 
 * @Author Atlantis
 * @Version 1.0
 * @Date 2019年8月21日-下午2:05:10
 *
 */
public class StringUtil {

	public static boolean isEmpty(String str) {
		if ("".equals(str) || str == null) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isNotEmpty(String str) {
		if (!"".equals(str) && str != null) {
			return true;
		} else {
			return false;
		}
	}
}
