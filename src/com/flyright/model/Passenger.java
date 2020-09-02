package com.flyright.model;

public class Passenger {
    int id;
    String bookingNo;
    String name;
    String address;
    String email;
    String phone_No;

    Booking b = new Booking();

    public Passenger() {

    }

    public Passenger(String name) {
        this.name = name;
    }

    public Passenger(int id, String bookingNo, String name, String address, String email, String phone_No) {
        this.id = id;
        this.bookingNo = bookingNo;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phone_No = phone_No;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setBookingNo(String bookingNo){
        this.bookingNo = bookingNo;
    }

    public String getBookingNo(){
        return bookingNo;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getName(){
        return name;
    }

    public void setAddress(String address){
        this.address = address;
    }

    public String getAddress(){
        return address;
    }

    public void setEmail(String email){
        this.email = email;
    }

    public String getEmail(){
        return email;
    }

    public void setPhoneNo(String phone_No){
        this.phone_No = phone_No;
    }

    public String getPhoneNo(){
        return phone_No;
    }
}
