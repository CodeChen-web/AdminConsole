package com.atlantis.dao;

import com.atlantis.domain.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DataCountDao {
    /**
     * 根据参数获取用户注册数量：0今天、后几天为正，前几天为负
     */
    public Integer getUserCountOfDay(int days);

    /**
     * 获取所有商品分类信息
     */
    public List<Category> getAllCategoryName();

    /**
     * 根据商品分类id查询所有此分类的商品
     */
    public Integer getCategoryOfProduct(int cid);

    /**
     * 根据参数获取未完成订单的数量：0今天、后几天为正，前几天为负
     */
    public Integer getUnSuccessOrderCount(int days);

    /**
     * 根据参数获取取消订单的数量：0今天、后几天为正，前几天为负
     */
    public Integer getFailOrderCount(int days);

    /**
     * 根据参数获取完成订单的数量：0今天、后几天为正，前几天为负
     */
    public Integer getSuccessOrderCount(int days);

    /**
     * 根据参数获取订单总的数量：0今天、后几天为正，前几天为负
     */
    public Integer getAllOrderCount(int days);

    /**
     * 根据参数获取非取消订单的订单订单总价之和：0今天、后几天为正，前几天为负
     */
    public Double getOrderTotal(int days);
}