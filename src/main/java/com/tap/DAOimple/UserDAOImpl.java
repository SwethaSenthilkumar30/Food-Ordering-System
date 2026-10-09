package com.tap.DAOimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tap.DAO.UserDAO;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class UserDAOImpl implements UserDAO {

    @Override
    public void addUser(User user) {

        String sql = "INSERT INTO `user` "
                   + "(name, email, password, phone, address, role) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getPhone());
            pstmt.setString(5, user.getAddress());
            pstmt.setString(6, user.getRole());

            pstmt.executeUpdate();

            System.out.println("User added successfully");

        } catch (Exception e) {

            e.printStackTrace();

        }
    }

    @Override
    public User getUser(int id) {
        return null;
    }

    @Override
    public User getUserByEmail(String email) {

        User user = null;

        String sql = "SELECT * FROM `user` WHERE email = ?";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, email);

            java.sql.ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setId(rs.getInt("userId"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public void updateUser(User user) {

        String sql = "UPDATE `user` "
                   + "SET name = ?, phone = ?, address = ? "
                   + "WHERE userId = ?";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPhone());
            pstmt.setString(3, user.getAddress());
            pstmt.setInt(4, user.getId());

            pstmt.executeUpdate();

            System.out.println("User updated successfully");

        } catch (Exception e) {

            e.printStackTrace();

        }
    }

    @Override
    public void deleteUserAccount(int userId) {

        try {

            Connection connection = DBConnection.getConnection();

            // 1. Delete order items of the user's orders
            String deleteOrderItems =
                    "DELETE oi FROM orderitem oi "
                  + "INNER JOIN orders o ON oi.orderId = o.orderId "
                  + "WHERE o.userId = ?";

            PreparedStatement ps1 =
                    connection.prepareStatement(deleteOrderItems);

            ps1.setInt(1, userId);
            ps1.executeUpdate();


            // 2. Delete orders
            String deleteOrders =
                    "DELETE FROM orders WHERE userId = ?";

            PreparedStatement ps2 =
                    connection.prepareStatement(deleteOrders);

            ps2.setInt(1, userId);
            ps2.executeUpdate();


            // 3. Delete cart items
            String deleteCartItems =
                    "DELETE ci FROM cartitem ci "
                  + "INNER JOIN cart c ON ci.cartId = c.cartId "
                  + "WHERE c.userId = ?";

            PreparedStatement ps3 =
                    connection.prepareStatement(deleteCartItems);

            ps3.setInt(1, userId);
            ps3.executeUpdate();


            // 4. Delete cart
            String deleteCart =
                    "DELETE FROM cart WHERE userId = ?";

            PreparedStatement ps4 =
                    connection.prepareStatement(deleteCart);

            ps4.setInt(1, userId);
            ps4.executeUpdate();


            // 5. Delete user
            String deleteUser =
                    "DELETE FROM `user` WHERE userId = ?";

            PreparedStatement ps5 =
                    connection.prepareStatement(deleteUser);

            ps5.setInt(1, userId);
            ps5.executeUpdate();


            System.out.println("User account deleted successfully");

        } catch (Exception e) {

            e.printStackTrace();

        }
    }
    
    @Override
    public void deleteUser(int id) {

        String sql = "DELETE FROM `user` WHERE userId = ?";

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setInt(1, id);

            pstmt.executeUpdate();

            System.out.println("User deleted successfully");

        } catch (Exception e) {

            e.printStackTrace();

        }
    }

}