package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.PreOrderMapper;
import com.j170502.cateringmange.entity.PreOrder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class PreOrderService {
    @Resource
    private PreOrderMapper preOrderMapper;

    public void save(PreOrder preOrder){
        preOrderMapper.insert(preOrder);
    }

    public List<PreOrder> findAll(){
        return preOrderMapper.findAll();
    }

    public List<PreOrder> findByState(Integer id){
        return preOrderMapper.findByState(id);
    }

    public List<PreOrder> findOrderByTime(){
        return preOrderMapper.findOrderByTime();
    }

    public List<PreOrder> findByTimeAndState(Integer preState,String preOrderTime){
       return preOrderMapper.findByTimeAndState(preState,preOrderTime);
   }
}
