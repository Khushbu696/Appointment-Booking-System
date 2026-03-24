package com.appointment.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import com.appointment.dao.DoctorDAO;

public class DeleteDoctorServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        DoctorDAO.deleteDoctor(id);

        res.sendRedirect("admin.jsp");
    }
}