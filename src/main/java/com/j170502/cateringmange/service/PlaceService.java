package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.PlaceMapper;
import com.j170502.cateringmange.entity.Place;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PlaceService {
    @Resource
    private PlaceMapper placeMapper;
    public List<Place> findAll(){
        return placeMapper.findAll();
    }
}
