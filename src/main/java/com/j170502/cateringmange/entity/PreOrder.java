package com.j170502.cateringmange.entity;

import java.util.Date;

public class PreOrder {
    private Integer preOrderId;

    private String preNum;

    private String custome;

    private String customeTel;

    private Integer customeNum;

    private Date preOrderTime;

    private Integer keeptime;

    private Integer deposit;

    private Integer preState;

    private String tabelName;

    public Integer getPreOrderId() {
        return preOrderId;
    }

    public void setPreOrderId(Integer preOrderId) {
        this.preOrderId = preOrderId;
    }

    public String getPreNum() {
        return preNum;
    }

    public void setPreNum(String preNum) {
        this.preNum = preNum;
    }

    public String getCustome() {
        return custome;
    }

    public void setCustome(String custome) {
        this.custome = custome;
    }

    public String getCustomeTel() {
        return customeTel;
    }

    public void setCustomeTel(String customeTel) {
        this.customeTel = customeTel;
    }

    public Integer getCustomeNum() {
        return customeNum;
    }

    public void setCustomeNum(Integer customeNum) {
        this.customeNum = customeNum;
    }

    public Date getPreOrderTime() {
        return preOrderTime;
    }

    public void setPreOrderTime(Date preOrderTime) {
        this.preOrderTime = preOrderTime;
    }

    public Integer getKeeptime() {
        return keeptime;
    }

    public void setKeeptime(Integer keeptime) {
        this.keeptime = keeptime;
    }

    public Integer getDeposit() {
        return deposit;
    }

    public void setDeposit(Integer deposit) {
        this.deposit = deposit;
    }

    public Integer getPreState() {
        return preState;
    }

    public void setPreState(Integer preState) {
        this.preState = preState;
    }

    public String getTabelName() {
        return tabelName;
    }

    public void setTabelName(String tabelName) {
        this.tabelName = tabelName;
    }
}