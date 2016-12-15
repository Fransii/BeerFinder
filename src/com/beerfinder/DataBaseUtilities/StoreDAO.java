package com.beerfinder.DataBaseUtilities;

import java.sql.*;

/**
 * Created by franciszekdanes on 15.12.2016.
 */
public class StoreDAO {
    private DBUtil dbUtil = new DBUtil();

    public int addStore(String newCoordx, String newCoordY, int newIdAdress, String newName){

        int idStore = 0;

        try {
            Connection con = dbUtil.getConnection();
            String sql = "INSERT INTO Store VALUES (NULL,?,?,?,?)";
            PreparedStatement preparedStatement = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1,newCoordx);
            preparedStatement.setString(2,newCoordY);
            preparedStatement.setInt(3,newIdAdress);
            preparedStatement.setString(4,newName);
            preparedStatement.executeUpdate();

            ResultSet rs = preparedStatement.getGeneratedKeys();
            rs.next();
            idStore = rs.getInt(1);

            preparedStatement.close();
            return idStore;
        } catch (SQLException e) {
            e.printStackTrace();
            return idStore;
        }
    }
}
