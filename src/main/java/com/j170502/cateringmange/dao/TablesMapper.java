package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.Tables;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TablesMapper {
    int deleteByPrimaryKey(Integer tableId);

    int insert(Tables record);

    int insertSelective(Tables record);

    Tables selectByPrimaryKey(Integer tableId);

    int updateByPrimaryKeySelective(Tables record);

    int updateByPrimaryKey(Tables record);

    List<Tables> findAll();

    List<Tables> findByPlaceAndState(@Param("placeAndState") String sql);

    void save(Tables tables);

    List<Tables> findAllBox();

    List<Tables> findAllHall();

    void saveBox(Tables tables);

    void saveHall(Tables tables);
}