package org.lanqiao.jd.service;

import org.lanqiao.jd.entity.OrderCart;
import org.lanqiao.jd.entity.ProductComment;
import org.lanqiao.jd.entity.ProductInfo;

import java.util.List;


public interface ProductCommentService {
    //取出评论所有数据
    public List<ProductComment> selectByPrimaryKey(Integer productId);

    //取出图片路径
    public String selectPic(Integer productId);

    //加入购物车
    public int createOrder(OrderCart ordercart, Integer productAmount, Integer productId, Integer customerId,String price);

    //库存
    public int selectStock(Integer ProductId);

    //取出商品名称，价格以及type1
    public List<ProductInfo> selectOne(Integer ProductId);

    //取出type2
    public List<ProductInfo> selectTwo(Integer ProductId);

    //取出type2
    public List<ProductInfo> selectThree(Integer ProductId);

    //取出品牌
    public String selectBrand(Integer ProductId);
}

