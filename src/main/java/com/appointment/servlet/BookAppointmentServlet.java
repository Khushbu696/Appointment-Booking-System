package com.appointment.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.*;
import javax.servlet.http.*;

import com.appointment.dao.AppointmentDAO;
import com.appointment.model.Appointment;
import com.appointment.model.User;

public class BookAppointmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");

        if (user == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();

        String name = req.getParameter("name");
        int doctorId = Integer.parseInt(req.getParameter("doctor"));
        String doctorName = req.getParameter("doctorName");
        String date = req.getParameter("date");
        String timeSlot = req.getParameter("timeSlot");
        String phone = req.getParameter("phone");
        String reason = req.getParameter("reason");

        // 🔥 VALIDATION 1: Past date
        LocalDate selectedDate = LocalDate.parse(date);
        LocalDate today = LocalDate.now();

        if (selectedDate.isBefore(today)) {
            setFormData(req, name, date, timeSlot, phone, reason);
            req.setAttribute("error", "Cannot book appointment in past date");
            req.getRequestDispatcher("book.jsp?id=" + doctorId + "&name=" + doctorName)
                    .forward(req, res);
            return;
        }

        // 🔥 VALIDATION 2: Same day + past time
        if (selectedDate.equals(today)) {
            String startTime = timeSlot.split(" - ")[0];

            LocalTime now = LocalTime.now();
            LocalTime slotTime = convertToTime(startTime);

            if (slotTime.isBefore(now)) {
                setFormData(req, name, date, timeSlot, phone, reason);
                req.setAttribute("error", "Cannot book past time slot");
                req.getRequestDispatcher("book.jsp?id=" + doctorId + "&name=" + doctorName)
                        .forward(req, res);
                return;
            }
        }

        // 🔥 VALIDATION 3: Double booking
        if (AppointmentDAO.isSlotBooked(doctorId, date, timeSlot)) {
            setFormData(req, name, date, timeSlot, phone, reason);
            req.setAttribute("error", "This time slot is already booked");
            req.getRequestDispatcher("book.jsp?id=" + doctorId + "&name=" + doctorName)
                    .forward(req, res);
            return;
        }

        // Save appointment
        Appointment a = new Appointment();
        a.setPatientName(name);
        a.setDoctorId(doctorId);
        a.setDate(date);
        a.setUserId(userId);
        a.setTimeSlot(timeSlot);
        a.setPhone(phone);
        a.setReason(reason);

        int status = AppointmentDAO.save(a);

        if (status > 0) {
            res.sendRedirect("success.jsp");
        } else {
            res.getWriter().println("Error booking appointment");
        }
    }

    // ✅ Preserve form data
    private void setFormData(HttpServletRequest req, String name, String date,
            String timeSlot, String phone, String reason) {

        req.setAttribute("name", name);
        req.setAttribute("date", date);
        req.setAttribute("timeSlot", timeSlot);
        req.setAttribute("phone", phone);
        req.setAttribute("reason", reason);
    }

    // ✅ FIXED time conversion
    private LocalTime convertToTime(String timeStr) {
        boolean isPM = timeStr.contains("PM");
        boolean isAM = timeStr.contains("AM");

        timeStr = timeStr.replace("AM", "").replace("PM", "").trim();
        String[] parts = timeStr.split(":");

        int hour = Integer.parseInt(parts[0]);
        int minute = Integer.parseInt(parts[1]);

        if (isPM && hour != 12)
            hour += 12;
        if (isAM && hour == 12)
            hour = 0;

        return LocalTime.of(hour, minute);
    }
}