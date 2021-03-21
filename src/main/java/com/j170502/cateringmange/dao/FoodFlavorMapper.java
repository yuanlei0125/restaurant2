package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.FoodFlavor;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface FoodFlavorMapper {
    int deleteByPrimaryKey(Integer flavorId);

    int insert(FoodFlavor record);

    int insertSelective(FoodFlavor record);

    FoodFlavor selectByPrimaryKey(Integer flavorId);

    int updateByPrimaryKeySelective(FoodFlavor record);

    int updateByPrimaryKey(FoodFlavor record);

    String findNameById(Integer flavorId);

    List<FoodFlavor> findAll();

}