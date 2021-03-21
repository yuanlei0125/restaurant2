package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.RoleMapper;
import com.j170502.cateringmange.entity.Role;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoleService {
    @Resource
    private RoleMapper roleMapper;
    public List<Role> findAll(){
        return roleMapper.findAll();
    }
}
