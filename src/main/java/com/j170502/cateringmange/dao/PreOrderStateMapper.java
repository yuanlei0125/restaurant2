package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.PreOrderState;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface PreOrderStateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PreOrderState record);

    int insertSelective(PreOrderState record);

    PreOrderState selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PreOrderState record);

    int updateByPrimaryKey(PreOrderState record);

    List<PreOrderState> findAll();
}