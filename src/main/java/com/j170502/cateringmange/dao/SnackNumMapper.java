package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.SnackNum;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface SnackNumMapper {
    int deleteByPrimaryKey(Integer numId);

    int insert(SnackNum record);

    int insertSelective(SnackNum record);

    SnackNum selectByPrimaryKey(Integer numId);

    int updateByPrimaryKeySelective(SnackNum record);

    int updateByPrimaryKey(SnackNum record);

    SnackNum findLast();
}