package org.lanqiao.jd.mapper;

import org.lanqiao.jd.entity.ProductStock;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductStockMapper {
    int deleteByPrimaryKey(Integer stock_id);

    int insert(ProductStock record);

    int insertSelective(ProductStock record);
//改变信息
    int selectStock(Integer productId);
//
    int updateByPrimaryKeySelective(ProductStock record);

    int updateByPrimaryKey(ProductStock record);
}