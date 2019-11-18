package com.atlantis.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {
    /**
     * 预处理，Controller方法执行前执行。
     * 返回值为false时不放行，不会执行后面任何代码。
     * 返回值为true时放行，执行下一个拦截器，若没有则执行Controller方法。
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //System.out.println("Interceptor：preHandle()...预处理");
        String url = request.getServletPath();
        if (!"".equals(url)) {
            Object currentAdmin = request.getSession().getAttribute("currentAdmin");
            if (currentAdmin == null) {
                // 无session，登录失效
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return false;
            }
        }
        return true;
    }

    /**
     * 后处理
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // System.out.println("Interceptor：postHandle()...后处理");
    }

    /**
     * success.jsp页面执行后，该方法会被执行
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        //System.out.println("Interceptor：afterCompletion()...最后处理");
    }
}
