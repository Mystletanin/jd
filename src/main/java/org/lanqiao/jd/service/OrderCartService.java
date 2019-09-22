package org.lanqiao.jd.service;

import org.lanqiao.jd.entity.OrderCart;

import java.util.List;

public interface OrderCartService {
    public int createOrder(OrderCart ordercart, Integer productAmount);
    //计算购物车数目
    int orderCartCount(Integer CustomerId);

    public List<OrderCart> getAllCart(Integer customerId);
    int deleteCart(Integer cartId);
    int updateNum(Integer productAmount, Integer cartId);
    int insertOrderDetail(Integer orderId, Integer productAmount, Integer productId);
    int insertOrder(Integer orderId, Integer customerId);
}
