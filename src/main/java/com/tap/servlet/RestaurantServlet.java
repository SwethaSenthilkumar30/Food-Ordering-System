package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.model.Restaurant;
import com.tap.service.RestaurantService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private RestaurantService restaurantService;

    @Override
    public void init() throws ServletException {
        restaurantService = new RestaurantService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        List<Restaurant> restaurants =
                restaurantService.getAllRestaurants();

        request.setAttribute("restaurants", restaurants);

        request.getRequestDispatcher("restaurant.jsp")
               .forward(request, response);
        
        
    }
}
