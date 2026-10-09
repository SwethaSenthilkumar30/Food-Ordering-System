package com.tap.service;

import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.DAOimple.MenuDAOImpl;
import com.tap.model.Menu;

public class MenuService {

    private MenuDAO menuDAO;

    public MenuService() {
        menuDAO = new MenuDAOImpl();
    }

    public void addMenu(Menu menu) {
        menuDAO.addMenu(menu);
    }

    public Menu getMenu(int menuId) {
        return menuDAO.getMenu(menuId);
    }

    public List<Menu> getAllMenus() {
        return menuDAO.getAllMenus();
    }

    public List<Menu> getMenusByRestaurant(int restaurantId) {
        return menuDAO.getMenusByRestaurant(restaurantId);
    }

    public void updateMenu(Menu menu) {
        menuDAO.updateMenu(menu);
    }

    public void deleteMenu(int menuId) {
        menuDAO.deleteMenu(menuId);
    }
}
