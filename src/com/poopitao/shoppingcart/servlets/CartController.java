package com.poopitao.shoppingcart.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import com.poopitao.shoppingcart.beans.*;
import com.poopitao.shoppingcart.database.ItemDatabaseHandler;

@WebServlet(name = "com.poopitao.shoppingcart.CartController")
public class CartController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action!=null && action!="")
        {
            if (action.equalsIgnoreCase("add"))
            {
                try
                {
                    addItemToCart(request);
                }catch (SQLException e)
                {
                    System.out.println("Exception in addItemToCart(request) " + e);
                }
            }
            else if (action.equalsIgnoreCase("delete"))
            {
                boolean cartEmpty = deleteItemFromCart(request);
            }
            response.sendRedirect("/ShowCart.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected boolean deleteItemFromCart(HttpServletRequest request)
    {
        CartBean cartBean = null;
        HttpSession session = request.getSession();
        String itemName = request.getParameter("itemName");
        System.out.println(itemName);
        Object objectCart = session.getAttribute("cart");
        if (objectCart!=null)
        {
            cartBean = (CartBean) objectCart;
        }
        else cartBean = new CartBean();
        boolean cartEmpty = cartBean.deleteItemFromCart(itemName);
        return cartEmpty;
    }

    protected void addItemToCart(HttpServletRequest request) throws SQLException
    {
        CartBean cartBean = null;
        HttpSession session = request.getSession();
        Object objectCart = session.getAttribute("cart");
        if (objectCart!=null)
        {
            cartBean = (CartBean) objectCart;
            System.out.println("Cart session found");
        }
        else
        {
            cartBean = new CartBean();
            session.setAttribute("cart", cartBean);
            System.out.println("New cart session created");
        }
        String name = request.getParameter("itemName");
        /*String serialNumber = request.getParameter("itemSerialNumber");
        String description = request.getParameter("itemDescription");
        double cost = Double.parseDouble(request.getParameter("itemCost"));
        int quantity = Integer.parseInt(request.getParameter("itemQuantity"));*/
        //cartBean.addItemToCart("anas","qqwe123","hello from the other side",100,200,2,1);
        ItemDatabaseHandler itemDatabaseHandler = new ItemDatabaseHandler("mayosenpai","mayosenpai");
        CartItemBean requiredItem = null;
        requiredItem = itemDatabaseHandler.getSingleItem(name);
        requiredItem.setQuantity(Integer.parseInt(request.getParameter("itemQuantity")));
        cartBean.addItemToCart(requiredItem);
        itemDatabaseHandler.clearMemory();
    }
}
