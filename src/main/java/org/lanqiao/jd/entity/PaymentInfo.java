package org.lanqiao.jd.entity;

import java.util.Date;

public class PaymentInfo {
    private Integer payMsgId;

    private Integer payId;

    private Date payTime;

    private Integer cartId;

    public Integer getPayMsgId() {
        return payMsgId;
    }

    public void setPayMsgId(Integer payMsgId) {
        this.payMsgId = payMsgId;
    }

    public Integer getPayId() {
        return payId;
    }

    public void setPayId(Integer payId) {
        this.payId = payId;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }
}