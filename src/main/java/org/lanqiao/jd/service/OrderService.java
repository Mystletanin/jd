package org.lanqiao.jd.service;

import org.lanqiao.jd.entity.Order;

import java.util.List;

public interface OrderService {
    public List<Order> getallpronpd(Integer customerId);
     public int deleteOrder(Integer orderId);

}
