package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.PreOrder;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.Date;
import java.util.List;

@MapperScan
public interface PreOrderMapper {
    int deleteByPrimaryKey(Integer preOrderId);

    int insert(PreOrder record);

    int insertSelective(PreOrder record);

    PreOrder selectByPrimaryKey(Integer preOrderId);

    int updateByPrimaryKeySelective(PreOrder record);

    int updateByPrimaryKey(PreOrder record);

    public List<PreOrder> findAll();

    public List<PreOrder> findByState(Integer id);

    public List<PreOrder> findOrderByTime();

    public List<PreOrder> findByTimeAndState(@Param("preState") Integer preState, @Param("preOrderTime") String preOrderTime);
}