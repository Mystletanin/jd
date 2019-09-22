package org.lanqiao.jd.service;

import org.lanqiao.jd.entity.CustomerLogin;

public interface CustomerLoginService {
    public int insertSelective(CustomerLogin customerLogin);
    public int checkloginName(String loginName);
    public int loginId(String loginName);
}
