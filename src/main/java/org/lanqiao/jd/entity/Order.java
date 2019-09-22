package org.lanqiao.jd.entity;

import java.util.Date;
import java.util.List;

public class Order {
    private Integer orderId;

    private Integer shipId;

    private Integer payMsgId;

    private Integer customerId;

    private Date orderTime;

    private List<OrderDetail> orderDetails;

    private  PaymentInfo paymentInfo;

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public PaymentInfo getPaymentInfo() {
        return paymentInfo;
    }

    public void setPaymentInfo(PaymentInfo paymentInfo) {
        this.paymentInfo = paymentInfo;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getShipId() {
        return shipId;
    }

    public void setShipId(Integer shipId) {
        this.shipId = shipId;
    }

    public Integer getPayMsgId() {
        return payMsgId;
    }

    public void setPayMsgId(Integer payMsgId) {
        this.payMsgId = payMsgId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }
}