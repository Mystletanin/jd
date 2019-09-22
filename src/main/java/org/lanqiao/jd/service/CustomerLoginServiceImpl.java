package org.lanqiao.jd.service;

import org.lanqiao.jd.mapper.CustomerLoginMapper;
import org.lanqiao.jd.entity.CustomerLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerLoginServiceImpl implements CustomerLoginService {
    @Autowired
    CustomerLoginMapper clm;
    @Override
    public int insertSelective(CustomerLogin customerLogin){
        return clm.insertSelective(customerLogin);
    }

    @Override
    public int checkloginName(String loginName){
        return clm.checkloginName(loginName);
    }

    @Override
    public int loginId(String loginName){
        return clm.loginId(loginName);
    }
}
