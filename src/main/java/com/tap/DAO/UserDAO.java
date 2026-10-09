package com.tap.DAO;

import com.tap.model.User;

public interface UserDAO {

    void addUser(User user);

    User getUser(int id);

    User getUserByEmail(String email);

    void updateUser(User user);

    void deleteUser(int id);

    void deleteUserAccount(int userId);
}