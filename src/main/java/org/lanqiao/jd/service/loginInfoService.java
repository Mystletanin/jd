package org.lanqiao.jd.service;

import org.lanqiao.jd.entity.CustomerInfo;
import org.lanqiao.jd.entity.loginInfo;

import java.util.List;

public interface loginInfoService {
//    public boolean login(String name, String password);
        public List<loginInfo> login(String name, String password);

        CustomerInfo selectId(String loginName);
}
