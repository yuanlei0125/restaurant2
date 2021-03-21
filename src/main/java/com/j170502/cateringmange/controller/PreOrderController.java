package com.j170502.cateringmange.controller;

import com.j170502.cateringmange.entity.*;
import com.j170502.cateringmange.service.*;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/predetermine")
public class PreOrderController {

    @Resource
    private PreOrderService preOrderService;
    @Resource
    private KeepTimeService keepTimeService;
    @Resource
    private TablesService tablesService;
    @Resource
    private PreOrderTableService preOrderTableService;
    @Resource
    private PreOrderStateService preOrderStateService;
    @Resource
    private FoodService foodService;
    @Resource
    private FoodTypeService foodTypeService;

    @RequestMapping("/preAdd")
    @ResponseBody
    public List<Tables> preAdd(Model model,String date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //全部餐桌遍历
        List<Tables>  tables = tablesService.findAll();
        //已经预定遍历
        List<PreOrder> preOrderList = preOrderService.findByState(1);
        //当前日期——预定餐桌
        HashMap<Integer,Tables> tableMap = new HashMap<Integer, Tables>();
        for(Tables table:tables){
            tableMap.put(table.getTableId(),table);
        }
        for(PreOrder p:preOrderList){
//            比较日期
            if(sdf.format(p.getPreOrderTime()).toString().equals(date)){
                List<PreOrderTable> preOrderTableList = preOrderTableService.findByPreOrderId(p.getPreOrderId());
                for(PreOrderTable pre:preOrderTableList){
                    tableMap.get(pre.getTableId()).setOrdering(1);
                }
            }
        }
        return tables;
    }

    @RequestMapping("/add")
    public String add(PreOrder preOrder, int table_id[], PreOrderFood foods){
        preOrderService.save(preOrder);
        for(int id : table_id){
            PreOrderTable table = new PreOrderTable();
            table.setPreOrderId(preOrder.getPreOrderId());
            table.setTableId(id);
            table.setTableState(3);
            preOrderTableService.save(table);
        }
        return "redirect:/predetermine/currentDate";
    }

    @RequestMapping("/currentDate")
    public String currentDate(Model model){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date1 =sdf.format(date).toString();
        String orderNum = UUID.randomUUID().toString();
        //预定保留时间
        List<KeepTime> list = keepTimeService.findAll();
        //全部餐桌遍历
        List<Tables>  tables = tablesService.findAll();
        //已经预定遍历
        List<PreOrder> preOrderList = preOrderService.findByState(1);
        HashMap<Integer,Tables> tableMap = new HashMap<Integer, Tables>();
        for(Tables table:tables){
            tableMap.put(table.getTableId(),table);
        }
        for(PreOrder p:preOrderList){
//            比较日期
            if(sdf.format(p.getPreOrderTime()).toString().equals(date1)){
                List<PreOrderTable> preOrderTableList = preOrderTableService.findByPreOrderId(p.getPreOrderId());
                for(PreOrderTable pre:preOrderTableList){
                    tableMap.get(pre.getTableId()).setOrdering(1);
                }
            }
        }
        model.addAttribute("tables",tables);
        model.addAttribute("orderNum",orderNum);
        model.addAttribute("list",list);
        return "/setting/predetermine/add";
    }

    @RequestMapping("/list")
    public String list(Model model){
        List<PreOrder> preOrders = preOrderService.findAll();
        List<PreOrderState> preOrderStates = preOrderStateService.findAll();
        List<PreOrderTable> preOrderTables = preOrderTableService.findAll();
        List<Tables> tablesList = tablesService.findAll();
        model.addAttribute("tablesList",tablesList);
        model.addAttribute("preOrders",preOrders);
        model.addAttribute("state",preOrderStates);
        model.addAttribute("tables",preOrderTables);
        return "/setting/predetermine/list";
    }

    @ResponseBody
    @RequestMapping("/byTime")
    public List<PreOrder> byTime(String time,String state,String date) {
        System.out.println(state+"-------------------");
        System.out.println(date+"-------------------");
        return preOrderService.findByTimeAndState(Integer.parseInt(state),date);
    }

    @RequestMapping("/foodlist")
    public String foodlist(Model model){
        List<Foods> foods =foodService.findAll(0);
        model.addAttribute("foods",foods);
        List<FoodType> foodTypes = foodTypeService.findAll();
        model.addAttribute("types",foodTypes);
        return "/setting/predetermine/foodMenu";
    }

    @InitBinder
    public void initBinder(ServletRequestDataBinder binder){
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),
                true));
    }
}

