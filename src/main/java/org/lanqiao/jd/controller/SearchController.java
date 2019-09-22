package org.lanqiao.jd.controller;


import org.lanqiao.jd.entity.ProductInfo;
import org.lanqiao.jd.service.OrderCartService;
import org.lanqiao.jd.service.ProductInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
public class SearchController {
    @Autowired
    ProductInfoService productInfoService;
    @Autowired
    OrderCartService orderCartService;

    @RequestMapping("/selectPrice")
    public String selectPrice(Integer productId) {
        return productInfoService.selectPrice(productId);
    }
    //----------------------------------------------搜索页-----------------------------------------------------
    @RequestMapping("/orderCartCount")//获取购物车数量
    public int orderCartCount(Integer customerId) {
        return orderCartService.orderCartCount(customerId);
    }

    @RequestMapping("/likeSelect")//模糊查询
    public List<ProductInfo> likeSelect(Integer pageNum,String productName){
        return productInfoService.likeSelect(pageNum,productName);
    }
    @RequestMapping("/getProductList")//打开搜索页显示商品列表
    public List<ProductInfo> getProductList(Integer pageNum,String productName){
        return productInfoService.getProductList(pageNum,productName);
    }
    @RequestMapping("/likeSeTotal")//在搜索结果中搜素
    public List<ProductInfo> likeSelectInTotal(Integer pageNum,String input, String productName){
        return  productInfoService.likeSelectInTotal(pageNum,input,productName);
    }
    @RequestMapping("/orderByPrice")//根据价格排序降序
    public List<ProductInfo> orderByPrice(Integer pageNum,String input){
        return productInfoService.orderByPrice(pageNum,input);
    };
    @RequestMapping("/orderBySalesVolume")//根据销量降序排序
    public List<ProductInfo> orderBySalesVolume(Integer pageNum, String input) {
        return productInfoService.orderBySalesVolume(pageNum,input);
    }
    @RequestMapping("/orderByComment")//根据评论数降序排序
    public List<ProductInfo> orderByComment(Integer pageNum, String input) {
        return productInfoService.orderByComment(pageNum,input);
    }
    @RequestMapping("/getProductListAds")//打开搜索页显示广告列表
    public List<ProductInfo> getProductListAds() {
        return productInfoService.getProductListAds();
    }
    @RequestMapping("/getCount")//显示商品总数
    public ProductInfo getCountAndPaTal() {
        return productInfoService.getCountAndPaTal();
    }
    @RequestMapping("/getLevel1")//显示搜索商品的一级分类
    public ProductInfo getLevel1(String searchName) {
        return productInfoService.getLevel1(searchName);
    }
    @RequestMapping("/getLevel2")//显示搜索商品的二级分类
    public ProductInfo getLevel2(String searchName) {
        return productInfoService.getLevel2(searchName);
    }
    @RequestMapping("/getLevel1All")//显示搜索商品的所有二级分类
    public List<ProductInfo> getLevel1All(String searchName) {
        return productInfoService.getLevel1All(searchName);
    }
    @RequestMapping("/getLevel2All")//显示搜索商品的所有三级分类
    public List<ProductInfo> getLevel2All(String searchName) {
        return productInfoService.getLevel2All(searchName);
    }
    //----------------------------------------------搜索页-----------------------------------------------------
}
