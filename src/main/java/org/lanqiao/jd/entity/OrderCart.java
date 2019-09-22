package org.lanqiao.jd.entity;

import java.util.Date;

public class OrderCart {
    private Integer cartId;

    private Integer customerId;

    private Integer productId;

    private Integer productAmount;

    private String price;

    private Date addTime;

    private ProductInfo productInfo;

    private ProductPicInfo productPicInfo;

    public ProductPicInfo getProductPicInfo() {
        return productPicInfo;
    }

    public void setProductPicInfo(ProductPicInfo productPicInfo) {
        this.productPicInfo = productPicInfo;
    }

    public ProductInfo getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(ProductInfo productInfo) {
        this.productInfo = productInfo;
    }

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getProductAmount() {
        return productAmount;
    }

    public void setProductAmount(Integer productAmount) {
        this.productAmount = productAmount;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    @Override
    public String toString() {
        return "OrderCart{" +
                "cartId=" + cartId +
                ", customerId=" + customerId +
                ", productId=" + productId +
                ", productAmount=" + productAmount +
                ", price=" + price +
                ", addTime=" + addTime +
                ", productInfo=" + productInfo +
                ", productPicInfo=" + productPicInfo +
                '}';
    }
}