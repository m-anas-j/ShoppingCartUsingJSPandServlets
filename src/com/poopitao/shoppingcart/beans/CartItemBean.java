package com.poopitao.shoppingcart.beans;

import java.io.Serializable;

public class CartItemBean implements Serializable{


    private String name;
    private String serialNumber;
    private String description;
    private double unitCost;
    private double unitTotalCost;
    private int quantity;
    private String url;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getUnitCost() {
        return unitCost;
    }

    public void setUnitCost(double unitCost) {
        this.unitCost = unitCost;
    }

    public double getUnitTotalCost() {
        return unitTotalCost;
    }

    public void setUnitTotalCost(double unitTotalCost) {
        this.unitTotalCost = unitTotalCost;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
