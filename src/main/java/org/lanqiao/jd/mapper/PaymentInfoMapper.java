package org.lanqiao.jd.mapper;

import org.lanqiao.jd.entity.PaymentInfo;

public interface PaymentInfoMapper {
    int deleteByPrimaryKey(Integer payMsgId);

    int insert(PaymentInfo record);

    int insertSelective(PaymentInfo record);

    PaymentInfo selectByPrimaryKey(Integer payMsgId);

    int updateByPrimaryKeySelective(PaymentInfo record);

    int updateByPrimaryKey(PaymentInfo record);
}