package com.j170502.cateringmange.dao;

import com.j170502.cateringmange.entity.User;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface UserMapper {
   void deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    void updateByPrimaryKey(User user);

    String [] findAll();

    User login(@Param("userName") String userName, @Param("userPwd") String userPwd);

    List<User> findAlls();

    void save(User user);

    User findById(Integer id);

    int updatePassword(@Param("userPwd") String userPwd, @Param("userId") Integer userId);
}
