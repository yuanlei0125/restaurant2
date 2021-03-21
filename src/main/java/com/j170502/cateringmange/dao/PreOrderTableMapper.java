package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.PreOrderTable;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface PreOrderTableMapper {
    int deleteByPrimaryKey(Integer preOrderTableId);

    int insert(PreOrderTable record);

    int insertSelective(PreOrderTable record);

    PreOrderTable selectByPrimaryKey(Integer preOrderTableId);

    int updateByPrimaryKeySelective(PreOrderTable record);

    int updateByPrimaryKey(PreOrderTable record);

    public List<PreOrderTable> findAll();

    public List<PreOrderTable> findByPreOrderId(Integer id);

    public int[] findByState(Integer id);
}