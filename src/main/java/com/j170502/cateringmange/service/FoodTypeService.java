package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.FoodTypeMapper;
import com.j170502.cateringmange.entity.FoodType;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FoodTypeService {
    @Resource
    private FoodTypeMapper foodTypeMapper;
    public List<FoodType> findAll(){
        return foodTypeMapper.findAll();
    }
    public String findNameById(int id){

        return  foodTypeMapper.findNameById(id);
    }
    public int saveFoodType(FoodType foodType){
        return foodTypeMapper.insert(foodType);
    }
}
