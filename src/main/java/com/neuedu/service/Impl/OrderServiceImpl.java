package com.neuedu.service.Impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.neuedu.consts.Const;
import com.neuedu.dao.OrderItemMapper;
import com.neuedu.dao.OrderMapper;
import com.neuedu.dao.ShippingMapper;
import com.neuedu.dao.UserInfoMapper;
import com.neuedu.pojo.Order;
import com.neuedu.pojo.OrderItem;
import com.neuedu.pojo.Shipping;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IOrderService;
import com.neuedu.utils.DateUtils;
import com.neuedu.vo.OrderItemVO;
import com.neuedu.vo.OrderVO;
import com.neuedu.vo.ShippingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import java.util.List;
@PropertySource(value = "classpath:jdbc.properties")
@Service
public class OrderServiceImpl implements IOrderService{
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    OrderItemMapper orderItemMapper;
    @Autowired
    ShippingMapper shippingMapper;
    @Autowired
    UserInfoMapper userInfoMapper;
    @Value("${imageHost}")
    private String imageHost;
    @Override
    public PageInfo list(Integer pageNum, Integer pageSize) {
        Page page=PageHelper.startPage(pageNum,pageSize);
        List<Order> orderList= Lists.newArrayList();
        orderList=orderMapper.selectAll();
        List<OrderVO> orderVOList=Lists.newArrayList();
        int i=0;
        for(Order order:orderList){
            List<OrderItem> orderItemList=orderItemMapper.findOrderItemByOrderNo(order.getOrderNo());
            OrderVO orderVO=assembleOrderVO(order,orderItemList,order.getShippingId());
            page.set(i,orderVO);
            orderVOList.add(orderVO);
            i++;
        }
        PageInfo pageInfo=new PageInfo(page);
        return pageInfo;
    }

    @Override
    public OrderVO detail(Long orderNo) {
        //根据orderNo查询订单
        Order order=orderMapper.findOrderByOrderNo(orderNo);
        //获取orderVo
        List<OrderItem> orderItemList=orderItemMapper.findOrderItemByOrderNo(order.getOrderNo());
        OrderVO orderVO=assembleOrderVO(order,orderItemList,order.getShippingId());
        return orderVO;
    }

    @Override
    public int send(Long orderNo) {
        int result=-1;
        Order order=orderMapper.findOrderByOrderNo(orderNo);
        if(order.getStatus()==Const.OrderStatusEnum.ORDER_PAYED.getCode()){
            order.setStatus(Const.OrderStatusEnum.ORDER_SEND.getCode());
            result=orderMapper.send(order);
        }
        return result;
    }

    private OrderVO assembleOrderVO(Order order,List<OrderItem> orderItemList,Integer shippingId) {
        OrderVO orderVO=new OrderVO();
        List<OrderItemVO> orderItemVOList=Lists.newArrayList();
        for(OrderItem orderItem:orderItemList){
            OrderItemVO orderItemVO=assembleOrderItemVO(orderItem);
            orderItemVOList.add(orderItemVO);
        }
        orderVO.setOrderItemVoList(orderItemVOList);
        orderVO.setImageHost(imageHost);
        Shipping shipping=shippingMapper.selectByPrimaryKey(shippingId);
        if(shipping!=null){
            orderVO.setShippingId(shippingId);
            ShippingVO shippingVO=assembleShippingVO(shipping);
            orderVO.setShippingVo(shippingVO);
            orderVO.setReceiverName(shipping.getReceiverName());
        }
        orderVO.setStatus(order.getStatus());
        Const.OrderStatusEnum orderStatusEnum=Const.OrderStatusEnum.codeOf(order.getStatus());
        if(orderStatusEnum!=null){
            orderVO.setStatusDesc(orderStatusEnum.getDesc());
        }
        orderVO.setUserId(order.getUserId());
        UserInfo userInfo=userInfoMapper.selectByPrimaryKey(order.getUserId());
        orderVO.setUserName(userInfo.getUsername());
        orderVO.setPostage(order.getPostage());
        orderVO.setPayment(order.getPayment());
        orderVO.setPaymentTime(DateUtils.dateToStr(order.getPaymentTime()));
        orderVO.setSendTime(DateUtils.dateToStr(order.getSendTime()));
        orderVO.setPaymentType(order.getPaymentType());
        Const.PaymentEnum paymentEnum=Const.PaymentEnum.codeOf(order.getPaymentType());
        if(paymentEnum!=null){
            orderVO.setPaymentTypeDesc(paymentEnum.getDesc());
        }
        orderVO.setCreateTime(DateUtils.dateToStr(order.getCreateTime()));
        orderVO.setOrderNo(order.getOrderNo());
        return orderVO;
    }

    private OrderItemVO assembleOrderItemVO(OrderItem orderItem) {
        OrderItemVO orderItemVO=new OrderItemVO();

        if(orderItem!=null){
            orderItemVO.setQuantity(orderItem.getQuantity());
            orderItemVO.setCreateTime(DateUtils.dateToStr(orderItem.getCreateTime()));
            orderItemVO.setCurrentUnitPrice(orderItem.getCurrentUnitPrice());
            orderItemVO.setOrderNo(orderItem.getOrderNo());
            orderItemVO.setProductId(orderItem.getProductId());
            orderItemVO.setProductImage(orderItem.getProductImage());
            orderItemVO.setProductName(orderItem.getProductName());
            orderItemVO.setTotalPrice(orderItem.getTotalPrice());
        }

        return orderItemVO;
    }

    private ShippingVO assembleShippingVO(Shipping shipping) {
        ShippingVO shippingVO=new ShippingVO();
        if(shipping!=null){
            shippingVO.setReceiverAddress(shipping.getReceiverAddress());
            shippingVO.setReceiverCity(shipping.getReceiverCity());
            shippingVO.setReceiverDistrict(shipping.getReceiverDistrict());
            shippingVO.setReceiverMobile(shipping.getReceiverMobile());
            shippingVO.setReceiverName(shipping.getReceiverName());
            shippingVO.setReceiverProvince(shipping.getReceiverProvince());
            shippingVO.setReceiverZip(shipping.getReceiverZip());
            shippingVO.setReceiverPhone(shipping.getReceiverPhone());
        }
        return shippingVO;
    }
}
