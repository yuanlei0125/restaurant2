package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.FoodSpec;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface FoodSpecMapper {
    int deleteByPrimaryKey(Integer specId);

    int insert(FoodSpec record);

    int insertSelective(FoodSpec record);

    FoodSpec selectByPrimaryKey(Integer specId);

    int updateByPrimaryKeySelective(FoodSpec record);

    int updateByPrimaryKey(FoodSpec record);

    String findNameById(Integer specId);

    List<FoodSpec> findAll();
}