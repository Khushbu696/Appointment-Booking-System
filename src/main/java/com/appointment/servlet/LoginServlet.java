package com.appointment.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import com.appointment.dao.UserDAO;
import com.appointment.model.User;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = UserDAO.login(email, password);

        if (email.equals("admin@gmail.com") && password.equals("admin123")) {
            HttpSession session = req.getSession();
            session.setAttribute("admin", "true");
            res.sendRedirect("admin.jsp");
            return;
        }

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            res.sendRedirect("dashboard.jsp");
        } else {
            res.getWriter().println("Invalid Credentials");
        }
    }
}