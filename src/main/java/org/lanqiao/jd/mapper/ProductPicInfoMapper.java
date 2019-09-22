package org.lanqiao.jd.mapper;

import org.lanqiao.jd.entity.ProductPicInfo;

public interface ProductPicInfoMapper {
//韩详情页
    String selectPic(Integer productId);
    int deleteByPrimaryKey(Integer productPicId);

    int insert(ProductPicInfo record);

    int insertSelective(ProductPicInfo record);

    ProductPicInfo selectByPrimaryKey(Integer productPicId);

    int updateByPrimaryKeySelective(ProductPicInfo record);

    int updateByPrimaryKey(ProductPicInfo record);
}