package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.FoodFlavorMapper;
import com.j170502.cateringmange.entity.FoodFlavor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FoodFlavorService {
    @Resource
    private FoodFlavorMapper foodFlavorMapper;

    public List<FoodFlavor> findAll(){
        return foodFlavorMapper.findAll();
    }
}
