package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.OrderFood;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface OrderFoodMapper {
    int deleteByPrimaryKey(Integer orderFoodId);

    int insert(OrderFood record);

    int insertSelective(OrderFood record);

    OrderFood selectByPrimaryKey(Integer orderFoodId);

    int updateByPrimaryKeySelective(OrderFood record);

    int updateByPrimaryKey(OrderFood record);

    Integer findByOrderPrice(Integer orderId);

    int insertList(@Param("orderFoods") List<OrderFood> orderFoods);
}