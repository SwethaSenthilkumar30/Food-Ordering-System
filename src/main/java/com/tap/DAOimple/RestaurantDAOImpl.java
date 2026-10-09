package com.tap.DAOimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    @Override
    public void addRestaurant(Restaurant restaurant) {

        String sql = "INSERT INTO restaurant "
                + "(name, address, phone, cuisineType, rating, isActive) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, restaurant.getName());
            ps.setString(2, restaurant.getAddress());
            ps.setString(3, restaurant.getPhone());
            ps.setString(4, restaurant.getCuisineType());
            ps.setDouble(5, restaurant.getRating());
            ps.setBoolean(6, restaurant.isActive());

            ps.executeUpdate();

            System.out.println("Restaurant added successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Restaurant getRestaurant(int restaurantId) {

        String sql = "SELECT * FROM restaurant WHERE restaurantId = ?";

        Restaurant restaurant = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                restaurant = new Restaurant();

                restaurant.setRestaurantId(
                        rs.getInt("restaurantId"));

                restaurant.setName(
                        rs.getString("name"));

                restaurant.setAddress(
                        rs.getString("address"));

                restaurant.setPhone(
                        rs.getString("phone"));

                restaurant.setCuisineType(
                        rs.getString("cuisineType"));

                restaurant.setRating(
                        rs.getDouble("rating"));

                restaurant.setActive(
                        rs.getBoolean("isActive"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return restaurant;
    }

    @Override
    public List<Restaurant> getAllRestaurants() {

        String sql = "SELECT * FROM restaurant";

        List<Restaurant> restaurants = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(
                        rs.getInt("restaurantId"));

                restaurant.setName(
                        rs.getString("name"));

                restaurant.setAddress(
                        rs.getString("address"));

                restaurant.setPhone(
                        rs.getString("phone"));

                restaurant.setCuisineType(
                        rs.getString("cuisineType"));

                restaurant.setRating(
                        rs.getDouble("rating"));

                restaurant.setActive(
                        rs.getBoolean("isActive"));

                restaurants.add(restaurant);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return restaurants;
    }

    @Override
    public void updateRestaurant(Restaurant restaurant) {

        String sql = "UPDATE restaurant SET "
                + "name=?, address=?, phone=?, cuisineType=?, "
                + "rating=?, isActive=? "
                + "WHERE restaurantId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, restaurant.getName());
            ps.setString(2, restaurant.getAddress());
            ps.setString(3, restaurant.getPhone());
            ps.setString(4, restaurant.getCuisineType());
            ps.setDouble(5, restaurant.getRating());
            ps.setBoolean(6, restaurant.isActive());
            ps.setInt(7, restaurant.getRestaurantId());

            ps.executeUpdate();

            System.out.println("Restaurant updated successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteRestaurant(int restaurantId) {

        String sql = "DELETE FROM restaurant WHERE restaurantId = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);

            ps.executeUpdate();

            System.out.println("Restaurant deleted successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}