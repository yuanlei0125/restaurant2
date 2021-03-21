package com.j170502.cateringmange.entity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class Order {
    private Integer orderId;

    private Date createTime;

    private Integer orderType;

    private Integer orderState;

    private Integer tableId;

    private Integer peopleNum;

    private Integer orderPrice;

    private Integer orderWaiter;

    private String orderCashier;

    private Date payTime;

    private String orderNum;

    private String remark;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getOrderType() {
        return orderType;
    }

    public void setOrderType(Integer orderType) {
        this.orderType = orderType;
    }

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }

    public Integer getTableId() {
        return tableId;
    }

    public void setTableId(Integer tableId) {
        this.tableId = tableId;
    }

    public Integer getPeopleNum() {
        return peopleNum;
    }

    public void setPeopleNum(Integer peopleNum) {
        this.peopleNum = peopleNum;
    }

    public Integer getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(Integer orderPrice) {
        this.orderPrice = orderPrice;
    }

    public Integer getOrderWaiter() {
        return orderWaiter;
    }

    public void setOrderWaiter(Integer orderWaiter) {
        this.orderWaiter = orderWaiter;
    }

    public String getOrderCashier() {
        return orderCashier;
    }

    public void setOrderCashier(String orderCashier) {
        this.orderCashier = orderCashier == null ? null : orderCashier.trim();
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum == null ? null : orderNum.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
    public Order(){

    }
    //大厅点餐信息生成订单的方法
    public Order(TableOrderInfo tableOrderInfo){
        this.createTime = tableOrderInfo.getCreateTime();
        this.peopleNum=tableOrderInfo.getNumOfCustomer();
        this.tableId= tableOrderInfo.getTableId();
        //默认为新单
        this.orderState=1;
        //默认为堂吃
        this.orderType=1;
        //生成订单编号
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        StringBuffer orderNum =new StringBuffer("TC");
        orderNum.append(sdf.format(this.createTime));
        //最后加上随机数转十六进制
        orderNum.append(Integer.toHexString(new Random().nextInt(1000)));
        this.orderNum= orderNum.toString();
    }
}