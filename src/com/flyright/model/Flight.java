package com.flyright.model;

import java.sql.Date;

public class Flight {
    int id;
    String number;
    String aircraftNo;
    double price;
    String takeOff_Point;
    Date takeOff_Time;
    String destination;
    int availableSeats;

    Aircraft aircraft = new Aircraft();

    public Flight() {

    }

    public Flight(double price) {
        this.price = price;
    }

    public Flight(int id, String number, String aircraftNo, double price, String takeOff_Point, Date takeOff_Time, String destination, int availableSeats){
        this.id = id;
        this.number = number;
        this.aircraftNo = aircraftNo;
        this.price = price;
        this.takeOff_Point = takeOff_Point;
        this.takeOff_Time = takeOff_Time;
        this.destination = destination;
        this.availableSeats = availableSeats;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setNumber(String number){
        this.number = number;
    }

    public String getNumber(){
        return number;
    }

    public void setAircraftNo(String aircraftNo){
        this.aircraftNo = aircraftNo;
    }

    public String getAircraftNo(){
        return aircraftNo;
    }

    public void setPrice(double price){
        this.price = price;
    }

    public double getPrice(){
        return price;
    }

    public void setTakeOff_Point(String takeOff_Point){
        this.takeOff_Point = takeOff_Point;
    }

    public String getTakeOff_Point(){
        return takeOff_Point;
    }

    public void setTakeOff_Time(Date takeOff_Time){
        this.takeOff_Time = takeOff_Time;
    }

    public Date getTakeOff_Time(){
        return takeOff_Time;
    }

    public void setDestination(String destination){
        this.destination = destination;
    }

    public String getDestination(){
        return destination;
    }

    public void setAvailableSeats(int availableSeats) {
        this.availableSeats = availableSeats;
    }

    public int getAvailableSeats() {
        return availableSeats;
    }
}

