package com.tap.servlet;

import java.io.IOException;

import com.tap.model.User;
import com.tap.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        HttpSession session = request.getSession();

        User sessionUser = (User) session.getAttribute("user");

        // Check whether user is logged in
        if (sessionUser == null) {
            response.sendRedirect("login.html");
            return;
        }

        // Get latest user details from database
        User user = userService.getUserByEmail(sessionUser.getEmail());

        if (user == null) {
            response.sendRedirect("login.html");
            return;
        }

        // Send user details to JSP
        request.setAttribute("user", user);

        // Open profile page
        request.getRequestDispatcher("profile.jsp")
               .forward(request, response);
    }
}
