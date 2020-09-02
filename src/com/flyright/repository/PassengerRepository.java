package com.flyright.repository;

import com.flyright.model.Passenger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PassengerRepository {

    private Connection connection;

    public PassengerRepository(Connection connection){
        this.connection = connection;
    }

    public PassengerRepository()throws ClassNotFoundException, SQLException {

        //Load the JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Driver loaded");

        //Connect to Database
        connection = DriverManager.getConnection( "jdbc:mysql://localhost/airlinedb?userTimeZone=UTC&serverTimeZone=UTC" , "root", "Oluwatobiloba007");
        System.out.println("Database connected");
    }

    public List<Passenger> getAll() {
        List<Passenger> passengers = new ArrayList<Passenger>();
        try{
            // create a statement
            Statement statement = connection.createStatement();

            //Excecute a sttement
            ResultSet resultSet = statement.executeQuery("select id, bookingNo, name, address, email, phone_No from passengers");

            // Iterate through the result
            while (resultSet.next()) {

                int id = resultSet.getInt(1);
                String bookingNo = resultSet.getString(2);
                String name = resultSet.getString(3);
                String address = resultSet.getString(4);
                String email = resultSet.getString(5);
                String phone_No = resultSet.getString(6);
                Passenger passenger = new Passenger(id, bookingNo, name, address, email, phone_No);
                passengers.add(passenger);
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return passengers;
    }

    public boolean create(String bookingNo, String name, String address, String email, String phone_No) {
        try{
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a statement
            int count= statement.executeUpdate("insert into passengers (bookingNo,name,address,email,phone_No) values ('"+bookingNo+"','"+name+"','"+address+"','"+email+"','"+phone_No+"')");
            if(count >0) {
                return true;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

    public Passenger find(String bookingNo){
        Passenger p = null;
        try{
            // create a statement
            Statement statement = connection.createStatement();

            //Excecute a sttement
            ResultSet resultSet = statement.executeQuery("select id, bookingNo, name, address, email, phone_No from passengers where bookingNo = '"+bookingNo+"'");

            // Iterate through the result
            while (resultSet.next()) {

                int id = resultSet.getInt(1);
                String name = resultSet.getString(3);
                String address = resultSet.getString(4);
                String email = resultSet.getString(5);
                String phone_No = resultSet.getString(6);
                p = new Passenger(id, bookingNo, name, address, email, phone_No);
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return p;
    }

    public boolean update(String bookingNo, String name, String address, String email, String phone_No) {
        try{
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a statement
            int count = statement.executeUpdate("update passengers set name ='"+name+"',address='"+address+"',email='"+email+"',phone_No='"+phone_No+"' where bookingNo='"+bookingNo+"'");
            if(count >0) {
                return true;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

    public boolean removePers(String bookingNo){
        try{
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a statement
            int count = statement.executeUpdate("delete from passengers where bookingNo='"+bookingNo+"'");
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
