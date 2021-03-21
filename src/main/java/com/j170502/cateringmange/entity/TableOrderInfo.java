package com.j170502.cateringmange.entity;

import java.util.Date;

public class TableOrderInfo {
    private Integer tableOrderId;

    private Integer tableId;

    private Integer orderId;

    private Date createTime;

    private String remark;

    private Integer numOfCustomer;

    private String orderFood;

    private String fightTable;

    public Integer getTableOrderId() {
        return tableOrderId;
    }

    public void setTableOrderId(Integer tableOrderId) {
        this.tableOrderId = tableOrderId;
    }

    public Integer getTableId() {
        return tableId;
    }

    public void setTableId(Integer tableId) {
        this.tableId = tableId;
    }

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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getNumOfCustomer() {
        return numOfCustomer;
    }

    public void setNumOfCustomer(Integer numOfCustomer) {
        this.numOfCustomer = numOfCustomer;
    }

    public String getOrderFood() {
        return orderFood;
    }

    public void setOrderFood(String orderFood) {
        this.orderFood = orderFood == null ? null : orderFood.trim();
    }

    public String getFightTable() {
        return fightTable;
    }

    public void setFightTable(String fightTable) {
        this.fightTable = fightTable == null ? null : fightTable.trim();
    }
}