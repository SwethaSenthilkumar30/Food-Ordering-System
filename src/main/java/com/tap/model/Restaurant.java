package com.tap.model;

public class Restaurant {

    private int restaurantId;
    private String name;
    private String address;
    private String phone;
    private String cuisineType;
    private double rating;
    private boolean isActive;

    public Restaurant() {
    }

    public Restaurant(int restaurantId, String name, String address,
            String phone, String cuisineType, double rating, boolean isActive) {

        this.restaurantId = restaurantId;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.cuisineType = cuisineType;
        this.rating = rating;
        this.isActive = isActive;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }
}