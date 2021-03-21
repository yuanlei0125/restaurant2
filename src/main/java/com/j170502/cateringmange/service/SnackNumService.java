package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.SnackNumMapper;
import com.j170502.cateringmange.entity.SnackNum;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SnackNumService {
    @Resource
    private SnackNumMapper snackNumMapper;
    public SnackNum findLast(){
        return snackNumMapper.findLast();
    }
    public void saveSnackNum(SnackNum snackNum){

        snackNumMapper.insert(snackNum);
    }
}
