package com.beerfinder.DataBaseUtilities;

import com.beerfinder.Beans.Beer;

import java.sql.*;

/**
 * Created by franciszekdanes on 15.12.2016.
 */
public class BeerDAO {
    private DBUtil dbUtil = new DBUtil();

    public int addBeer(String newCapacity,String newName, String newPackage, String newPrice){

        int idBeer = 0;

        try {
            Connection con = dbUtil.getConnection();
            String sql = "INSERT INTO Beer VALUES (NULL,?,?,?,?)";
            PreparedStatement preparedStatement = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1,newCapacity);
            preparedStatement.setString(2,newName);
            preparedStatement.setString(3,newPackage);
            preparedStatement.setString(4,newPrice);
            preparedStatement.executeUpdate();

            ResultSet rs = preparedStatement.getGeneratedKeys();
            rs.next();
            idBeer = rs.getInt(1);

            preparedStatement.close();
            return idBeer;
        } catch (SQLException e) {
            e.printStackTrace();
            return idBeer;
        }
    }

    public Beer getBeerById(int beerId) {
        Beer beer = new Beer();
        try {
            Connection con = dbUtil.getConnection();
            String sql = "SELECT * FROM Beer WHERE idBeer = ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, beerId);
            preparedStatement.executeQuery();

            ResultSet rs = preparedStatement.getResultSet();
            if (rs.next()) {
                beer.setCapacity(rs.getString("capacity"));
                beer.setName(rs.getString("name"));
                beer.setBeerPackage(rs.getString("package"));
                beer.setPrice(rs.getString("price"));
            }
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return beer;
    }
}
