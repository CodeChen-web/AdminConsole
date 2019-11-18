package com.atlantis.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @Auther: Atlantis
 * @Date: 2019/11/16
 * @Description: 日期时间的相关工具包
 * @version: 1.0
 */
public class DateUtils {
    /**
     * 日期转换成字符串
     */
    public static String dateToString(Date date, String simpleDateFormatStr) {
        SimpleDateFormat sdf = new SimpleDateFormat(simpleDateFormatStr);
        return sdf.format(date);
    }

    /**
     * 字符串转换成日期
     */
    public static Date stringToDate(String dateStr, String simpleDateFormatStr) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat(simpleDateFormatStr);
        return sdf.parse(dateStr);
    }


    /**
     * 以当前时间为标准，取具体某天的日期
     * 例如，0为今天、前2天为-2、后2天为+2
     *
     * @param flag
     * @param simpleDateFormatStr 返回的日期格式
     * @return
     */
    public static String getDaysOfNow(int flag, String simpleDateFormatStr) {
        SimpleDateFormat sdf = new SimpleDateFormat(simpleDateFormatStr);
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, flag);
        Date monday = c.getTime();
        return sdf.format(monday);
    }
}
