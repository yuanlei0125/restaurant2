package com.j170502.cateringmange.entity;

public class PreOrderTable {
    private Integer preOrderTableId;

    private Integer preOrderId;

    private Integer tableId;

    private Integer tableState;

    public Integer getTableState() {
        return tableState;
    }

    public void setTableState(Integer tableState) {
        this.tableState = tableState;
    }

    public Integer getPreOrderTableId() {
        return preOrderTableId;
    }

    public void setPreOrderTableId(Integer preOrderTableId) {
        this.preOrderTableId = preOrderTableId;
    }

    public Integer getPreOrderId() {
        return preOrderId;
    }

    public void setPreOrderId(Integer preOrderId) {
        this.preOrderId = preOrderId;
    }

    public Integer getTableId() {
        return tableId;
    }

    public void setTableId(Integer tableId) {
        this.tableId = tableId;
    }
}