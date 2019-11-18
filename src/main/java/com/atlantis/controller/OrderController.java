package com.atlantis.controller;

import com.atlantis.domain.OrderOfUserInfo;
import com.atlantis.service.OrderService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/OrderManage")
    public ModelAndView OrderManage(
            @RequestParam(name = "search", required = true, defaultValue = "") String search,
            @RequestParam(name = "page", required = true, defaultValue = "1") int page,
            @RequestParam(name = "size", required = true, defaultValue = "5") int size) throws Exception {
        // 解决get请求中文乱码
        byte[] bytes = search.getBytes("iso-8859-1");
        search = new String(bytes, "utf-8");

        ModelAndView mv = new ModelAndView();
        List<OrderOfUserInfo> list = orderService.findOrderOfUserInfoBySearch(search, page, size);
        // PageInfo 是 PageHelper提供的分页Bean
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("pageInfo", pageInfo);
        mv.addObject("search", search);
        mv.setViewName("OrderManage");
        return mv;
    }

    /*
     * 订单状态码 000未付款-确认付款、101已付款-确认发货、202已发货-确认收货、200已完成-订单完成、404订单取消
     */
    public static final String UNPAIDSTATE = "000"; // 订单未付款
    public static final String PAIDSTATE = "101"; // 订单已付款
    public static final String SHIPPEDSTATE = "202"; // 订单已发货
    public static final String SUCCESSSTATE = "200"; // 订单已完成
    public static final String FAILSTATE = "404"; // 订单已取消

    @RequestMapping(value = "/operateOrder")
    public String operateOrder(
            @RequestParam(name = "search", required = true, defaultValue = "") String search,
            @RequestParam(name = "page", required = true, defaultValue = "1") int page,
            @RequestParam(name = "size", required = true, defaultValue = "5") int size,
            String oid, String state) throws Exception {
        // 解决get请求中文乱码
        byte[] bytes = search.getBytes("iso-8859-1");
        search = new String(bytes, "utf-8");

        if (UNPAIDSTATE.equals(state)) {
            // 订单未付款
            orderService.updateOrderStateByOid(UNPAIDSTATE, oid);
        } else if (PAIDSTATE.equals(state)) {
            // 订单已付款
            orderService.updateOrderStateByOid(PAIDSTATE, oid);
        } else if (SHIPPEDSTATE.equals(state)) {
            // 订单已发货
            orderService.updateOrderStateByOid(SHIPPEDSTATE, oid);
        } else if (SUCCESSSTATE.equals(state)) {
            // 订单完成
            orderService.updateOrderStateByOid(SUCCESSSTATE, oid);
        } else if (FAILSTATE.equals(state)) {
            // 订单已取消
            orderService.updateOrderStateByOid(FAILSTATE, oid);
        }
        String path = "redirect:/OrderManage?page=" + page + "&size=" + size + "&search=" + search;
        return path;
    }
}