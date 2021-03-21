package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.FoodsMapper;
import com.j170502.cateringmange.entity.Foods;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FoodService {
    @Resource
    private FoodsMapper foodsMapper;
    public List<Foods> findAll(int id){
        String str = "";
        if(id>0){
            str="where food_type="+id;
        }

        return foodsMapper.findAll(str);
    }
    public List<Foods> findFoodByState(int id){
        String str = "";
        if(id>0){
            str="where food_type="+id+" AND food_state="+2;
        }

        return foodsMapper.findAll(str);
    }
    public int saveFood(Foods food){
        return foodsMapper.insert(food);
    }
    public Foods findFood(int foodId){
        return foodsMapper.selectByPrimaryKey(foodId);
    }
    public int updateFoodById(Foods food){
       return foodsMapper.updateByPrimaryKeySelective(food);
    }
    public int deleteFoodById(int foodId){

        Foods food = foodsMapper.selectByPrimaryKey(foodId);
        Integer foodTypeId=food.getFoodType();
        if(foodTypeId==null){
            foodTypeId=0;
        }
        foodsMapper.deleteByPrimaryKey(foodId);
        return foodTypeId;
    }
    public int updateFoodState(int foodId){
       int num=0;

        Foods food=findFood(foodId);
        switch (food.getStateName()){
            case "停用":num=2;break;
            case "有存":num=3;break;
            case "售完":num=3;break;

        }
        foodsMapper.updateFoodState(foodId,num);
        int foodTypeId=food.getFoodType();
             return foodTypeId;
    }
    public boolean checkFoodName(String foodName){
        Foods food=foodsMapper.findFoodByName(foodName);

        return food!=null;
    }
}
