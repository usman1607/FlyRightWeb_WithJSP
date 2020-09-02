package com.flyright.repository;

import com.flyright.model.Booking;
import com.flyright.model.Flight;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class BookingRepository {

    private Connection connection;

    public BookingRepository(Connection connection){
        this.connection = connection;
    }

    public BookingRepository()throws ClassNotFoundException, SQLException {

        //Load the JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Driver loaded");

        //Connect to Database
        connection = DriverManager.getConnection( "jdbc:mysql://localhost/airlinedb?userTimeZone=UTC&serverTimeZone=UTC" , "root", "Oluwatobiloba007");
        System.out.println("Database connected");
    }

    public List<Booking> getAll() {
        List<Booking> bookings = new ArrayList<Booking>();
        try{
            // create a statement
            Statement statement = connection.createStatement();

            //Excecute a sttement
            ResultSet resultSet = statement.executeQuery("select id, number, flightNo, date_Time, takeOff_Point, destination, seat_No from bookings");

            // Iterate through the result
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String number = resultSet.getString(2);
                String flightNo = resultSet.getString(3);
                Date date_Time = resultSet.getDate(4);
                String takeOff_Point = resultSet.getString(5);
                String destination = resultSet.getString(6);
                int seat_No = resultSet.getInt(7);
                Booking booking = new Booking(id, number, flightNo, date_Time, takeOff_Point, destination, seat_No);
                bookings.add(booking);
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return bookings;
    }

    public boolean createBooking(String number, String flightNo, Date date_Time, String takeOff_point, String destination,  int seat_No) {
        try{
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a statement
            int count= statement.executeUpdate("insert into bookings (number, flightNo, date_Time, takeOff_point, destination, seat_No) values ('"+number+"','"+flightNo+"','"+date_Time+"','"+takeOff_point+"','"+destination+"', '"+seat_No+"')");
            if(count >0) {
                return true;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

    public List<String> getAllBookingNo() {
        List<String> b_numbers = new ArrayList<String>();
        try{
            // create a statement
            Statement statement = connection.createStatement();

            //Excecute a sttement
            ResultSet resultSet = statement.executeQuery("select number from bookings");

            // Iterate through the result
            while (resultSet.next()) {
                String number = resultSet.getString(1);
                b_numbers.add(number);
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return b_numbers;
    }

    public String generateUniqueId(List<String>  b_numbers) {
        Random rand = new Random(); //instance of random class
        //generate random values from 0-1000000
        int num = 0, count = 0; String uniqueId;
        do{
            num = rand.nextInt(1000000);
            uniqueId = ( "00" + Integer.toString(num) );
            for(String bn : b_numbers) {
                if(bn.equals(uniqueId)) {
                    count++;
                }
            }
        }while(count != 0);

        return uniqueId;
    }

    public Booking find(String number){
        Booking b = null;
        try{
            // create a statement
            Statement statement = connection.createStatement();

            //Excecute a sttement
            ResultSet resultSet = statement.executeQuery("select id, number, flightNo, date_Time, takeOff_Point, destination, seat_No from bookings where number = '"+number+"'");

            // Iterate through the result
            while (resultSet.next()) {

                int id = resultSet.getInt(1);
                String flightNo = resultSet.getString(3);
                Date date_Time = resultSet.getDate(4);
                String takeOff_Point = resultSet.getString(5);
                String destination = resultSet.getString(6);
                int seat_No = resultSet.getInt(7);
                b = new Booking(id, number, flightNo, date_Time, takeOff_Point, destination, seat_No);
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return b;
    }

    public boolean update(String number, String flightNo, Date date_Time, String takeOff_Point, String destination, int seat_No) {
        try{
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a statement
            int count = statement.executeUpdate("update bookings set flightNo ='"+flightNo+"',date_Time='"+date_Time+"',takeOff_Point='"+takeOff_Point+"',destination='"+destination+"',seat_No='"+seat_No+"' where number='"+number+"'");
            if(count >0) {
                return true;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

    public boolean removeBook(String number){
        try{
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a statement
            int count = statement.executeUpdate("delete from bookings where number='"+number+"'");
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
