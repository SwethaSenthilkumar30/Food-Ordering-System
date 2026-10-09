package com.tap.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestConnection {

    public static void main(String[] args) {

        String url = System.getenv("DB_URL");
        String username = System.getenv("DB_USER");
        String password = System.getenv("DB_PASSWORD");

        System.out.println("DB_URL = " + url);
        System.out.println("DB_USER is configured: " + (username != null));

        if (url == null || username == null || password == null) {
            System.out.println("Environment variables are NOT available.");
            return;
        }

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    url,
                    username,
                    password
            );

            System.out.println("DATABASE CONNECTED SUCCESSFULLY");

            con.close();

        } catch (Exception e) {

            System.out.println("DATABASE CONNECTION FAILED");

            e.printStackTrace();
        }
    }
}