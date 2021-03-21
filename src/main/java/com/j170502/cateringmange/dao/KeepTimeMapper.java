package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.KeepTime;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface KeepTimeMapper {
    int deleteByPrimaryKey(Integer keeptimeId);

    int insert(KeepTime record);

    int insertSelective(KeepTime record);

    KeepTime selectByPrimaryKey(Integer keeptimeId);

    int updateByPrimaryKeySelective(KeepTime record);

    int updateByPrimaryKey(KeepTime record);

    List<KeepTime> findAll();
}