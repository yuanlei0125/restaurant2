package com.j170502.cateringmange.controller;

import com.j170502.cateringmange.entity.FoodType;
import com.j170502.cateringmange.entity.Foods;
import com.j170502.cateringmange.service.FoodService;
import com.j170502.cateringmange.service.FoodTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@RequestMapping("/snack")
@Controller
public class SnackController {

    @Resource
    private FoodService foodService;
    @Resource
    private FoodTypeService foodTypeService;
    @RequestMapping("/list")
    public String menuList( Model model){
       List<Foods> foodList=foodService.findFoodByState(0);
       model.addAttribute("foodList",foodList);
        List<FoodType> foodTypeList=foodTypeService.findAll();
        model.addAttribute("foodTypeList",foodTypeList);

        return "snack/list";
    }
    @ResponseBody
    @RequestMapping("/typeList")
    public List<Foods> list(int id){
      return    foodService.findFoodByState(id);
    }
}
