package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.StateMapper;
import com.j170502.cateringmange.entity.State;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StateService {
    @Resource
    private StateMapper stateMapper;
    public List<State> findAll(){
        return stateMapper.findAll();
    }
}
