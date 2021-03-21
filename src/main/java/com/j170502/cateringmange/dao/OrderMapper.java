package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.Order;

import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer orderId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer orderId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    Order findByTableId(Integer tableId);
    List<Order> findAll();

    Order findSnackOrder();
}