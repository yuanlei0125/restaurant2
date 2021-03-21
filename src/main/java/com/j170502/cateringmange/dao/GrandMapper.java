package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.Grand;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface GrandMapper {
    int deleteByPrimaryKey(Integer grandId);

    int insert(Grand grand);

    int insertSelective(Grand record);

    Grand selectByPrimaryKey(Integer grandId);

    int updateByPrimaryKeySelective(Grand record);

    int updateByPrimaryKey(Grand record);

    List<Grand> findAll();

}