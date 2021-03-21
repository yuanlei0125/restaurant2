package com.j170502.cateringmange.interceptor;

import com.j170502.cateringmange.entity.User;
import com.j170502.cateringmange.service.JournalService;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyInterceptor implements HandlerInterceptor{
    @Resource
    private JournalService journalService;
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session=request.getSession();
        User user =(User) session.getAttribute("user");
        if(user!=null){
            return true;
        }else{
            response.sendRedirect(request.getContextPath());
            return false;
        }
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        String url=request.getRequestURI();
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");
        journalService.saveLog(url,user);
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
