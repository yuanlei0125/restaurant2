package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.OrderState;

public interface OrderStateMapper {
    int deleteByPrimaryKey(Integer orderStateId);

    int insert(OrderState record);

    int insertSelective(OrderState record);

    OrderState selectByPrimaryKey(Integer orderStateId);

    int updateByPrimaryKeySelective(OrderState record);

    int updateByPrimaryKey(OrderState record);
}