package com.j170502.cateringmange.controller;

import com.j170502.cateringmange.entity.TableOrderInfo;
import com.j170502.cateringmange.entity.User;
import com.j170502.cateringmange.service.OrderTableService;
import com.j170502.cateringmange.util.OptionState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class OrderTableController {
    @Resource
    private OrderTableService orderTableService;
    @ResponseBody
    @RequestMapping("tables/OrderState")
    public int findOrderState(int tableId){
        return Integer.parseInt(orderTableService.getOrderSate(tableId));
    }
    //开台不先点餐
    @RequestMapping("order/table")
    public String OrderTable(TableOrderInfo orderTable,int waiter, Model model, HttpSession session){
        //若没有选服务员，默认服务员为
        if(waiter == 0){
            waiter = ((User)session.getAttribute("user")).getUserId();
        }
        int optionMsg = orderTableService.saveTableOrderInfoAndOrder(orderTable,waiter);
        model.addAttribute("optionMsg",optionMsg);
        return "redirect:/first";
    }
    //开台并点餐
    @RequestMapping("order/tableAndFood")
    public String OrderTableAndFood(TableOrderInfo orderTable,int waiter, Model model, HttpSession session){
        //若没有选服务员，默认服务员为
        if(waiter == 0){
            waiter = ((User)session.getAttribute("user")).getUserId();
        }
        int optionMsg = orderTableService.saveTableOrderInfoAndOrder(orderTable,waiter);
        if(optionMsg== OptionState.SUCCESS){
            model.addAttribute("tableId",orderTable.getTableId());
           return "redirect:/foodMenu";
        }else{
            model.addAttribute("optionMsg",optionMsg);
            return "redirect:/first";
        }
    }

    @ResponseBody
    @RequestMapping("table/clear")
    public int clearTable(int tableId,HttpSession session){
        User user  = (User)session.getAttribute("user");
        return orderTableService.updateStates(tableId,user);
    }
}
