package com.flyright.repository;

import com.flyright.model.Aircraft;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AircraftRepository {
    private Connection connection;

    public AircraftRepository(Connection connection){
        this.connection = connection;
    }

    public AircraftRepository()throws ClassNotFoundException, SQLException {

        //Load the JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Driver loaded");

        //Connect to Database
        connection = DriverManager.getConnection( "jdbc:mysql://localhost/airlinedb?userTimeZone=UTC&serverTimeZone=UTC" , "root", "Oluwatobiloba007");
        System.out.println("Database connected");
    }

    public List<Aircraft> findAll() {
        return null;
    }

    public List<Aircraft> getAll() {
        List<Aircraft> aircrafts = new ArrayList<Aircraft>();
        try{
            // create a statement
            Statement statement = connection.createStatement();

            //Excecute a sttement
            ResultSet resultSet = statement.executeQuery("select id, reg_No, type, name, capacity from aircrafts");

            // Iterate through the result
            while (resultSet.next()) {

                int id = resultSet.getInt(1);
                String reg_No = resultSet.getString(2);
                String type = resultSet.getString(3);
                String name = resultSet.getString(4);
                int capacity = resultSet.getInt(5);
                Aircraft aircraft = new Aircraft(id, reg_No, type, name, capacity);
                aircrafts.add(aircraft);
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return aircrafts;
    }

    public boolean create(String reg_No, String type, String name, int capacity) throws Exception {
        try{
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a statement
            int count= statement.executeUpdate("insert into aircrafts (reg_No,type,name,capacity) values ('"+reg_No+"','"+type+"','"+name+"','"+capacity+"')");
            if(count >0) {
                return true;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

    public Aircraft find(String reg_No) throws Exception{
        Aircraft a = null;
        try{
            // create a statement
            Statement statement = connection.createStatement();

            //Excecute a sttement
            ResultSet resultSet = statement.executeQuery("select id, reg_No, type, name, capacity from aircrafts where reg_No = '"+reg_No+"'");

            // Iterate through the result
            while (resultSet.next()) {

                int id = resultSet.getInt(1);
                reg_No = resultSet.getString(2);
                String type = resultSet.getString(3);
                String name = resultSet.getString(4);
                int capacity = resultSet.getInt(5);
                a = new Aircraft(id,reg_No,type,name,capacity);
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return a;
    }

    public Aircraft findById(int id) throws SQLException {

        String query = "SELECT id, reg_No, type, name, capacity FROM aircrafts WHERE id=?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, id);

        //Execute statement.
        ResultSet resultSet = statement.executeQuery();
        if(resultSet.next()) {
            //int id = resultSet.getInt("id");
            String reg_No = resultSet.getString("reg_No");
            String type = resultSet.getString("type");
            String name = resultSet.getString("name");
            int capacity = resultSet.getInt("capacity");
            return new Aircraft(id,reg_No,type,name,capacity);
        }
        return null;
    }

    public boolean updateAir(String reg_No, String type, String name, int capacity){
        try{
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a statement
            int count = statement.executeUpdate("update aircrafts set type ='"+type+"',name='"+name+"',capacity='"+capacity+"' where reg_No='"+reg_No+"'");
            if(count >0) {
                return true;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

    public boolean removeAir(String reg_No){
        try{
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a statement
            int count = statement.executeUpdate("delete from aircrafts where reg_No='"+reg_No+"'");
            if(count >0) {
                return true;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

}
