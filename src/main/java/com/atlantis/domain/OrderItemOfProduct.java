package com.atlantis.domain;

import java.io.Serializable;

/**
 * OrderItemOfProduct - 订单详情表与商品表的关联实体类
 */
public class OrderItemOfProduct implements Serializable {
    private String oid;// 订单编号
    private Integer pid;// 商品ID编号
    private String pname;// 商品名称
    private Double pprice;// 商品单价
    private String pdetails;// 商品简介
    private Integer count;// 购买的商品数量
    private Double subtotal;// 该商品总价：数量*单价

    public OrderItemOfProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
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

    public Double getPprice() {
        return pprice;
    }

    public void setPprice(Double pprice) {
        this.pprice = pprice;
    }

    public String getPdetails() {
        return pdetails;
    }

    public void setPdetails(String pdetails) {
        this.pdetails = pdetails;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    @Override
    public String toString() {
        return "OrderItemOfProduct [oid=" + oid + ", pid=" + pid + ", pname=" + pname + ", pprice=" + pprice
                + ", pdetails=" + pdetails + ", count=" + count + ", subtotal=" + subtotal + "]";
    }

}
