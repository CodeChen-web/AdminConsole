package com.atlantis.utils;

import java.text.SimpleDateFormat;
import java.util.Random;

/**
 * IPTimeStamp - 上传文件的文件名工具类，根据当前日期和随机数生成
 * 
 * @Author Atlantis
 * @Version 1.0
 * @Date 2019年8月21日-下午8:57:43
 *
 */
public class IPTimeStamp {

	private String ip;

	public IPTimeStamp() {
	}

	public IPTimeStamp(String ip) {
		this.ip = ip; // 设置 ip地址
	}

	public  String getTimeStamp() {
		String temp = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		temp = sdf.format(new java.util.Date());
		return temp;
	}

	public String getIPTimeStampRand() {
		StringBuffer buf = new StringBuffer();
		if (ip != null) {
			String str[] = this.ip.split("\\.");
			for (int i = 0; i < str.length; i++) {
				buf.append(this.addZero(str[i], 3));
			}
		}
		buf.append(this.getTimeStamp());
		Random rand = new Random();
		for (int i = 0; i < 3; i++) {
			buf.append(rand.nextInt(10));
		}
		return buf.toString();
	}

	private String addZero(String str, int len) {
		StringBuffer s = new StringBuffer();
		s.append(str);
		while (s.length() < len) {
			s.insert(0, "0");
		}
		return s.toString();
	}

}
