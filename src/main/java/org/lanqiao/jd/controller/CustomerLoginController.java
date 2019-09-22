package org.lanqiao.jd.controller;

import org.lanqiao.jd.entity.CustomerLogin;
import org.lanqiao.jd.service.CustomerLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CustomerLoginController {
    @Autowired
    CustomerLoginService cls;
    @RequestMapping("/insertlogin")
    public int insertSelective(CustomerLogin customerLogin){
        return cls.insertSelective(customerLogin);
    }

    @RequestMapping("/checkloginname")
    public int checkloginName(String loginName){
        return cls.checkloginName(loginName);
    }

    @RequestMapping("/loginid")
    public int loginId(String loginName){
        return cls.loginId(loginName);
    }
}
