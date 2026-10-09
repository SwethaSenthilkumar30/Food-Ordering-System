package com.tap.DAOimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
import com.tap.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    @Override
    public void addMenu(Menu menu) {

        String sql = "INSERT INTO menu "
                + "(restaurantId, name, description, price, category, isAvailable) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setString(5, menu.getCategory());
            ps.setBoolean(6, menu.isAvailable());

            ps.executeUpdate();

            System.out.println("Menu added successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Menu getMenu(int menuId) {

        String sql = "SELECT * FROM menu WHERE menuId = ?";

        Menu menu = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, menuId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                menu = new Menu();

                menu.setMenuId(rs.getInt("menuId"));
                menu.setRestaurantId(rs.getInt("restaurantId"));
                menu.setName(rs.getString("name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setCategory(rs.getString("category"));
                menu.setAvailable(rs.getBoolean("isAvailable"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menu;
    }

    @Override
    public List<Menu> getAllMenus() {

        String sql = "SELECT * FROM menu";

        List<Menu> menus = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menuId"));
                menu.setRestaurantId(rs.getInt("restaurantId"));
                menu.setName(rs.getString("name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setCategory(rs.getString("category"));
                menu.setAvailable(rs.getBoolean("isAvailable"));

                menus.add(menu);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menus;
    }

    @Override
    public List<Menu> getMenusByRestaurant(int restaurantId) {

        String sql = "SELECT * FROM menu WHERE restaurantId = ?";

        List<Menu> menus = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Menu menu = new Menu();

                menu.setMenuId(rs.getInt("menuId"));
                menu.setRestaurantId(rs.getInt("restaurantId"));
                menu.setName(rs.getString("name"));
                menu.setDescription(rs.getString("description"));
                menu.setPrice(rs.getDouble("price"));
                menu.setCategory(rs.getString("category"));
                menu.setAvailable(rs.getBoolean("isAvailable"));

                menus.add(menu);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menus;
    }

    @Override
    public void updateMenu(Menu menu) {

        String sql = "UPDATE menu SET "
                + "restaurantId=?, name=?, description=?, price=?, "
                + "category=?, isAvailable=? "
                + "WHERE menuId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setString(5, menu.getCategory());
            ps.setBoolean(6, menu.isAvailable());
            ps.setInt(7, menu.getMenuId());

            ps.executeUpdate();

            System.out.println("Menu updated successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMenu(int menuId) {

        String sql = "DELETE FROM menu WHERE menuId = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, menuId);

            ps.executeUpdate();

            System.out.println("Menu deleted successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
