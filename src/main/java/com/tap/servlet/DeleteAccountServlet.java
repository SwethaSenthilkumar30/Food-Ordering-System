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

@WebServlet("/deleteAccount")
public class DeleteAccountServlet extends HttpServlet {

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

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("login.html");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.html");
            return;
        }

        int userId = user.getId();

        userService.deleteUserAccount(userId);

        session.invalidate();

        response.sendRedirect("login.html");
    }
}