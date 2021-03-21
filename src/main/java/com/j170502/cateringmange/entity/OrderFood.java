package com.j170502.cateringmange.entity;

public class OrderFood {
    private Integer orderFoodId;

    private Integer orderId;

    private Integer tableId;

    private Integer foodId;

    private Integer fightTableId;

    private Integer foodCount;

    public Integer getOrderFoodId() {
        return orderFoodId;
    }

    public void setOrderFoodId(Integer orderFoodId) {
        this.orderFoodId = orderFoodId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getTableId() {
        return tableId;
    }

    public void setTableId(Integer tableId) {
        this.tableId = tableId;
    }

    public Integer getFoodId() {
        return foodId;
    }

    public void setFoodId(Integer foodId) {
        this.foodId = foodId;
    }

    public Integer getFightTableId() {
        return fightTableId;
    }

    public void setFightTableId(Integer fightTableId) {
        this.fightTableId = fightTableId;
    }

    public Integer getFoodCount() {
        return foodCount;
    }

    public void setFoodCount(Integer foodCount) {
        this.foodCount = foodCount;
    }

    public OrderFood(){

    }
}