package com.atlantis.domain;

import java.io.Serializable;

/**
 * OrderItem - 订单详情实体类
 */
public class OrderItem implements Serializable {
    private Integer itemid;// ID编号
    private Integer count;// 购买某一商品的数量
    private Double subtotal;// 购买某一商品的 数量*单价
    private Integer pid;//// 属于哪个商品
    private String oid;// 属于哪个订单

    public OrderItem() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Integer getItemid() {
        return itemid;
    }

    public void setItemid(Integer itemid) {
        this.itemid = itemid;
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

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "itemid=" + itemid +
                ", count=" + count +
                ", subtotal=" + subtotal +
                ", pid=" + pid +
                ", oid='" + oid + '\'' +
                '}';
    }
}
