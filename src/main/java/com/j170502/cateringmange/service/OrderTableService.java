package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.OrderFoodMapper;
import com.j170502.cateringmange.dao.OrderMapper;
import com.j170502.cateringmange.dao.TableOrderInfoMapper;
import com.j170502.cateringmange.dao.TablesMapper;
import com.j170502.cateringmange.entity.*;
import com.j170502.cateringmange.util.OptionState;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class OrderTableService {
    @Resource
    private TableOrderInfoMapper orderTableDAO;
    @Resource
    private TablesMapper tableDAO;
    @Resource
    private OrderMapper orderDAO;
    @Resource
    private OrderFoodMapper orderFoodDAO;
    public Integer saveTableOrderInfoAndOrder(TableOrderInfo orderTable,int waiter){
        //开台前看桌子有没有临时被其他客户端开台或者临时停用
        Tables table = tableDAO.selectByPrimaryKey(orderTable.getTableId());
        //桌子存在且空闲状态
        if(table != null &&table.getStateId() == 1 ){
            //创建时间
            Date now = new Date();
            orderTable.setCreateTime(now);
            //设置是否点餐
            orderTable.setOrderFood("0");
            //默认不拼桌
            orderTable.setFightTable("0");
            //设置默认值
            if(orderTable.getNumOfCustomer()==null){
                orderTable.setNumOfCustomer(1);
            }
            //用餐桌的点餐信息创建订单
            Order order = new Order(orderTable);
            order.setOrderWaiter(waiter);
            //插入记录
            orderDAO.insertSelective(order);
            orderTable.setOrderId(order.getOrderId());
            orderTableDAO.insertSelective(orderTable);
            //将桌子设为就餐状态
            table.setStateId(2);
            tableDAO.updateByPrimaryKey(table);
            //更新预订单--------------------------------


        }else{
            return OptionState.UNABLE;
        }
        return OptionState.SUCCESS;
    }
    public String  getOrderSate(Integer tableId){
        return orderTableDAO.findOrderState(tableId);
    }
    public int updateStates(Integer tableId, User user){
        //清台前看桌子有没有依然处于就餐状态或者预定状态
        Tables table = tableDAO.selectByPrimaryKey(tableId);
        if(table != null){
            //就餐状态
            if(table.getStateId()==2){
                //更新订单----------------------------------------------------------;
                Order order = orderDAO.findByTableId(tableId);
                if(order!=null){
                    //订单作废
                    order.setOrderState(4);
                    order.setRemark(user.getUserName()+"执行清台！");
                    orderDAO.updateByPrimaryKeySelective(order);
                }else{
                    return OptionState.UNABLE;
                }
            }else if(table.getStateId()==3){
                //更新预定单
            }
            table.setStateId(1);
            tableDAO.updateByPrimaryKey(table);
        }else{
            return OptionState.UNABLE;
        }
        return OptionState.SUCCESS;
    }
    public OrderNumAndTable findByTableId(int tableId){
        return  orderTableDAO.findVOByTableId(tableId);
    }

    public  int updateOrderFood(List<OrderFood> orderFoods){
        if(orderFoods.size()>0) {
            Order order = orderDAO.selectByPrimaryKey(orderFoods.get(0).getOrderId());
            if(order!=null){
                //插入点单信息
                orderFoodDAO.insertList(orderFoods);
                //从插入记录查询统计订单金额并修改到订单
                Integer price =  orderFoodDAO.findByOrderPrice(order.getOrderId());
                if(price!=null){
                    order.setOrderPrice(price);
                    orderDAO.updateByPrimaryKeySelective(order);
                }
                //修改桌子是否点餐
                TableOrderInfo tableOrderInfo = orderTableDAO.findByTableId(orderFoods.get(0).getTableId());
                if(tableOrderInfo!=null){
                    tableOrderInfo.setOrderFood("1");
                    orderTableDAO.updateByPrimaryKeySelective(tableOrderInfo);
                }

            }else{
                return  OptionState.UNABLE;
            }
            return OptionState.SUCCESS;
        }else{
            return OptionState.UNABLE;
        }

    }
}
