package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.GrandMapper;
import com.j170502.cateringmange.entity.Grand;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GrandService {
    @Resource
    private GrandMapper grandMapper;
    public List<Grand> findAll(){
       return  grandMapper.findAll();
    }
}
