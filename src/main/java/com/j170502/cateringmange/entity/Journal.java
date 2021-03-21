package com.j170502.cateringmange.entity;

import java.util.Date;

public class Journal {
    private Integer journalId;

    private Date journalTime;

    private Integer grandId;

    private String grandName;

    private String userName;

    public String getGrandName() {
        return grandName;
    }

    public void setGrandName(String grandName) {
        this.grandName = grandName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    private Integer userId;

    private String journalText;

    public Integer getJournalId() {
        return journalId;
    }

    public void setJournalId(Integer journalId) {
        this.journalId = journalId;
    }

    public Date getJournalTime() {
        return journalTime;
    }

    public void setJournalTime(Date journalTime) {
        this.journalTime = journalTime;
    }

    public Integer getGrandId() {
        return grandId;
    }

    public void setGrandId(Integer grandId) {
        this.grandId = grandId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getJournalText() {
        return journalText;
    }

    public void setJournalText(String journalText) {
        this.journalText = journalText == null ? null : journalText.trim();
    }

    public Journal(String grandName, String userName, String journalText) {
        this.grandName = grandName;
        this.userName = userName;
        this.journalText = journalText;
    }

    public Journal() {

    }
}