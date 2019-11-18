package com.atlantis.dao;

import com.atlantis.domain.OrderItemOfProduct;
import com.atlantis.domain.OrderOfUserInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDao {
    // 查询所有订单详情
    public List<OrderOfUserInfo> findAllOrderOfUserInfo() throws Exception;

    // 根据查询条件查询订单详情
    public List<OrderOfUserInfo> findOrderOfUserInfoBySearch(String search) throws Exception;

    // 根据oid查询订单中包含的商品详情
    public List<OrderItemOfProduct> findOrderItemOid(String oid) throws Exception;

    // 根据oid更新订单状态码
    public int updateOrderStateByOid(@Param("state") String state, @Param("oid") String oid) throws Exception;
}