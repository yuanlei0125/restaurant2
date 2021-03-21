package com.j170502.cateringmange.entity;

public class Grand {
    private Integer grandId;

    private String grandName;

    public Integer getGrandId() {
        return grandId;
    }

    public void setGrandId(Integer grandId) {
        this.grandId = grandId;
    }

    public String getGrandName() {
        return grandName;
    }

    public void setGrandName(String grandName) {
        this.grandName = grandName == null ? null : grandName.trim();
    }
}