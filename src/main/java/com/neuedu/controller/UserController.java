package com.neuedu.controller;

import com.neuedu.consts.Const;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IUserService;
import com.neuedu.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user/")
public class UserController {
    @Autowired
    IUserService userService;

    @RequestMapping(value="login",method= RequestMethod.GET)
    public String login(){
        return "login";
    }
    @RequestMapping(value="login",method= RequestMethod.POST)
    public String login(UserInfo userInfo,
                        HttpSession session,
                        HttpServletResponse response){
        String md5password=MD5Utils.getMD5Code(userInfo.getPassword());
        userInfo.setPassword(md5password);
        UserInfo loginUserInfo=userService.login(userInfo);
        if(loginUserInfo!=null){
            Cookie username_cookie=new Cookie("username",loginUserInfo.getUsername());
            Cookie password_cookie=new Cookie("password",loginUserInfo.getPassword());
            username_cookie.setMaxAge(60*60*24*7);
            password_cookie.setMaxAge(60*60*24*7);
            response.addCookie(username_cookie);
            response.addCookie(password_cookie);
            session.setAttribute(Const.CURRENT_USER,loginUserInfo);
            return "redirect:home";
        }
        return "login";
    }

        @RequestMapping("home")
        public String index(){
            return "home/home";
        }

        @RequestMapping("alluser")
        public String allUser(HttpServletRequest request){
            List<UserInfo> userInfoList=userService.findAllUser();
            request.setAttribute("userlist",userInfoList);
            return "userlist";
        }

        @RequestMapping("logout")
        public String logout(HttpServletRequest request,
                             HttpServletResponse response){
        HttpSession session=request.getSession();
        session.invalidate();
        Cookie usernameCookie = new Cookie("username",null);
        usernameCookie.setMaxAge(0);
        Cookie passwordCookie = new Cookie("password",null);
        passwordCookie.setMaxAge(0);
        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);
        return "redirect:login";
        }

        @RequestMapping(value = "add",method = RequestMethod.GET)
        public String add(){
            return "useradd";
        }
        @RequestMapping(value = "add",method = RequestMethod.POST)
        public String add(UserInfo userInfo){
            String md5password= MD5Utils.getMD5Code(userInfo.getPassword());
            userInfo.setPassword(md5password);
            userService.addUser(userInfo);
            return "redirect:/user/alluser";
        }

        @RequestMapping(value = "delete/{id}")
        public String delete(@PathVariable("id")Integer userId){
            int count=userService.delete(userId);
            return "redirect:/user/alluser";
        }

        @RequestMapping(value = "update/{id}",method = RequestMethod.GET)
        public String update(@PathVariable("id")Integer userId,
                         HttpServletRequest request){
        UserInfo userInfo=userService.findById(userId);
        request.setAttribute("userinfo",userInfo);
        return "userupdate";
        }

        @RequestMapping(value = "update/{id}",method = RequestMethod.POST)
        public String update(UserInfo userInfo,
                         HttpServletRequest request){
            int count=userService.updateUser(userInfo);
            request.setAttribute("userinfo",userInfo);
            return "redirect:/user/alluser";
        }
    }

