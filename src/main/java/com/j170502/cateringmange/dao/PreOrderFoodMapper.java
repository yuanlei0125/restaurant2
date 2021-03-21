package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.PreOrderFood;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface PreOrderFoodMapper {
    int deleteByPrimaryKey(Integer preOrderFoodId);

    int insert(PreOrderFood record);

    int insertSelective(PreOrderFood record);

    PreOrderFood selectByPrimaryKey(Integer preOrderFoodId);

    int updateByPrimaryKeySelective(PreOrderFood record);

    int updateByPrimaryKey(PreOrderFood record);
}