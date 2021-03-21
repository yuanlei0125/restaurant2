package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.KeepTimeMapper;
import com.j170502.cateringmange.entity.KeepTime;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class KeepTimeService {

    @Resource
    private KeepTimeMapper keepTimeMapper;

    public List<KeepTime> findAll(){
        return keepTimeMapper.findAll();
    }
}
