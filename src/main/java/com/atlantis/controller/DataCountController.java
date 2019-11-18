package com.atlantis.controller;

import com.atlantis.service.DataCountService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
public class DataCountController {
    @Autowired
    private DataCountService dataCountService;

    @RequestMapping(value = "/DataCount")
    public String DataCount() throws Exception {
        return "DataCount";
    }

    @RequestMapping(value = "/userAjax")
    public void userAjax(HttpServletRequest request, HttpServletResponse response) throws Exception{
        JSONObject userJson = dataCountService.writeJOSNOfUserCount();
        //System.out.println(userJson);
        // 设置响应的数据格式为json
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(String.valueOf(userJson));
    }

    @RequestMapping(value = "/productAjax")
    public void productAjax(HttpServletRequest request, HttpServletResponse response) throws Exception{
        JSONObject productJson = dataCountService.writeJOSNOfProductCategory();
        //System.out.println(productJson);
        // 设置响应的数据格式为json
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(String.valueOf(productJson));
    }

    @RequestMapping(value = "/orderAjax")
    public void orderAjax(HttpServletRequest request, HttpServletResponse response) throws Exception{
        JSONObject orderJson = dataCountService.writeJOSNOfOrder();
        //System.out.println(orderJson);
        // 设置响应的数据格式为json
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(String.valueOf(orderJson));
    }
}
