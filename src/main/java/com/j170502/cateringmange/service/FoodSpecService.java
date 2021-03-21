package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.FoodSpecMapper;
import com.j170502.cateringmange.entity.FoodSpec;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FoodSpecService {
    @Resource
    private FoodSpecMapper foodSpecMapper;
     public List<FoodSpec> findAll(){
         return foodSpecMapper.findAll();
     }
}
