package com.neuedu.interceptors;

import com.neuedu.consts.Const;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthorityInterceptor implements HandlerInterceptor{
    @Autowired
    IUserService userService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        HttpSession session=request.getSession();
        String username=null;
        String password=null;
        Cookie[] cookies=request.getCookies();
        if(cookies!=null&&cookies.length>0){
            for(Cookie c:cookies){
                if(c.getName().equals("username")){
                    username=c.getValue();
                }
                if(c.getName().equals("password")){
                    password=c.getValue();
                }
            }
        }
        if(username!=null&&password!=null){
            UserInfo userinfo=new UserInfo();
            userinfo.setUsername(username);
            userinfo.setPassword(password);
            UserInfo resultuserinfo=userService.login(userinfo);
            if(resultuserinfo!=null){
                session.setAttribute(Const.CURRENT_USER,userinfo);
            }
        }
        if((UserInfo)session.getAttribute(Const.CURRENT_USER)==null){
            try {
                response.sendRedirect("/user/login");
            } catch (IOException e) {
                e.printStackTrace();
            }
            return false;

        }else {
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

    }
}
