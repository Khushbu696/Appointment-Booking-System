package com.appointment.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import com.appointment.dao.AppointmentDAO;

public class CompleteAppointmentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        AppointmentDAO.completeAppointment(id);

        res.sendRedirect("admin.jsp");
    }
}