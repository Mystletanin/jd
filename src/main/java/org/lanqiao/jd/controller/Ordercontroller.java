package org.lanqiao.jd.controller;

import org.lanqiao.jd.entity.Order;
import org.lanqiao.jd.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class Ordercontroller {
    @Autowired
    OrderService orderService;

    @RequestMapping("/getallpronpd/{customerId}")
    public List<Order> getallpronpd (@PathVariable Integer customerId){
        return orderService.getallpronpd(customerId);
    }
    @RequestMapping("/deleteOrder")
    public  int deleteOrder(  Integer orderId){
        return  orderService.deleteOrder(orderId);
}

}
