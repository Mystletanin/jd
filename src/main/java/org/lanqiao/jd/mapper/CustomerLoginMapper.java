package org.lanqiao.jd.mapper;

import org.lanqiao.jd.entity.CustomerLogin;

public interface CustomerLoginMapper {
    int deleteByPrimaryKey(Integer customerLoginId);

    int insert(CustomerLogin record);

    int insertSelective(CustomerLogin customerLogin);

    CustomerLogin selectByPrimaryKey(Integer customerLoginId);

    int updateByPrimaryKeySelective(CustomerLogin record);

    int updateByPrimaryKey(CustomerLogin record);

    int checkloginName(String loginName);

    int loginId(String loginName);
}