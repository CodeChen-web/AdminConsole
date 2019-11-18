package com.atlantis.controller;

import com.atlantis.domain.User;
import com.atlantis.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    // 用户列表
    @RequestMapping(value = "/UserManage")
    public ModelAndView UserManage(
            @RequestParam(name = "search", required = true, defaultValue = "") String search,
            @RequestParam(name = "page", required = true, defaultValue = "1") int page,
            @RequestParam(name = "size", required = true, defaultValue = "5") int size) throws Exception {
        // 解决get请求中文乱码
        byte[] bytes = search.getBytes("iso-8859-1");
        search = new String(bytes, "utf-8");

        ModelAndView mv = new ModelAndView();
        List<User> users = userService.findUserOfSearch(search, page, size);
        // PageInfo 是 PageHelper提供的分页Bean
        PageInfo pageInfo = new PageInfo(users);
        mv.addObject("pageInfo", pageInfo);
        mv.addObject("search",search);
        mv.setViewName("UserManage");
        return mv;
    }
}
