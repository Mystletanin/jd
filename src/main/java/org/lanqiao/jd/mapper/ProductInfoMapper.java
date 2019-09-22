package org.lanqiao.jd.mapper;

import org.lanqiao.jd.entity.ProductInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductInfoMapper {

    int deleteByPrimaryKey(Integer productId);

    int insert(ProductInfo record);

    int insertSelective(ProductInfo record);

    ProductInfo selectByPrimaryKey(Integer productId);

    int updateByPrimaryKeySelective(ProductInfo record);

    int updateByPrimaryKeyWithBLOBs(ProductInfo record);

    int updateByPrimaryKey(ProductInfo record);
    //韩详情页
    List<ProductInfo> selectOne(Integer productId);

    List<ProductInfo> selectTwo(Integer productId);

    List<ProductInfo> selectThree(Integer productId);

    String selectBrand (Integer productId);

    String selectPrice(Integer productId);

//    搜索页

    List<ProductInfo> likeSelect(Integer pageNum,String productName);

    List<ProductInfo> getProductList(Integer pageNum,String productName);

    List<ProductInfo> getProductListAds();

    List<ProductInfo> likeSelectInTotal(Integer pageNum,String input,String productName);

    List<ProductInfo> orderByPrice(Integer pageNum,String input);

    List<ProductInfo> orderBySalesVolume(Integer pageNum,String input);

    List<ProductInfo> orderByComment(Integer pageNum,String input);

    int getCount();

    ProductInfo getLevel1(String searchName);

    ProductInfo getLevel2(String searchName);

    List<ProductInfo> getLevel1All(String searchName);

    List<ProductInfo> getLevel2All(String searchName);
//    搜索页
}