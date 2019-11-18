package com.atlantis.domain;

import com.atlantis.utils.DateUtils;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 * OrderOfUserInfo - 订单表与用户信息表关联实体类
 */
public class OrderOfUserInfo implements Serializable {
    private Integer uid;// 用户ID编号
    private String oid;// 订单编号
    private Date odate;// 订单时间
    private String odatestr;
    private Double total;// 订单总价
    private String state;// 订单状态码 - 000未付款-确认付款、101已付款-确认发货、202已发货-确认收货、200已完成-订单完成、404订单取消
    private String remarks;// 订单备注：快递
    private String consignee;// 收货人
    private String phone;// 联系方式
    private String content;// 收货地址
    private List<OrderItemOfProduct> orderitems;// 订单的商品详情列表

    public OrderOfUserInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public Date getOdate() {
        return odate;
    }

    public void setOdate(Date odate) {
        this.odate = odate;
    }

    public String getOdatestr() {
        if (odate != null) {
            odatestr = DateUtils.dateToString(odate, "yyyy-MM-dd HH:mm:ss");
        }
        return odatestr;
    }

    public void setOdatestr(String odatestr) {
        this.odatestr = odatestr;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<OrderItemOfProduct> getOrderitems() {
        return orderitems;
    }

    public void setOrderitems(List<OrderItemOfProduct> orderitems) {
        this.orderitems = orderitems;
    }

    @Override
    public String toString() {
        return "OrderOfUserInfo{" +
                "uid=" + uid +
                ", oid='" + oid + '\'' +
                ", odate=" + odate +
                ", odatestr='" + odatestr + '\'' +
                ", total=" + total +
                ", state='" + state + '\'' +
                ", remarks='" + remarks + '\'' +
                ", consignee='" + consignee + '\'' +
                ", phone='" + phone + '\'' +
                ", content='" + content + '\'' +
                ", orderitems=" + orderitems +
                '}';
    }
}
