package org.lanqiao.jd.entity;

import java.util.Date;

public class loginInfo {
    private Integer customerLoginId;

    private String loginName;

    private String password;

    private Date registerTime;

    public Integer getCustomerLoginId() {
        return customerLoginId;
    }

    public void setCustomerLoginId(Integer customerLoginId) {
        this.customerLoginId = customerLoginId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    @Override
    public String toString() {
        return "loginInfo{" +
                "customerLoginId=" + customerLoginId +
                ", loginName='" + loginName + '\'' +
                ", password='" + password + '\'' +
                ", registerTime=" + registerTime +
                '}';
    }
}