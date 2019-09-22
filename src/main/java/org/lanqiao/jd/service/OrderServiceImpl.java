package org.lanqiao.jd.service;

import org.lanqiao.jd.mapper.OrderMapper;
import org.lanqiao.jd.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;

    @Override
    public List<Order> getallpronpd(Integer customerId) {
        return orderMapper.getallpronpd(customerId);
    }

    @Override
    public int deleteOrder(Integer orderId) {
        return orderMapper.deleteOrder(orderId);
    }


}
