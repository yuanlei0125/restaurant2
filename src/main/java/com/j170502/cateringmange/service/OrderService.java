package com.j170502.cateringmange.service;

import com.j170502.cateringmange.dao.MemberMapper;
import com.j170502.cateringmange.dao.OrderMapper;
import com.j170502.cateringmange.dao.RecordMapper;
import com.j170502.cateringmange.entity.Member;
import com.j170502.cateringmange.entity.Order;
import com.j170502.cateringmange.entity.Record;
import com.j170502.cateringmange.entity.SnackNum;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class OrderService {
    @Resource
    private OrderMapper orderMapper;
    @Resource
    private SnackNumService snackNumService;
    @Resource
    private MemberMapper memberMapper;
    @Resource
    private RecordMapper recordMapper;
    public List<Order> findAll(){
      return orderMapper.findAll();
    }
    public int saveOrder(Order order){
        return orderMapper.insertSelective(order);
    }
    public Order findSnackOrder(){
        return orderMapper.findSnackOrder();
    }
    public void updateOrder(Order order, int userId){
        Date time=new Date();
        order.setCreateTime(time);
        order.setOrderState(2);
        order.setPayTime(time);
        order.setOrderWaiter(userId);

       orderMapper.updateByPrimaryKeySelective(order);
       saveSnackOrder();
        SnackNum snackNum= snackNumService.findLast();
        SnackNum snackNum1=new SnackNum();
        int num=snackNum.getNumName()+1;
        snackNum1.setNumName(num);
        snackNumService.saveSnackNum(snackNum1);
//        if(id!=0){
//            Member member=memberMapper.selectByPrimaryKey(id);
//            int orderPrice1=(member.getBalance()/100)-order.getOrderPrice();
//            member.setBalance(orderPrice1);
//            memberMapper.updateByPrimaryKeySelective(member);
//            Record record=new Record();
//            record.setMemberId(id);
//            record.setRecordTime(time);
//            record.setRecordContent("消费"+order.getOrderPrice());
//        }

    }
    public int saveSnackOrder(){
        Order order=new Order();
        Date time=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmm");

        StringBuffer orderNum=new StringBuffer("K");
        orderNum.append(sdf.format(time));
        orderNum.append(new Random().nextInt(1000));
       order.setOrderNum(orderNum.toString());
       order.setOrderType(3);
       order.setOrderState(1);
        return orderMapper.insertSelective(order);
    }
}
