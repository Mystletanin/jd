package org.lanqiao.jd.controller;

import org.lanqiao.jd.entity.CustomerInfo;
import org.lanqiao.jd.service.CustomerInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

@RestController
public class CustomerInfoController {
    @Autowired
    CustomerInfoService cs;
//    @RequestMapping("/inserttel")
//    public int inserttel(BigDecimal tel){return cs.inserttel(tel);}

    @RequestMapping("/insertinfo")
    public int insertSelective(CustomerInfo customerInfo){
        return cs.insertSelective(customerInfo);
    }

    @RequestMapping("/checktel")
    public int checktel(BigDecimal tel){
        return cs.checktel(tel);
    }
}
