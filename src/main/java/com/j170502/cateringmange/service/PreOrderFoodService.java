package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.PreOrderFoodMapper;
import com.j170502.cateringmange.entity.PreOrderFood;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PreOrderFoodService {

    @Resource
    private PreOrderFoodMapper preOrderFoodMapper;


}
