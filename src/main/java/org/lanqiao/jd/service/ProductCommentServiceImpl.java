package org.lanqiao.jd.service;


import org.lanqiao.jd.entity.OrderCart;
import org.lanqiao.jd.entity.ProductComment;
import org.lanqiao.jd.entity.ProductInfo;
import org.lanqiao.jd.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductCommentServiceImpl implements ProductCommentService {
    @Autowired
    ProductCommentMapper productCommentMapper;
    @Autowired
    ProductInfoMapper productInfoMapper;
    @Autowired
    CustomerInfoMapper customerInfoMapper;
    @Autowired
    ProductPicInfoMapper productPicInfoMapper;
    @Autowired
    OrderCartMapper orderCartMapper;
    @Autowired
    ProductStockMapper productStockMapper;


    //取出评论所有数据
    @Override
    public List<ProductComment> selectByPrimaryKey(Integer productId) {
        return  productCommentMapper.selectByPrimaryKey(productId);
    }

    //取出图片路径
    @Override
    public String selectPic(Integer productId) {
        return productPicInfoMapper.selectPic(productId);
    }

    //加入购物车
    @Override
    public int createOrder(OrderCart ordercart, Integer productAmount, Integer productId, Integer customerId,String price) {
        orderCartMapper.insertSelective(ordercart);
        return 0;
    }

    //库存
    @Override
    public int selectStock(Integer productId) {
        return productStockMapper.selectStock(productId);
    }
    //取出商品名称，价格以及type1
    @Override
    public List<ProductInfo> selectOne(Integer productId) {
        return productInfoMapper.selectOne(productId);
    }
    //取出type2
    @Override
    public List<ProductInfo> selectTwo(Integer productId) {
        return productInfoMapper.selectTwo(productId);
    }
    //取出type3
    @Override
    public List<ProductInfo> selectThree(Integer productId) {
        return productInfoMapper.selectThree(productId);
    }
    //取出品牌
    @Override
    public String selectBrand(Integer productId) {
        return productInfoMapper.selectBrand(productId);
    }






}
