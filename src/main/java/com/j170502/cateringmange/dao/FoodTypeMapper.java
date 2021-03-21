package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.FoodType;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface FoodTypeMapper {
    int deleteByPrimaryKey(Integer typeId);

    int insert(FoodType record);

    int insertSelective(FoodType record);

    FoodType selectByPrimaryKey(Integer typeId);

    int updateByPrimaryKeySelective(FoodType record);

    int updateByPrimaryKey(FoodType record);

    List<FoodType> findAll();

    String findNameById(Integer typeId);
}