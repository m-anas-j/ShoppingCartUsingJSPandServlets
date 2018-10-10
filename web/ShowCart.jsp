<%@ page import="com.poopitao.shoppingcart.beans.CartBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.poopitao.shoppingcart.beans.CartItemBean" %><%--
  Created by IntelliJ IDEA.
  User: Weisslogia
  Date: 24-Sep-18
  Time: 4:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping Cart</title>

    <style>

     <%--   .cartCard{
            height: 1080px;
            width: 1920px;
            border-radius: 10px;
            background: bisque;
        } --%>



        #cartContentCard{
            position: absolute;
            padding: 20px;
            margin-top: 10px;
            background: #3d3a3a;
            border-radius: 10px;
            box-sizing: border-box;
            height: 500px;
            width: 600px;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
        }
        #cartContentCard > img
        {
            height: 450px;
            width: 300px;
            border-radius: 5px;
            display: inline-block;
            vertical-align: middle;
        }
        #cartItemDescription
        {
            height: 450px;
            width: 200px;
            padding: 20px;
            border-radius: 5px;
            background: lightgrey;
            box-sizing: border-box;
            display: inline-block;
        }

        h3
        {
            font-family: "Product Sans";
            color: white;
        }
        p
        {
            font-family: "Product Sans";
            color: white;
        }

    </style>

</head>
<body>
<jsp:useBean id="cart" scope="session" class="com.poopitao.shoppingcart.beans.CartBean" />
<div id="shoppingCart">

    <%
        try
        {
            cart = (CartBean) session.getAttribute("cart");
            if (cart!=null)
            {
                ArrayList<CartItemBean> cartItemList = cart.getCartItemList();
                if (cartItemList.size()==0)
                {
                    out.print("Cart is empty");
                }
                else
                {
                for (int i=0;i<cartItemList.size();i++)
                {
                    out.println(cartItemList.get(i).getName() + ": " + cartItemList.get(i).getQuantity());
    %>
    <br>

    <div class="cartCard">

        <div id="cartContentCard">
            <img src="<%=cartItemList.get(i).getUrl()%>">
            <form action="servlet/CartController" method="post">
                <input type="submit" value="Remove from cart">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="itemName" value="<%=cartItemList.get(i).getName()%>">
            </form>

            <div id="cartItemDescription">
                <h3> <%=cartItemList.get(i).getName()%> </h3>
                <p> <%=cartItemList.get(i).getDescription()%> </p>
            </div>

        </div>

    </div>



    <br>
    <%
                    }
                }
            }
        }catch (Exception e)
        {
            out.println("Exception in trying to show cart: " + e);
        }
    %>
    <form action="homescreen.jsp">
        <input type="submit" value="Back home">
    </form>
</div>
</body>
</html>
