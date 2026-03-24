package com.appointment.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.appointment.model.Appointment;

public class AppointmentDAO {

    public static int save(Appointment a) {
        int status = 0;

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO appointments(patient_name, doctor_id, appointment_date, user_id, time_slot, phone, reason, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'BOOKED')");

            ps.setString(1, a.getPatientName());
            ps.setInt(2, a.getDoctorId());
            ps.setString(3, a.getDate());
            ps.setInt(4, a.getUserId());
            ps.setString(5, a.getTimeSlot());
            ps.setString(6, a.getPhone());
            ps.setString(7, a.getReason());

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static List<Appointment> getAppointmentsByUser(int userId) {
        List<Appointment> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT a.*, d.name AS doctor_name FROM appointments a " +
                            "JOIN doctors d ON a.doctor_id = d.id " +
                            "WHERE a.user_id=? ORDER BY a.appointment_date");

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Appointment a = new Appointment();

                a.setId(rs.getInt("id"));
                a.setPatientName(rs.getString("patient_name"));
                a.setDoctorId(rs.getInt("doctor_id"));
                a.setDoctorName(rs.getString("doctor_name"));
                a.setDate(rs.getString("appointment_date"));
                a.setTimeSlot(rs.getString("time_slot"));
                a.setPhone(rs.getString("phone"));
                a.setReason(rs.getString("reason"));
                a.setStatus(rs.getString("status"));

                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static int cancelAppointment(int id) {
        int status = 0;

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE appointments SET status='CANCELLED' WHERE id=?");

            ps.setInt(1, id);

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static List<Appointment> getUpcoming(int userId) {
        List<Appointment> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT a.*, d.name AS doctor_name FROM appointments a " +
                            "JOIN doctors d ON a.doctor_id = d.id " +
                            "WHERE a.user_id=? AND a.appointment_date >= CURDATE() AND a.status='BOOKED'");

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Appointment a = new Appointment();

                a.setId(rs.getInt("id"));
                a.setDoctorName(rs.getString("doctor_name"));
                a.setDate(rs.getString("appointment_date"));
                a.setTimeSlot(rs.getString("time_slot"));
                a.setReason(rs.getString("reason"));
                a.setStatus(rs.getString("status"));

                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<Appointment> getPast(int userId) {
        List<Appointment> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT a.*, d.name AS doctor_name FROM appointments a " +
                            "JOIN doctors d ON a.doctor_id = d.id " +
                            "WHERE a.user_id=? AND (a.appointment_date < CURDATE() OR a.status='CANCELLED')");

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Appointment a = new Appointment();

                a.setId(rs.getInt("id"));
                a.setDoctorName(rs.getString("doctor_name"));
                a.setDate(rs.getString("appointment_date"));
                a.setTimeSlot(rs.getString("time_slot"));
                a.setReason(rs.getString("reason"));
                a.setStatus(rs.getString("status"));

                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<Appointment> getAllAppointments() {
        List<Appointment> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT a.*, d.name AS doctor_name FROM appointments a " +
                            "JOIN doctors d ON a.doctor_id = d.id");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Appointment a = new Appointment();

                a.setId(rs.getInt("id"));
                a.setPatientName(rs.getString("patient_name"));
                a.setDoctorName(rs.getString("doctor_name"));
                a.setDate(rs.getString("appointment_date"));
                a.setTimeSlot(rs.getString("time_slot"));
                a.setStatus(rs.getString("status"));

                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static int completeAppointment(int id) {
        int status = 0;

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE appointments SET status='COMPLETED' WHERE id=?");

            ps.setInt(1, id);

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static boolean isSlotBooked(int doctorId, String date, String timeSlot) {
        boolean booked = false;

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM appointments WHERE doctor_id=? AND appointment_date=? AND time_slot=? AND status='BOOKED'");

            ps.setInt(1, doctorId);
            ps.setString(2, date);
            ps.setString(3, timeSlot);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                booked = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return booked;
    }

}