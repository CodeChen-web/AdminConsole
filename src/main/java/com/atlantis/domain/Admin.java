package com.atlantis.domain;

import java.io.Serializable;

/**
 * Admin - 管理员实体类
 */
public class Admin implements Serializable {
    private Integer aid; // ID编号
    private String aname; // 账户、用户名
    private String apassword; // 密码

    public Admin() {
        super();
    }

    public Admin(String aname, String apassword) {
        super();
        this.aname = aname;
        this.apassword = apassword;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getApassword() {
        return apassword;
    }

    public void setApassword(String apassword) {
        this.apassword = apassword;
    }

    @Override
    public String toString() {
        return "Admin [aid=" + aid + ", aname=" + aname + ", apassword=" + apassword + "]";
    }

}
