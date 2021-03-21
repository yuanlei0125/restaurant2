package com.j170502.cateringmange.controller;

import com.j170502.cateringmange.entity.*;
import com.j170502.cateringmange.service.*;
import com.j170502.cateringmange.util.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;
import java.util.UUID;

@RequestMapping("/food")
@Controller
public class FoodController {
    @Resource
    private FoodService foodService;
    @Resource
    private FoodTypeService foodTypeService;
    @Resource
    private FoodStateService foodStateService;
    @Resource
    private FoodFlavorService foodFlavorService;
    @Resource
    private FoodSpecService foodSpecService;

    @RequestMapping("/list/{id}")
    public String foodList(Model model,@PathVariable int id){
        List<Foods> foodList=foodService.findAll(id);
        model.addAttribute("foodList",foodList);
        List<FoodType> foodTypeList=foodTypeService.findAll();
        model.addAttribute("foodTypeList",foodTypeList);
        List<FoodState> list=foodStateService.findAll();
        model.addAttribute("list",list);
        List<FoodFlavor> list1=foodFlavorService.findAll();
        model.addAttribute("list1",list1);
        List<FoodSpec> list2=foodSpecService.findAll();
        model.addAttribute("list2",list2);
        model.addAttribute("typeId",id);
        return "setting/food/list";
    }
    @RequestMapping("/preAdd/{id}")
    public String preAdd(@PathVariable int id,Model model){
      String foodTypeName=  foodTypeService.findNameById(id);
        model.addAttribute("foodTypeId",id);
        model.addAttribute("foodTypeName",foodTypeName);
        List<FoodState> list=foodStateService.findAll();
        model.addAttribute("list",list);
        List<FoodFlavor> list1=foodFlavorService.findAll();
        model.addAttribute("list1",list1);
        List<FoodSpec> list2=foodSpecService.findAll();
        model.addAttribute("list2",list2);
        return "setting/food/add";
    }
    @RequestMapping(value="/add",method = RequestMethod.POST)
    public String addFood(Foods food, MultipartFile file)throws Exception{

        String imagePath = UUID.randomUUID().toString();
        File newFile= new File(Constants.IMAGE_BASE_PATH+imagePath);
        file.transferTo(newFile);
        int typeId=food.getFoodType();
        food.setFoodImg(imagePath);

         int count= foodService.saveFood(food);
         if(count>0){
             return "redirect:/food/list/"+typeId;
         }else {
             return "redirect:/food/add/"+typeId;
         }

    }
    @ResponseBody
    @RequestMapping("/findFood")
    public Foods findFood(int id){
        Foods food=foodService.findFood(id);

        return food;
    }
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String updateFood(Foods food, MultipartFile file)throws Exception{
        if(file.getSize()!=0){
            String imagePath = UUID.randomUUID().toString();
            File newFile= new File(Constants.IMAGE_BASE_PATH+imagePath);
            file.transferTo(newFile);
            food.setFoodImg(imagePath);
        }
        int typeId=food.getFoodType();
      int count= foodService.updateFoodById(food);
        if(count>0){
            return "redirect:/food/list/"+typeId;
        }else {
            return "error";
        }
    }
    @RequestMapping("/delete/{id}")
    public String deleteFood(@PathVariable("id") int id){
        int typeId=foodService.deleteFoodById(id);

        return "redirect:/food/list/"+typeId;
    }
    @RequestMapping("/stop/{id}")
    public String stopFood(@PathVariable("id") int id){
        int typeId=foodService.updateFoodState(id);
        return "redirect:/food/list/"+typeId;
    }
    @ResponseBody
    @RequestMapping("/check")
    public int checkFoodName(String foodName){
        boolean flag=foodService.checkFoodName(foodName);
        if(flag){
            return 1;
        }else {
            return 2;
        }

    }

}
