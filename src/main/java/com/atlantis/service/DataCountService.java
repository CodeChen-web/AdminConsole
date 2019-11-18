package com.atlantis.service;

import org.json.JSONObject;

public interface DataCountService {
    /**
     * 用户前七天的注册数量
     */
    public JSONObject writeJOSNOfUserCount();

    /**
     * 商品信息与商品分类信息
     */
    public JSONObject writeJOSNOfProductCategory();

    /**
     * 订单统计信息
     */
    public JSONObject writeJOSNOfOrder();
}