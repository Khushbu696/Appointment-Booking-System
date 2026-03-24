package com.appointment.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import com.appointment.dao.UserDAO;
import com.appointment.model.User;

public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        User u = new User();
        u.setName(req.getParameter("name"));
        u.setEmail(req.getParameter("email"));
        u.setPassword(req.getParameter("password"));

        int status = UserDAO.register(u);

        if (status > 0) {
            res.sendRedirect("login.jsp");
        } else {
            res.getWriter().println("Signup Failed");
        }
    }
}