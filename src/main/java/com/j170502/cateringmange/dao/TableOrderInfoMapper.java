package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.OrderNumAndTable;
import com.j170502.cateringmange.entity.TableOrderInfo;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface TableOrderInfoMapper {
    int deleteByPrimaryKey(Integer tableOrderId);

    int insert(TableOrderInfo record);

    int insertSelective(TableOrderInfo record);

    TableOrderInfo selectByPrimaryKey(Integer tableOrderId);

    int updateByPrimaryKeySelective(TableOrderInfo record);

    int updateByPrimaryKey(TableOrderInfo record);

    String findOrderState(Integer tableId);

    TableOrderInfo findByTableId(Integer tableId);

    OrderNumAndTable findVOByTableId(Integer tableId);
}