package org.lanqiao.jd.service;

import org.lanqiao.jd.mapper.CustomerInfoMapper;
import org.lanqiao.jd.entity.CustomerInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service
public class CustomerInfoServiceImpl implements CustomerInfoService {
    @Autowired
    CustomerInfoMapper cm;
//    @Override
//    public int inserttel(BigDecimal tel){return cm.inserttel(tel);}

    @Override
    public int insertSelective(CustomerInfo customerInfo){
        return cm.insertSelective(customerInfo);
    };

    @Override
    public int checktel(BigDecimal tel){
        return cm.checktel(tel);
    }
}
