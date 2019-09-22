package org.lanqiao.jd.mapper;

import org.lanqiao.jd.entity.OrderCart;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderCartMapper {
    //计算购物车数目
    int orderCartCount(Integer CustomerId);

    int deleteByPrimaryKey(Integer cartId);

    int insert(OrderCart record);

    int insertSelective(OrderCart record);

    OrderCart selectByPrimaryKey(Integer cartId);

    int updateByPrimaryKeySelective(OrderCart record);

    int updateByPrimaryKey(OrderCart record);
    List<OrderCart> getAllCart(Integer customerId);
    int deleteCart(Integer cartId);
    int updateNum(Integer productAmount, Integer cartId);
    int insertOrderDetail(Integer orderId, Integer productAmount, Integer productId);
    int insertOrder(Integer orderId, Integer customerId);
}