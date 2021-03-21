package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.UserMapper;
import com.j170502.cateringmange.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {
    @Resource
    private UserMapper userDAO;
    public String [] findAllName(){
        return userDAO.findAll();
    }
    public User login(String userName,String userPwd){
        return userDAO.login(userName,userPwd);
    }
    public List<User> findAlls(){
        return userDAO.findAlls();
    }
    public void save(User user){
        userDAO.save(user);
    }
    public User findById(Integer id){
      return userDAO.findById(id);
    }
    public void update(User user){
       userDAO.updateByPrimaryKeySelective(user);
    }
    public void delete(Integer id){
        userDAO.deleteByPrimaryKey(id);
    }
    public int confirm(User user, String password){
        if(password.equals(user.getUserPwd())){
            return 1;
        }else{
            return -1;
        }
    }
    public int updatePassword(String userPwd,Integer userId){
      return userDAO.updatePassword(userPwd,userId);
    }
}
