package com.j170502.cateringmange.controller;

import com.j170502.cateringmange.entity.Order;
import com.j170502.cateringmange.entity.User;
import com.j170502.cateringmange.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/order")
@Controller
public class OrderController {
    @Resource
    private OrderService orderService;
    @RequestMapping("/list")
    public String orderList(Model model){
       List<Order> list=orderService.findAll();
       model.addAttribute("list",list);
        return "redirect:/order/list";
    }
    @RequestMapping("/update")
    public String updateOrder(Order order, HttpSession session, @RequestParam("price")double price){
        User user=(User)session.getAttribute("user");
        int userId=user.getUserId();
        order.setOrderPrice((int)price);
        orderService.updateOrder(order,userId);
        return "redirect:/snack/list";
    }
}
