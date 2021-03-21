package com.j170502.cateringmange.controller;

import com.j170502.cateringmange.entity.Grand;
import com.j170502.cateringmange.entity.Journal;
import com.j170502.cateringmange.entity.User;
import com.j170502.cateringmange.service.GrandService;
import com.j170502.cateringmange.service.JournalService;
import com.j170502.cateringmange.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class JournalController {
    @Resource
    private JournalService journalService;
    @Resource
    private GrandService grandService;
    @Resource
    private UserService userService;
    @RequestMapping("/system/journal")
    public String List(Model model){
       List<Journal> journalList= journalService.findAll();
       model.addAttribute("journalList",journalList);
       List<Grand> grandList=grandService.findAll();
       model.addAttribute("grandList",grandList);
       List<User> userList=userService.findAlls();
       model.addAttribute("userList",userList);
        return "setting/journal/list";
    }
    @ResponseBody
    @RequestMapping("/journal/select")
    public List<Journal> findNames(int grandId,int userId){

        return  journalService.findAllByName(grandId,userId);
    }
}
