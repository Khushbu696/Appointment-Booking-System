package com.appointment.model;

public class User {

    private int id;
    private String name;
    private String email;
    private String password;

    // GETTERS
    public int getId() {
        return id;
    } // 🔥 ADD THIS

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    // SETTERS
    public void setId(int id) {
        this.id = id;
    } // 🔥 ADD THIS

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}