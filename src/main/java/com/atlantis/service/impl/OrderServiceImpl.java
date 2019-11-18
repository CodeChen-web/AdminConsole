package com.atlantis.service.impl;

import com.atlantis.dao.OrderDao;
import com.atlantis.domain.OrderItemOfProduct;
import com.atlantis.domain.OrderOfUserInfo;
import com.atlantis.service.OrderService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service()
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public List<OrderOfUserInfo> findOrderOfUserInfoBySearch(String search, int page, int size) throws Exception {
        if ("".equals(search) || search == null) {
            PageHelper.startPage(page, size);
            List<OrderOfUserInfo> info = orderDao.findAllOrderOfUserInfo();
            for (OrderOfUserInfo orderOfUserInfo : info) {
                List<OrderItemOfProduct> items = orderDao.findOrderItemOid(orderOfUserInfo.getOid());
                orderOfUserInfo.setOrderitems(items);
            }
            return info;
        }
        PageHelper.startPage(page, size);
        List<OrderOfUserInfo> info = orderDao.findOrderOfUserInfoBySearch("%" + search + "%");
        for (OrderOfUserInfo orderOfUserInfo : info) {
            List<OrderItemOfProduct> items = orderDao.findOrderItemOid(orderOfUserInfo.getOid());
            orderOfUserInfo.setOrderitems(items);
        }
        return info;
    }

    @Override
    public int updateOrderStateByOid(String state, String oid) throws Exception {
        return orderDao.updateOrderStateByOid(state, oid);
    }
}
