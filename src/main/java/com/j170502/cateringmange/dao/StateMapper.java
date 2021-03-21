package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.State;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface StateMapper {
    int deleteByPrimaryKey(Integer stateId);

    int insert(State record);

    int insertSelective(State record);

    State selectByPrimaryKey(Integer stateId);

    int updateByPrimaryKeySelective(State record);

    int updateByPrimaryKey(State record);

    List<State> findAll();

    String findStateName(Integer id);
}