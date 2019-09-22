package com.neuedu.controller;


import com.github.pagehelper.PageInfo;
import com.neuedu.consts.Const;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IOrderService;
import com.neuedu.vo.OrderVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/order/")
public class OrderController {
    @Autowired
    IOrderService orderService;
    @RequestMapping("list")
    public String list(@RequestParam(value = "pageNum",required =false,defaultValue = "1")Integer pageNum,
                       @RequestParam(name="pageSize",required = false,defaultValue = "5")Integer pageSize,
                       HttpServletRequest request){
        PageInfo pageInfo=orderService.list(pageNum,pageSize);
        request.setAttribute("orderlist",pageInfo);
        return "order/orderlist";
    }

    @RequestMapping("detail")
    public String detail(Long orderNo,
                         HttpServletRequest request){
        OrderVO orderVO=orderService.detail(orderNo);
        request.setAttribute("orderdetail",orderVO);
        return "order/orderdetail";
    }
    @RequestMapping("send")
    public String send(Long orderNo,
                         HttpServletRequest request){
        int result=orderService.send(orderNo);
        OrderVO orderVO=orderService.detail(orderNo);
        request.setAttribute("orderdetail",orderVO);
        return "order/orderdetail";
    }
}
