package com.neuedu.service;

import com.github.pagehelper.PageInfo;
import com.neuedu.vo.OrderVO;

public interface IOrderService {
    public PageInfo list(Integer pageNum,Integer pageSize);

    public OrderVO detail(Long orderNo);

    public int send(Long orderNo);
}
