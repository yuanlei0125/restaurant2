package com.j170502.cateringmange.controller;

import com.j170502.cateringmange.entity.Role;
import com.j170502.cateringmange.entity.User;
import com.j170502.cateringmange.service.RoleService;
import com.j170502.cateringmange.service.UserService;
import javafx.application.Application;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    @Resource
    private UserService userService;
    @Resource
    private RoleService roleService;
    @RequestMapping("/")
    public String start(Model model){
       String [] names = userService.findAllName();
       model.addAttribute("names",names);
        return "index";
    }
    @RequestMapping("/login")
    public String login(HttpSession session, String userName, String userPwd, Model model){
       User user= userService.login(userName,userPwd);
       if(user !=null){
          session.setAttribute("user",user);
           System.out.println("登录成功");
           return "redirect:/first";
       }else{
          model.addAttribute("msg","账号或密码错误!");
           String [] names = userService.findAllName();
           model.addAttribute("names",names);
           return "index";
       }
    }
    @RequestMapping("/user/list")
    public String list(Model model){
        List<User> listUser=userService.findAlls();
        List<Role> listRole=roleService.findAll();
        model.addAttribute("listUser",listUser);
        model.addAttribute("listRole",listRole);
        return "setting/user/list";
    }
    @ResponseBody
    @RequestMapping("/user/findWaiter")
    public List<User> findAll(){
        return userService.findAlls();
    }
    @RequestMapping("/user/preAdd")
    public String preAdd(Model model){
        User user=new User();
        model.addAttribute("user" ,user);
        return "setting/user/add";
    }
    @RequestMapping("/user/add")
    public String add(User user){
        userService.save(user);
        return "redirect:/user/list";
    }
    @RequestMapping("/user/preUpdate/{userId}")
    public String preUpdate(Model model ,@PathVariable("userId") int userId){
        User user=userService.findById(userId);
        model.addAttribute("user",user);
        return "setting/user/update";
    }
    @RequestMapping("/user/update")
    public String update(User user){
        System.out.println(user.getRoleId()+user.getRoleName());
        userService.update(user);

        return "redirect:/user/list";
    }
    @RequestMapping("/user/delete/{userId}")
    public String delete(@PathVariable("userId") int userId){
        userService.delete(userId);
        return "redirect:/user/list";
    }
    @RequestMapping("/password/preUpdate")
    public String preUpdate(){
        return "setting/password/update";
    }
    @ResponseBody
    @RequestMapping("/password/confirm")
    public int confirm(HttpSession session,String password){
        User user=(User) session.getAttribute("user");
        return userService.confirm(user,password);
    }
    @RequestMapping("/password/update")
    public String updatePassword(HttpSession session,@RequestParam("newpassword") String userPwd){
        User user=(User) session.getAttribute("user");
        int count =  userService.updatePassword(userPwd,user.getUserId());
        System.out.println(count+"-----------------------");
        if(count>0){
            session.removeAttribute("user");
        }
        return "redirect:/exit";
    }

}
