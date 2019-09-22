package org.lanqiao.jd.mapper;

import org.lanqiao.jd.entity.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderMapper {
    int deleteOrder(Integer orderId);

    int insert(Order record);

    int insertSelective(Order record);


    List<Order> getallpronpd(Integer customerId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}