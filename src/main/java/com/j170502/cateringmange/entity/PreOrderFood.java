package com.j170502.cateringmange.entity;

public class PreOrderFood {
    private Integer preOrderFoodId;

    private Integer foodId;

    private Integer preOrderId;

    public Integer getPreOrderFoodId() {
        return preOrderFoodId;
    }

    public void setPreOrderFoodId(Integer preOrderFoodId) {
        this.preOrderFoodId = preOrderFoodId;
    }

    public Integer getFoodId() {
        return foodId;
    }

    public void setFoodId(Integer foodId) {
        this.foodId = foodId;
    }

    public Integer getPreOrderId() {
        return preOrderId;
    }

    public void setPreOrderId(Integer preOrderId) {
        this.preOrderId = preOrderId;
    }
}