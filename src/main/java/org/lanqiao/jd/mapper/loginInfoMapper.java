package org.lanqiao.jd.mapper;

import org.lanqiao.jd.entity.loginInfo;

import java.util.List;

public interface loginInfoMapper {
    int deleteByPrimaryKey(Integer customerLoginId);

    int insert(loginInfo record);

    int insertSelective(loginInfo record);

    loginInfo selectByPrimaryKey(Integer customerLoginId);

    int updateByPrimaryKeySelective(loginInfo record);

    int updateByPrimaryKey(loginInfo record);

    List<loginInfo> login(String name, String password);
}