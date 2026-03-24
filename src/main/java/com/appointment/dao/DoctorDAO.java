package com.appointment.dao;

import java.sql.*;
import java.util.*;
import com.appointment.model.Doctor;

public class DoctorDAO {

    public static List<Doctor> getAllDoctors() {
        List<Doctor> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM doctors");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Doctor d = new Doctor();
                d.setId(rs.getInt("id"));
                d.setName(rs.getString("name"));
                d.setSpecialization(rs.getString("specialization"));
                d.setFees(rs.getInt("fees"));
                list.add(d);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ✅ ADD DOCTOR
    public static int addDoctor(Doctor d) {
        int status = 0;

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO doctors(name, specialization, fees) VALUES (?, ?, ?)");

            ps.setString(1, d.getName());
            ps.setString(2, d.getSpecialization());
            ps.setInt(3, d.getFees());

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ❌ DELETE DOCTOR
    public static int deleteDoctor(int id) {
        int status = 0;

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM doctors WHERE id=?");

            ps.setInt(1, id);
            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}