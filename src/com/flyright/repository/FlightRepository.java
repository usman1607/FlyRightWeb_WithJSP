package com.flyright.repository;

import com.flyright.model.Aircraft;
import com.flyright.model.Flight;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FlightRepository {

    private Connection connection;

    public FlightRepository(Connection connection){
        this.connection = connection;
    }

    public FlightRepository()throws ClassNotFoundException, SQLException {

        //Load the JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Driver loaded");

        //Connect to Database
        connection = DriverManager.getConnection( "jdbc:mysql://localhost/airlinedb?userTimeZone=UTC&serverTimeZone=UTC" , "root", "Oluwatobiloba007");
        System.out.println("Database connected");
    }

    public List<Flight> getAll() {
        List<Flight> flights = new ArrayList<Flight>();
        try{
            // create a statement
            Statement statement = connection.createStatement();

            //Excecute a sttement
            ResultSet resultSet = statement.executeQuery("select id, number, aircraftNo, price, takeOff_Point, takeOff_Time, destination, availableSeats from flights");

            // Iterate through the result
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String number = resultSet.getString(2);
                String aircraftNo = resultSet.getString(3);
                double price = resultSet.getDouble(4);
                String takeOff_Point = resultSet.getString(5);
                Date takeOff_Time = resultSet.getDate(6);
                String destination = resultSet.getString(7);
                int availableSeats = resultSet.getInt(8);
                Flight flight = new Flight(id, number, aircraftNo, price, takeOff_Point, takeOff_Time, destination, availableSeats);
                flights.add(flight);
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return flights;
    }

    public boolean create(String number, String aircraftNo, double price, String takeOff_Point, Date takeOff_Time, String destination, int availableSeats) throws Exception {
        AircraftRepository aircraftRepository = new AircraftRepository(connection);
        Aircraft aircraft = aircraftRepository.find(aircraftNo);
        if(aircraft == null){
            System.out.printf("Aircfratf %s cannot be found \n",aircraftNo);
            return false;
        }
        try{
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a statement
            int count= statement.executeUpdate("insert into flights (number, aircraftNo, price, takeOff_Point, takeOff_Time, destination, availableSeats) values ('"+number+"','"+aircraftNo+"','"+price+"','"+takeOff_Point+"','"+takeOff_Time+"','"+destination+"','"+availableSeats+"')");
            if(count >0) {
                return true;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

    public Flight find(String number){
        Flight f = null;
        try{
            // create a statement
            Statement statement = connection.createStatement();

            //Excecute a sttement
            ResultSet resultSet = statement.executeQuery("select id, number, aircraftNo, price, takeOff_Point, takeOff_Time, destination, availableSeats from flights where number = '"+number+"'");

            // Iterate through the result
            while (resultSet.next()) {

                int id = resultSet.getInt(1);
                String aircraftNo = resultSet.getString(3);
                double price = resultSet.getDouble(4);
                String takeOff_Point = resultSet.getString(5);
                Date takeOff_Time = resultSet.getDate(6);
                String destination = resultSet.getString(7);
                int availableSeats = resultSet.getInt(8);
                f = new Flight(id, number, aircraftNo, price, takeOff_Point, takeOff_Time, destination, availableSeats);

            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return f;
    }

    public boolean updateFli(String number, String aircraftNo, double price, String takeOff_Point, Date takeOff_Time, String destination, int availableSeats){
        try{
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a statement
            int count = statement.executeUpdate("update flights set aircraftNo ='"+aircraftNo+"',price='"+price+"',takeOff_Point='"+takeOff_Point+"', takeOff_Time='"+takeOff_Time+"', destination='"+destination+"', availableSeats='"+availableSeats+"' where number='"+number+"'");
            if(count >0) {
                return true;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

    public boolean removeFli(String number){
        try{
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a statement
            int count = statement.executeUpdate("delete from flights where number='"+number+"'");
            if(count >0) {
                return true;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

    public List<Flight> findAvailableFlight(String takeOff_Point, String destination) {
        int count = 0;
        List<Flight> ava_f = new ArrayList<Flight>();
        List<Flight> flights = getAll();
        for(Flight f: flights){
            if((f.getTakeOff_Point().equals(takeOff_Point)) && (f.getDestination().equals(destination)) && (f.getAvailableSeats() > 0)){
                ava_f.add(f);
                count++;
            }
        }
        if(count == 0) {
            System.out.printf("There is no Flight going from %s to %s available now.\n", takeOff_Point, destination);
            return null;
        }else{
            System.out.printf("There are/is %d Flight going from %s to %s available, they are:\n", count, takeOff_Point, destination);
        }
        return ava_f;
    }

    public boolean updateAvaSeat(String number, int availableSeats){
        try{
            // Create a statement
            Statement statement = connection.createStatement();

            // Execute a statement
            int count = statement.executeUpdate("update flights set availableSeats='"+availableSeats+"' where number='"+number+"'");
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
