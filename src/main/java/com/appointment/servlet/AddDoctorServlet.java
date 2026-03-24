package com.appointment.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import com.appointment.dao.DoctorDAO;
import com.appointment.model.Doctor;

public class AddDoctorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String specialization = req.getParameter("specialization");
        int fees = Integer.parseInt(req.getParameter("fees"));

        Doctor d = new Doctor();
        d.setName(name);
        d.setSpecialization(specialization);
        d.setFees(fees);

        DoctorDAO.addDoctor(d);

        res.sendRedirect("admin.jsp");
    }
}