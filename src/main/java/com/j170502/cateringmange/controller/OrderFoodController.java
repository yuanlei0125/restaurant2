package com.j170502.cateringmange.controller;

import com.j170502.cateringmange.entity.*;
import com.j170502.cateringmange.service.FoodService;
import com.j170502.cateringmange.service.FoodTypeService;
import com.j170502.cateringmange.service.OrderTableService;;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class OrderFoodController {
    @Resource
    private FoodService foodService;
    @Resource
    private OrderTableService orderTableService;
    @Resource
    private FoodTypeService foodTypeService;
    @RequestMapping("/foodMenu")
    public String  showFoodMenu(int tableId, Model model){
        List<Foods> foods =foodService.findAll(0);
        model.addAttribute("foods",foods);
        List<FoodType> foodTypes = foodTypeService.findAll();
        model.addAttribute("types",foodTypes);
        OrderNumAndTable orderNumAndTable = orderTableService.findByTableId(tableId);
        model.addAttribute("tableOrderInfo",orderNumAndTable);
        return "food/foodMenu";
    }
    @ResponseBody
    @RequestMapping(value = "/orderFood",method = RequestMethod.POST)
    public int orderFood(@RequestBody List<OrderFood>  orderFoods){
        return orderTableService.updateOrderFood(orderFoods);
    }


}
