<%@ page import="com.poopitao.shoppingcart.servlets.CartController" %>
<%@ page import="com.poopitao.shoppingcart.beans.CartBean" %>
<%@ page import="com.poopitao.shoppingcart.database.ItemDatabaseHandler" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.poopitao.shoppingcart.beans.CartItemBean" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home Screen</title>
    <style>
        *{
            margin:0;
            padding:0;
        }
        #cardWrapper1{
            margin: 10px;
            height: 150px;
            padding: 20px;
            background: darkslategray;
            border-radius: 5px;
        }
        #cardWrapper2{
            margin: 10px;
            height: fit-content;
            padding: 5px;
            background: antiquewhite;
            border-radius: 5px;
        }
        #cardWrapper3{
            background: aquamarine;
            margin: 10px;
            height: fit-content;
            margin-left: 480px;
            padding: 10px;
            border-radius: 5px;
        }
        #cardWrapper4{
            background: cornflowerblue;
            margin: 10px;
            height: fit-content;
            border-radius: 5px;
            padding: 10px;
        }
        #card1ContentContainer{
            padding: 10px;
            border-radius: 5px;
            background: aliceblue;
            vertical-align: middle;
        }
        input[type=text] {
            border: 5px  black;
            height: 30px;
            border-radius: 5px;
        }
        input[type=password] {
            border: 1px solid #999;
            height: 20px;
            border-radius: 5px;
        }
        input[type=submit]{
            border-radius: 5px;
            background: aliceblue;
            width: 100px;
            height: 30px;
        }
    </style>
</head>

<%
    //Database connection
    ItemDatabaseHandler itemDatabaseHandler = new ItemDatabaseHandler("mayosenpai","mayosenpai");
    ResultSet result = itemDatabaseHandler.getItems();
    ArrayList<CartItemBean> cartItemBeans = new ArrayList<>();
    int j = 0;
    try
    {
        while (result.next())
        {
            //Get each column values in each iteration and create an ItemBean object using those properties
            String name = result.getString("NAME");
            String serialNumber = result.getString("SERIALNUMBER");
            String description = result.getString("DESCRIPTION");
            double unitCost = result.getDouble("UNITCOST");
            double unitTotalCost = result.getDouble("UNITTOTALCOST");
            int quantity = result.getInt("QUANTITY");
            String imageUrl = result.getString("IMAGEURL");
            CartItemBean itemBean = new CartItemBean();
            itemBean.setName(name);
            itemBean.setQuantity(quantity);
            itemBean.setUnitCost(unitCost);
            itemBean.setUnitTotalCost(unitTotalCost);
            itemBean.setDescription(description);
            itemBean.setSerialNumber(serialNumber);
            itemBean.setUrl(imageUrl);
            cartItemBeans.add(itemBean);
            /*try
            {
                out.println(itemBeans.get(j).getName());
                j++;
            }catch (Exception e)
            {
                out.print(e);
            }
            out.print("<br>");*/
        }
    }
    catch (SQLException e)
    {
        System.out.println("Exception while trying to add items from database to homescreen " + e);
    }
%>
<body>
<div id="cardWrapper1">
    <div id="card1ContentContainer">
        <h2>This is the first card</h2>
        <p>bla bla bla</p>
        <form action="index.jsp">
            Username: <input type="text" size="30" height="30">
            <br>
            Password: <input type="password" id="passWord"/>
            <br>
            Image:
            <input type="submit" value="Log In"/>
        </form>
    </div>
</div>
<div id="cardWrapper2">
    <h2></h2>
    <p></p>
    <div id="cardWrapper3">

            <h2>This is the 3rd card</h2>
            <p>yay yay yay</p>

            <%
                for (int i=0; i<cartItemBeans.size();i++)
                {
            %>
                    <div style="margin: 10px;
                    padding: 20px;
                    background: beige;
                    border-radius: 10px;
                    width: fit-content;">
                        <form action="servlet/CartController" method="post" >
                            <%=cartItemBeans.get(i).getName()%> <input type="hidden" name="itemName" value="<%=cartItemBeans.get(i).getName()%>">
                            <br>
                            Serial Number: AJ135 <input type="hidden" name="itemSerialNumber" value="<%=cartItemBeans.get(i).getSerialNumber()%>">
                            <br>
                            Image: <img src="<%=cartItemBeans.get(i).getUrl()%>" width="300" height="300">
                            <br>
                            Description: <%=cartItemBeans.get(i).getDescription()%><input type="hidden" name="itemDescription" value="<%=cartItemBeans.get(i).getDescription()%>">
                            <br>
                            Quantity: <input type="text" name="itemQuantity" value="<%=cartItemBeans.get(i).getQuantity()%>">
                            <br>
                            Price: <%=cartItemBeans.get(i).getUnitCost()%>$ <input type="hidden" name="itemCost" value="<%=cartItemBeans.get(i).getUnitCost()%>">
                            <br>
                            <input type="submit" value="Add to cart" name="addToCart">
                            <br>
                            <input type="hidden" name="action" value="add">
                            <br>
                        </form>
                    </div>
            <%
                }
            %>

    </div>
    <div id="cardWrapper4">
        <h2>This is the 4th card</h2>
        <p>yay yay yay</p>
    </div>
</div>

</body>
</html>