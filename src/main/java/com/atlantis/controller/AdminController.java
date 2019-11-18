package com.atlantis.controller;

import com.atlantis.domain.Admin;
import com.atlantis.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    // 登录
    @RequestMapping("login")
    public String login(Admin admin, HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 调用服务层，根据账号和密码在数据库中查询是否有匹配项，返回结果存放在currentAdmin
        Admin currentAdmin = adminService.findAdminOfLogin(admin);
        if (null != currentAdmin) {
            // 登录成功
            HttpSession session = request.getSession();
            session.setAttribute("currentAdmin", currentAdmin);
            //request.getRequestDispatcher("success").forward(request, response);
            return "DataCount";
        } else {
            // 登录失败
            request.setAttribute("error", "账号或密码错误，请重新输入");
            //request.getRequestDispatcher("login.jsp").forward(request, response);
            return "forward:login.jsp";
        }
    }

    // 退出
    @RequestMapping("/logout")
    public void Logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        session.removeAttribute("currentAdmin");// 清空账号密码
        response.sendRedirect("login.jsp");// 跳转到主页
    }

    // 修改管理员密码
    @RequestMapping("/updatePassword")
    public ModelAndView updatePassword(Admin admin, String newpwd) throws Exception {
        ModelAndView mv = new ModelAndView();
        // 验证原始账号密码是否正确
        Admin rAdmin = adminService.findAdminOfLogin(admin);
        if (rAdmin != null) {
            //修改密码
            rAdmin.setApassword(newpwd);
            adminService.updateAdminOfPassword(rAdmin);
            mv.addObject("error","修改密码成功，请重新登录！");
            mv.setViewName("forward:/login.jsp");
        } else {
            mv.addObject("error","密码错误，取消此次操作！");
            mv.setViewName("DataCount");
        }
        return mv;
    }
}
