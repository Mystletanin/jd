package org.lanqiao.jd.service;

import org.lanqiao.jd.entity.ProductInfo;

import java.util.List;

public interface ProductInfoService {

    String selectPrice(Integer productId);

    List<ProductInfo> likeSelect(Integer pageNum,String productName);

    List<ProductInfo> getProductList(Integer pageNum,String productName);

    List<ProductInfo> getProductListAds();

    List<ProductInfo> likeSelectInTotal(Integer pageNum,String input,String productName);

    List<ProductInfo> orderByPrice(Integer pageNum,String input);

    List<ProductInfo> orderBySalesVolume(Integer pageNum,String input);

    List<ProductInfo> orderByComment(Integer pageNum,String input);

    ProductInfo getCountAndPaTal();

    ProductInfo getLevel1(String searchName);

    ProductInfo getLevel2(String searchName);

    List<ProductInfo> getLevel1All(String searchName);

    List<ProductInfo> getLevel2All(String searchName);
}
