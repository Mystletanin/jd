package org.lanqiao.jd.entity;

import java.math.BigDecimal;

public class CustomerInfo {
    loginInfo loginInfo;

    public org.lanqiao.jd.entity.loginInfo getLoginInfo() {
        return loginInfo;
    }

    public void setLoginInfo(org.lanqiao.jd.entity.loginInfo loginInfo) {
        this.loginInfo = loginInfo;
    }
    //新加取id
    private Integer customerId;

    private String customerName;

    private String sex;

    private BigDecimal tel;

    private String email;

    private Integer integral;

    private Integer balance;

    private Integer loginId;

    private Integer levelId;

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public BigDecimal getTel() {
        return tel;
    }

    public void setTel(BigDecimal tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getIntegral() {
        return integral;
    }

    public void setIntegral(Integer integral) {
        this.integral = integral;
    }

    public Integer getBalance() {
        return balance;
    }

    public void setBalance(Integer balance) {
        this.balance = balance;
    }

    public Integer getLoginId() {
        return loginId;
    }

    public void setLoginId(Integer loginId) {
        this.loginId = loginId;
    }

    public Integer getLevelId() {
        return levelId;
    }

    public void setLevelId(Integer levelId) {
        this.levelId = levelId;
    }
}