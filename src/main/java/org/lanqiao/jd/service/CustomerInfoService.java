package org.lanqiao.jd.service;

import org.lanqiao.jd.entity.CustomerInfo;

import java.math.BigDecimal;

public interface CustomerInfoService {
//    public int inserttel(BigDecimal tel);
    public int insertSelective(CustomerInfo customerInfo);

    public int checktel(BigDecimal tel);
}
