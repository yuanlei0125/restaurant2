package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.FoodStateMapper;
import com.j170502.cateringmange.entity.FoodState;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FoodStateService {
    @Resource
    private FoodStateMapper foodStateMapper;

    public List<FoodState> findAll(){
        return foodStateMapper.findAll();
    }
}
