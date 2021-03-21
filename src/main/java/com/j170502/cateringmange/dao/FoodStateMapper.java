package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.FoodState;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface FoodStateMapper {
    int deleteByPrimaryKey(Integer foodStateId);

    int insert(FoodState record);

    int insertSelective(FoodState record);

    FoodState selectByPrimaryKey(Integer foodStateId);

    int updateByPrimaryKeySelective(FoodState record);

    int updateByPrimaryKey(FoodState record);

    List<FoodState> findAll();

    String findNameById(Integer foodStateId);

}