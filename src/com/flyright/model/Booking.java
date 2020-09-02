package com.flyright.model;

import java.sql.Date;

public class Booking {
    int id;
    String number;
    String flightNo;
    Date date_Time;
    String takeOff_Point;
    String destination;
    int seat_No;

    public Booking(){

    }

    public Booking(int id, String number, String flightNo, Date date_Time, String takeOff_Point, String destination,  int seat_No){
        this.id = id;
        this.number = number;
        this.flightNo = flightNo;
        this.date_Time = date_Time;
        this.takeOff_Point = takeOff_Point;
        this.destination = destination;
        this.seat_No = seat_No;
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

    public void setFlightNo(String flightNo){
        this.flightNo = flightNo;
    }

    public String getFlightNo(){
        return flightNo;
    }

    public void setDate_Time(Date date_Time){
        this.date_Time = date_Time;
    }

    public Date getDate_Time(){
        return date_Time;
    }

    public void setTakeOff_Point(String takeOff_Point){
        this.takeOff_Point = takeOff_Point;
    }

    public String getTakeOff_Point(){
        return takeOff_Point;
    }

    public void setDestination(String destination){
        this.destination = destination;
    }

    public String getDestination(){
        return destination;
    }

    public void setSeatNo(int seat_No) {
        this.seat_No = seat_No;
    }

    public int getSeatNo() {
        return seat_No;
    }
}

