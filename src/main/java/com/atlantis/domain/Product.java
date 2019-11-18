package com.atlantis.domain;

import com.atlantis.utils.DateUtils;

import java.io.Serializable;
import java.util.Date;

/**
 * Product - 商品实体类
 */
public class Product implements Serializable {
    private Integer pid;// ID编号
    private String pname;// 名称
    private Long pnum;// 库存量、数量
    private Double pprice;// 价格、单价
    private Date pdate;// 商品时间
    private String pdatestr;
    private String pdetails;// 详情
    private String pexplain;// 鲜花说明、简介
    private String img;// 商品图片
    private String flag;// 商品上下架，0上架。1下架
    private Category category;// 该商品属于哪个分类

    public Product() {
        super();
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Long getPnum() {
        return pnum;
    }

    public void setPnum(Long pnum) {
        this.pnum = pnum;
    }

    public Double getPprice() {
        return pprice;
    }

    public void setPprice(Double pprice) {
        this.pprice = pprice;
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

    public String getPdatestr() {
        if (pdate != null) {
            pdatestr = DateUtils.dateToString(pdate, "yyyy-MM-dd HH:mm:ss");
        }
        return pdatestr;
    }

    public void setPdatestr(String pdatestr) {
        this.pdatestr = pdatestr;
    }

    public String getPdetails() {
        return pdetails;
    }

    public void setPdetails(String pdetails) {
        this.pdetails = pdetails;
    }

    public String getPexplain() {
        return pexplain;
    }

    public void setPexplain(String pexplain) {
        this.pexplain = pexplain;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", pnum=" + pnum +
                ", pprice=" + pprice +
                ", pdate=" + pdate +
                ", pdatestr='" + pdatestr + '\'' +
                ", pdetails='" + pdetails + '\'' +
                ", pexplain='" + pexplain + '\'' +
                ", img='" + img + '\'' +
                ", flag='" + flag + '\'' +
                ", category=" + category +
                '}';
    }
}
