package com.tap.service;

import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.DAOimple.RestaurantDAOImpl;
import com.tap.model.Restaurant;

public class RestaurantService {

    private RestaurantDAO restaurantDAO;

    public RestaurantService() {
        restaurantDAO = new RestaurantDAOImpl();
    }

    public void addRestaurant(Restaurant restaurant) {
        restaurantDAO.addRestaurant(restaurant);
    }

    public Restaurant getRestaurant(int restaurantId) {
        return restaurantDAO.getRestaurant(restaurantId);
    }

    public List<Restaurant> getAllRestaurants() {
        return restaurantDAO.getAllRestaurants();
    }

    public void updateRestaurant(Restaurant restaurant) {
        restaurantDAO.updateRestaurant(restaurant);
    }

    public void deleteRestaurant(int restaurantId) {
        restaurantDAO.deleteRestaurant(restaurantId);
    }
}
