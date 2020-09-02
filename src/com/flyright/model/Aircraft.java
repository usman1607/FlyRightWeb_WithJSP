package com.flyright.model;


public class Aircraft {
    int id;
    String reg_No;
    String type;
    String name;
    int capacity;

    public Aircraft(){

    }

    public Aircraft(String reg_No){
        this.reg_No = reg_No;
    }

    public Aircraft(int id, String reg_No, String type, String name, int capacity) {
        this.reg_No = reg_No;
        this.type = type;
        this.name = name;
        this.capacity = capacity;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setRegNo(String reg_No){
        this.reg_No = reg_No;
    }

    public String getRegNo(){
        return reg_No;
    }

    public void setType(String type){
        this.type = type;
    }

    public String getType(){
        return type;
    }

    public void setName(String name){
        this.type = name;
    }

    public String getName(){
        return name;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getCapacity() {
        return capacity;
    }

}


