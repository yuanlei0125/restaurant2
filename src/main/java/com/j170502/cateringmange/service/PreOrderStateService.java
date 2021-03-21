package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.PreOrderStateMapper;
import com.j170502.cateringmange.entity.PreOrderState;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PreOrderStateService {
    @Resource
    private PreOrderStateMapper preOrderStateMapper;

    public List<PreOrderState> findAll(){
        return preOrderStateMapper.findAll();
    }
}
