package com.j170502.cateringmange.entity;

public class FoodFlavor {
    private Integer flavorId;

    private String flavorName;

    public Integer getFlavorId() {
        return flavorId;
    }

    public void setFlavorId(Integer flavorId) {
        this.flavorId = flavorId;
    }

    public String getFlavorName() {
        return flavorName;
    }

    public void setFlavorName(String flavorName) {
        this.flavorName = flavorName == null ? null : flavorName.trim();
    }
}