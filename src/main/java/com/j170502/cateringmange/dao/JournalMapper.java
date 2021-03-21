package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.Journal;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface JournalMapper {
    int deleteByPrimaryKey(Integer journalId);

    void insert(Journal journal);

    int insertSelective(Journal record);

    Journal selectByPrimaryKey(Integer journalId);

    int updateByPrimaryKeySelective(Journal record);

    int updateByPrimaryKeyWithBLOBs(Journal record);

    int updateByPrimaryKey(Journal record);

    List<Journal> findAll();

    List<Journal> findBySql(@Param("sql") String sql);
}