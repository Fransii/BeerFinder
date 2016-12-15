package com.beerfinder.DataBaseUtilities;

import java.sql.*;

/**
 * Created by franciszekdanes on 15.12.2016.
 */
public class AdressDAO {
    private DBUtil dbUtil = new DBUtil();

    public int addAdress(String newCity,String newPostCode, String newStreet, String newBuildNumber){

        int idAdress = 0;

        try {
            Connection con = dbUtil.getConnection();
            String sql = "INSERT INTO Adress VALUES (NULL,?,?,?,?)";
            PreparedStatement preparedStatement = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1,newCity);
            preparedStatement.setString(2,newPostCode);
            preparedStatement.setString(3,newStreet);
            preparedStatement.setString(4,newBuildNumber);
            preparedStatement.executeUpdate();

            ResultSet rs = preparedStatement.getGeneratedKeys();
            rs.next();
            idAdress = rs.getInt(1);

            preparedStatement.close();
            return idAdress;
        } catch (SQLException e) {
            e.printStackTrace();
            return idAdress;
        }
    }
}
