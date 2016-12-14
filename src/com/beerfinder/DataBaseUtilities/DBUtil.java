package com.beerfinder.DataBaseUtilities;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by franciszekdanes on 14.12.2016.
 */
public class DBUtil {
    private final static String DBURL = "jdbc:mysql://localhost/BeerFinderDB";
    private final static String DBUSER = "root";
    private final static String DBPASS = "baza";
    private final static String DBDRIVER = "com.mysql.jdbc.Driver";

    private Connection connection = null;

    public Connection getConnection() {
        if (connection == null) {
            try {
                Class.forName(DBDRIVER).newInstance();
                connection = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
            } catch (InstantiationException | IllegalAccessException
                    | ClassNotFoundException | SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return connection;
    }
}
