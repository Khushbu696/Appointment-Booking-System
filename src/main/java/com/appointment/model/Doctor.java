package com.appointment.model;

public class Doctor {

    private int id;
    private String name;
    private String specialization;
    private int fees;

    // GETTERS
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSpecialization() {
        return specialization;
    }

    public int getFees() {
        return fees;
    }

    // SETTERS
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public void setFees(int fees) {
        this.fees = fees;
    }
}