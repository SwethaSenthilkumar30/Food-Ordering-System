package com.tap.service;

import com.tap.DAO.UserDAO;
import com.tap.DAOimple.UserDAOImpl;
import com.tap.model.User;

public class UserService {

    private UserDAO userDAO;

    public UserService() {
        userDAO = new UserDAOImpl();
    }

    public void addUser(User user) {
        userDAO.addUser(user);
    }

    public User getUser(int userId) {
        return userDAO.getUser(userId);
    }

    public User getUserByEmail(String email) {
        return userDAO.getUserByEmail(email);
    }

    public void updateUser(User user) {
        userDAO.updateUser(user);
    }

    public void deleteUser(int userId) {
        userDAO.deleteUser(userId);
    }
    
    public void deleteUserAccount(int userId) {
        userDAO.deleteUserAccount(userId);
    }
}
