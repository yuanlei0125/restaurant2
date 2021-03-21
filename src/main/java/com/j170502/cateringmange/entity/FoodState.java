package com.j170502.cateringmange.entity;

public class FoodState {
    private Integer foodStateId;

    private String foodState;

    public Integer getFoodStateId() {
        return foodStateId;
    }

    public void setFoodStateId(Integer foodStateId) {
        this.foodStateId = foodStateId;
    }

    public String getFoodState() {
        return foodState;
    }

    public void setFoodState(String foodState) {
        this.foodState = foodState == null ? null : foodState.trim();
    }
}