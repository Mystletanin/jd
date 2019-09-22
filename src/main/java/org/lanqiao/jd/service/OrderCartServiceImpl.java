package org.lanqiao.jd.service;

import org.lanqiao.jd.mapper.OrderCartMapper;
import org.lanqiao.jd.entity.OrderCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderCartServiceImpl implements OrderCartService {
@Autowired
OrderCartMapper orderCartMapper;
    @Override
    public List<OrderCart> getAllCart(Integer customerId) {
        return orderCartMapper.getAllCart(customerId);
    }

    @Override
    public int deleteCart(Integer cartId) {
        return orderCartMapper.deleteCart(cartId);
    }

    @Override
    public int updateNum(Integer productAmount,Integer cartId) {
        return orderCartMapper.updateNum(productAmount,cartId);
    }

    @Override
    public int insertOrder(Integer orderId,Integer customerId){
        return orderCartMapper.insertOrder(orderId,customerId);
    }
    @Override
    public int insertOrderDetail(Integer orderId, Integer productAmount, Integer productId){
        return orderCartMapper.insertOrderDetail(orderId,productAmount,productId);
    }

    @Override
    public int createOrder(OrderCart ordercart, Integer productAmount) {
        orderCartMapper.insertSelective(ordercart);
        return 0;
    }

    @Override
    public int orderCartCount(Integer CustomerId) {
        return orderCartMapper.orderCartCount(CustomerId);
    }
}
