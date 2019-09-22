package org.lanqiao.jd.service;

import org.lanqiao.jd.entity.ProductInfo;
import org.lanqiao.jd.mapper.ProductInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductInfoServiceImpl implements ProductInfoService{

    @Autowired
    ProductInfoMapper productInfoMapper;


    @Override
    public String selectPrice(Integer productId) {
        return productInfoMapper.selectPrice(productId);
    }

    @Override
    public List<ProductInfo> likeSelect(Integer pageNum,String productName) {
        pageNum = (pageNum-1)*20;
        return productInfoMapper.likeSelect(pageNum,productName);
    }

    @Override
    public List<ProductInfo> getProductList(Integer pageNum,String productName) {
        pageNum = (pageNum-1)*20;
        return productInfoMapper.getProductList(pageNum,productName);
    }

    @Override
    public List<ProductInfo> likeSelectInTotal(Integer pageNum,String input, String productName) {
        pageNum = (pageNum-1)*20;
        return productInfoMapper.likeSelectInTotal(pageNum,input,productName);
    }

    @Override
    public List<ProductInfo> orderByPrice(Integer pageNum,String input) {
        pageNum = (pageNum-1)*20;
        return productInfoMapper.orderByPrice(pageNum,input);
    }

    @Override
    public List<ProductInfo> orderBySalesVolume(Integer pageNum, String input) {
        pageNum = (pageNum-1)*20;
        return productInfoMapper.orderBySalesVolume(pageNum,input);
    }

    @Override
    public List<ProductInfo> orderByComment(Integer pageNum, String input) {
        pageNum = (pageNum-1)*20;
        return productInfoMapper.orderByComment(pageNum,input);
    }

    @Override
    public ProductInfo getCountAndPaTal() {
        ProductInfo productInfo=new ProductInfo();
        int a=productInfoMapper.getCount();
        float b;
        int c;
        if(a%20==0){
            b=a/20;
            c=(int)Math.ceil(b);
        }else{
            b=a/20;
            c=(int)Math.ceil(b)+1;
        }

        productInfo.setCount(a);
        productInfo.setPageTotal(c);
        return productInfo;
    }

    @Override
    public ProductInfo getLevel1(String searchName) {
        return productInfoMapper.getLevel1(searchName);
    }

    @Override
    public ProductInfo getLevel2(String searchName) {
        return productInfoMapper.getLevel2(searchName);
    }

    @Override
    public List<ProductInfo> getLevel1All(String searchName) {
        return productInfoMapper.getLevel1All(searchName);
    }

    @Override
    public List<ProductInfo> getLevel2All(String searchName) {
        return productInfoMapper.getLevel2All(searchName);
    }

    @Override
    public List<ProductInfo> getProductListAds() {
        return productInfoMapper.getProductListAds();
    }
}
