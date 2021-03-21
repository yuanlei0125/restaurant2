package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.OrderType;

public interface OrderTypeMapper {
    int deleteByPrimaryKey(Integer typeId);

    int insert(OrderType record);

    int insertSelective(OrderType record);

    OrderType selectByPrimaryKey(Integer typeId);

    int updateByPrimaryKeySelective(OrderType record);

    int updateByPrimaryKey(OrderType record);
}