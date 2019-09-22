package org.lanqiao.jd.controller;

import org.lanqiao.jd.entity.CustomerInfo;
import org.lanqiao.jd.entity.loginInfo;
import org.lanqiao.jd.service.loginInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/*
用户登录--用户登录表
 */
@RestController
public class loginInfoController {
    @Autowired
    loginInfoService ls;

//    @RequestMapping("/login")
//    public boolean login(String name, String password) {
//        return ls.login(name, password);
//    }
@RequestMapping ("/login")
     public List<loginInfo> login(String name, String password) {
    return ls.login(name, password); }

    @RequestMapping ("/selectId")
    public CustomerInfo selectId(String loginName) {
        return ls.selectId(loginName);
    }

//    @RequestMapping("setCookie")
//    public String setCookie() {
//        return setCookie();
//    }
//
//    @RequestMapping("setCookie")
//    public String setCookie(HttpServletResponse response){
//        Cookie cookie = new Cookie("test","same");
//        cookie.setPath("/");
//        response.addCookie(cookie);
//        return "success";
//    }
}
