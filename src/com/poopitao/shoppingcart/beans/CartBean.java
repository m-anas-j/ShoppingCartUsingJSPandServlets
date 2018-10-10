package com.poopitao.shoppingcart.beans;

import java.io.Serializable;
import java.util.ArrayList;

public class CartBean implements Serializable {

    private ArrayList<CartItemBean> cartItemList = new ArrayList<>();
    private double totalCost = 0;
    private int counter = 0;

    public boolean deleteItemFromCart(String itemName)
    {
        try {
            counter--;
            for (int i=0;i<cartItemList.size();i++)
            {
                System.out.println(cartItemList.get(i).getName() + itemName);
                if (cartItemList.get(i).getName().equalsIgnoreCase(itemName))
                {
                    cartItemList.remove(i);
                    System.out.println("Successfully removed item "+ itemName);
                    break;
                }
            }
            return true;
        }catch (Exception e)
        {
            System.out.println(e);
            return false;
        }
    }

    public void addItemToCart(CartItemBean newItem)
    {
        cartItemList.add(newItem);
        //calculateTotalCost(newItem.getName());
    }

    public void addItemToCart(String _name, String _serialNumber, String _description, double _unitCost, int _quantity, String _imageUrl)
    {
        if (_quantity!=0)
        {
            String currentItemName = _name;
            boolean itemAdded = false;
            for (int i=0;i<cartItemList.size();i++)
            {
                if (currentItemName.equalsIgnoreCase(cartItemList.get(i).getName()))
                {
                    cartItemList.get(i).setQuantity(cartItemList.get(i).getQuantity() + _quantity);
                    itemAdded = true;
                    break;
                }
            }
            if (!itemAdded)
            {
                counter++;
                CartItemBean newItem = new CartItemBean();
                newItem.setName(_name);
                newItem.setDescription(_description);
                newItem.setQuantity(_quantity);
                newItem.setSerialNumber(_serialNumber);
                newItem.setUnitCost(_unitCost);
                newItem.setUnitTotalCost(_unitCost*_quantity);
                newItem.setUrl(_imageUrl);
                cartItemList.add(newItem);
            }
            calculateTotalCost(_name);
        }
    }

    protected void calculateTotalCost()
    {
        for (int i = 0;i<cartItemList.size();i++)
        {
            totalCost += cartItemList.get(i).getUnitTotalCost();
        }
    }

    protected void calculateTotalCost(String itemName)
    {
        //totalCost += cartItemList.get(itemIndex-1).getUnitTotalCost();
    }

    public String getItem1Name()
    {
        return cartItemList.get(0).getName();
    }

    public ArrayList<CartItemBean> getCartItemList() {
        return cartItemList;
    }

    public void setCartItemList(ArrayList<CartItemBean> cartItemList) {
        this.cartItemList = cartItemList;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public int getCounter() {
        return counter;
    }

    public void setCounter(int counter) {
        this.counter = counter;
    }
}
