package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.Record;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface RecordMapper {
    int deleteByPrimaryKey(Integer recordId);

    int insert(Record record);

    int insertSelective(Record record);

    Record selectByPrimaryKey(Integer recordId);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);
}