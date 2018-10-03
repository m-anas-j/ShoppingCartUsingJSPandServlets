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
    <form action="servlet/CartController" method="post">
        <input type="submit" value="Remove from cart">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="itemName" value="<%=cartItemList.get(i).getName()%>">
    </form>
    <br>
    <%
                    }
                }
            }
        }catch (Exception e)
        {
            out.print("cart empty boi");
        }
    %>
    <form action="homescreen.jsp">
        <input type="submit" value="Back home">
    </form>
</div>
</body>
</html>
