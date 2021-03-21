package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.Role;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> findAll();

    String findRoleName(Integer id);
}