package org.lanqiao.jd.controller;

import org.lanqiao.jd.entity.OrderCart;
import org.lanqiao.jd.entity.ProductComment;
import org.lanqiao.jd.entity.ProductInfo;
import org.lanqiao.jd.service.ProductCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

//商品详情页（调取评论信息）

@RestController
public class ProductCommentController {
    @Autowired
    ProductCommentService productCommentService;




    @RequestMapping("/selectAll")
    public List<ProductComment> selectByPrimaryKey(Integer productId){
        return productCommentService.selectByPrimaryKey(productId);
    }
    //取出商品名称，价格以及type1
    @RequestMapping("/selectOne")
    public List<ProductInfo> selectOne(Integer productId){
        return productCommentService.selectOne(productId);
    }
    //取出type2
    @RequestMapping("/selectTwo")
    public List<ProductInfo> selectTwo(Integer productId){
        return productCommentService.selectTwo(productId);
    }
    //取出type3
    @RequestMapping("/selectThree")
    public List<ProductInfo> selectThree(Integer productId){
        return productCommentService.selectThree(productId);
    }
    //取出品牌
    @RequestMapping("/selectBrand")
    public String selectBrand(Integer productId){
        return productCommentService.selectBrand(productId);
    }
    //取出产品的图片
    @RequestMapping("/selectPic")
    public String selectPic(Integer productId){
        return productCommentService.selectPic(productId);
    }
    //加入购物车
    @RequestMapping("/insertOrder")
    public boolean creatOrder(OrderCart orderCart, Integer productAmount, Integer productId, Integer customerId,String price){
        orderCart.setCustomerId(customerId);
        orderCart.setProductId(productId);
        orderCart.setProductAmount(productAmount);
        orderCart.setPrice(price);
        productCommentService.createOrder(orderCart,productAmount,productId,customerId,price);
        return true;
    }
    //库存数量
    @RequestMapping("/get")
    public int selectStock(Integer productId){
        return productCommentService.selectStock(productId);
    }



}
