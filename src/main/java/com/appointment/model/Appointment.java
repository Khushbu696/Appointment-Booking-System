package com.appointment.model;

public class Appointment {

    private int id;
    private int userId;
    private String patientName;
    private int doctorId;
    private String doctorName;
    private String date;
    private String timeSlot;
    private String phone;
    private String reason;
    private String status;

    // GETTERS
    public int getId() {
        return id;
    }

    public String getPatientName() {
        return patientName;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public String getDate() {
        return date;
    }

    public int getUserId() {
        return userId;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public String getPhone() {
        return phone;
    }

    public String getReason() {
        return reason;
    }

    public String getStatus() {
        return status;
    }

    // SETTERS
    public void setId(int id) {
        this.id = id;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}