package org.lanqiao.jd.mapper;

import org.lanqiao.jd.entity.ProductComment;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ProductCommentMapper {
    int deleteByPrimaryKey(Integer commentId);

    int insert(ProductComment record);

    int insertSelective(ProductComment record);

    List<ProductComment> selectByPrimaryKey(Integer productId);

    List<ProductComment> selectContent(Integer productId);

    int updateByPrimaryKeySelective(ProductComment record);

    int updateByPrimaryKey(ProductComment record);

}