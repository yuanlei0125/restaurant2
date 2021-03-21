package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.Foods;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface FoodsMapper {
    int deleteByPrimaryKey(Integer foodId);

    int insert(Foods record);

    int insertSelective(Foods record);

    Foods selectByPrimaryKey(Integer foodId);

    int updateByPrimaryKeySelective(Foods record);

    int updateByPrimaryKey(Foods record);

    List<Foods> findAll(@Param("str") String str);

    int updateFoodState(@Param("foodId") Integer foodId, @Param("foodState") Integer foodState);

    Foods findFoodByName(@Param("foodName") String foodName);


}