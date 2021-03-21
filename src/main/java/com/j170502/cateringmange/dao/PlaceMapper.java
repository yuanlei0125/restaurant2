package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.Place;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface PlaceMapper {
    int deleteByPrimaryKey(Integer placeId);

    int insert(Place record);

    int insertSelective(Place record);

    Place selectByPrimaryKey(Integer placeId);

    int updateByPrimaryKeySelective(Place record);

    int updateByPrimaryKey(Place record);

    List<Place> findAll();

    String findPlaceName(Integer id);
}