package com.atlantis.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * *读取属性文件工具类
 * 
 * @Author Atlantis
 * @Version 1.0
 * @Date 2019年8月17日-上午9:21:49
 *
 */
public class PropertiesUtil {
	public static String getValue(String key) {
		Properties  prop = new Properties();
		InputStream in = new PropertiesUtil().getClass().getResourceAsStream("/mysql.properties");
		try {
			prop.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return (String)prop.get(key);
	}
}
