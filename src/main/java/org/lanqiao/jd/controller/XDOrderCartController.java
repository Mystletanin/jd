package org.lanqiao.jd.controller;

import org.lanqiao.jd.entity.OrderCart;
import org.lanqiao.jd.service.OrderCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class XDOrderCartController
{
    @Autowired
    OrderCartService orderCartService;
    @RequestMapping("/getAllCart")
    public List<OrderCart> getAllCart(Integer customerId){
        return orderCartService.getAllCart(customerId);
    }
    @RequestMapping("/deleteCart")
    int deleteCart(Integer cartId){
        return orderCartService.deleteCart(cartId);
    }
    @RequestMapping("/updateNum")
    int updateNum(Integer productAmount,Integer cartId){
        return orderCartService.updateNum(productAmount,cartId);
    }
    @RequestMapping("/insertOrder1")
    int insertOrder(Integer orderId,Integer customerId){
        return orderCartService.insertOrder(orderId,customerId);
    }
    @RequestMapping("/insertOrderDetail")
    int insertOrderDetail(Integer orderId, Integer productAmount, Integer productId){
        return orderCartService.insertOrderDetail(orderId,productAmount,productId);
    }
}
