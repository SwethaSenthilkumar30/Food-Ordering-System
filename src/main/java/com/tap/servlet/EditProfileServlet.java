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

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {

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

        if (sessionUser == null) {
            response.sendRedirect("login.html");
            return;
        }

        User user = userService.getUserByEmail(sessionUser.getEmail());

        if (user == null) {
            response.sendRedirect("login.html");
            return;
        }

        request.setAttribute("user", user);

        request.getRequestDispatcher("edit-profile.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
                           throws ServletException, IOException {

        HttpSession session = request.getSession();

        User sessionUser = (User) session.getAttribute("user");

        if (sessionUser == null) {
            response.sendRedirect("login.html");
            return;
        }

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        User user = userService.getUserByEmail(sessionUser.getEmail());

        if (user == null) {
            response.sendRedirect("login.html");
            return;
        }

        user.setName(name);
        user.setPhone(phone);
        user.setAddress(address);

        userService.updateUser(user);

        session.setAttribute("user", user);

        response.sendRedirect("profile");
    }
}