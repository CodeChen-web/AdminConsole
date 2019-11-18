package com.atlantis.service;

import com.atlantis.domain.OrderItemOfProduct;
import com.atlantis.domain.OrderOfUserInfo;

import java.util.List;

public interface OrderService {
    // 根据查询条件查询订单详情
    public List<OrderOfUserInfo> findOrderOfUserInfoBySearch(String search, int page, int size) throws Exception;

    // 根据oid更新订单状态码
    public int updateOrderStateByOid(String state, String oid) throws Exception;

}