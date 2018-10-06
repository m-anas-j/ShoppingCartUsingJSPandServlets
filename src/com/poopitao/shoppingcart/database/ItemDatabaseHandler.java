package com.poopitao.shoppingcart.database;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemDatabaseHandler {

    Connection con=null;
    Statement statement;
    static ResultSet result;
    CallableStatement callableStatement;

    public ItemDatabaseHandler(String username, String password)
    {
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE",username,password);
            statement=con.createStatement();
            System.out.println("Connection to database successful");
        }
        catch(Exception e)
        {
            System.out.println("Error while connecting to database "+e);
        }
    }


    public ResultSet getItems()
    {
        String query = "SELECT * FROM ITEM_LIST";
        try
        {
            result = statement.executeQuery(query);
            return result;
        }catch (SQLException e)
        {
            System.out.println(e);
            return null;
        }
    }


    public void clearMemory() throws SQLException
    {
        con.close();
        statement.close();
        System.out.println("Thank you for taking care of me <3");
    }


}

