package com.atlantis.domain;

import com.atlantis.utils.DateUtils;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 * Order - 订单实体类
 */
public class Order implements Serializable {
    private String oid; // 订单编号
    private Date odate;// 订单时间
    private String odatestr;
    private Double total;// 总价
    private String state;// 状态码000未付款-确认付款、101已付款-确认发货、202已发货-确认收货、200已完成-订单完成、404订单取消
    private String remarks;// 备注
    private Integer itemid;//
    private Integer uid;// 该订单属于哪个用户
    private Integer addressid;// 订单的收货地址信息
    private List<OrderItem> items;// 订单中商品列表详情

    public Order() {
        super();
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

    public Integer getItemid() {
        return itemid;
    }

    public void setItemid(Integer itemid) {
        this.itemid = itemid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }
}
