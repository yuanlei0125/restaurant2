package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.PreOrderTableMapper;
import com.j170502.cateringmange.entity.PreOrderTable;
import com.j170502.cateringmange.entity.Tables;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PreOrderTableService {

    @Resource
    private PreOrderTableMapper preOrderTableMapper;

    public void save(PreOrderTable table){
        preOrderTableMapper.insert(table);
    }

    public List<PreOrderTable> findAll(){
        return preOrderTableMapper.findAll();
    }

    public List<PreOrderTable> findByPreOrderId(Integer id){
        return preOrderTableMapper.findByPreOrderId(id);
    }

    public int[] findByState(Integer id){
        return preOrderTableMapper.findByState(id);
    }
}
