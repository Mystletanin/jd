package org.lanqiao.jd.mapper;

import org.lanqiao.jd.entity.CustomerInfo;

import java.math.BigDecimal;

public interface CustomerInfoMapper {
    //注册
    int checktel(BigDecimal tel);
    //登录
    CustomerInfo selectId(String loginName);

    int deleteByPrimaryKey(Integer customerId);

    int insert(CustomerInfo record);

    int insertSelective(CustomerInfo record);

    CustomerInfo selectByPrimaryKey(Integer customerId);

    int updateByPrimaryKeySelective(CustomerInfo record);

    int updateByPrimaryKey(CustomerInfo record);
}