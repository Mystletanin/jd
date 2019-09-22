package org.lanqiao.jd.service;

import org.lanqiao.jd.entity.CustomerInfo;
import org.lanqiao.jd.entity.loginInfo;
import org.lanqiao.jd.mapper.CustomerInfoMapper;
import org.lanqiao.jd.mapper.loginInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class loginInfoServiceImpl implements loginInfoService {
    @Autowired
    loginInfoMapper loginM;
    @Autowired
    CustomerInfoMapper customerInfoMapper;

    @Override
    public List<loginInfo> login(String name, String password) {
        return loginM.login(name,password);
    }

    @Override
    public CustomerInfo selectId(String loginName) {
        return customerInfoMapper.selectId(loginName);
    }

//    @Override
////    public boolean login(String name,String password){
////        List<loginInfo>list=loginM.login(name,password);
////        return list.size()>=1? true:false;
////    }


}
