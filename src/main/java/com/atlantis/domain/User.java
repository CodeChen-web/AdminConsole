package com.atlantis.domain;

import com.atlantis.utils.DateUtils;

import java.io.Serializable;
import java.util.Date;

/**
 * User - 用户实体类
 */
public class User implements Serializable {
    private Integer uid; // ID编号
    private String uname; // 账户、用户名
    private String upassword; // 密码
    private Date udate;// 注册时间
    private String udatestr;
    private String tel;// 联系方式、手机

    public User() {
        super();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public Date getUdate() {
        return udate;
    }

    public void setUdate(Date udate) {
        this.udate = udate;
    }

    public String getUdatestr() {
        if (udate != null) {
            udatestr = DateUtils.dateToString(udate, "yyyy-MM-dd HH:mm:ss");
        }
        return udatestr;
    }

    public void setUdatestr(String udatestr) {
        this.udatestr = udatestr;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", upassword='" + upassword + '\'' +
                ", udate=" + udate +
                ", udatestr='" + udatestr + '\'' +
                ", tel='" + tel + '\'' +
                '}';
    }
}
