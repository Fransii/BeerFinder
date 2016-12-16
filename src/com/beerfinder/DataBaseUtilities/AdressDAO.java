package com.beerfinder.DataBaseUtilities;

import com.beerfinder.Beans.Adress;
import com.beerfinder.Beans.Beer;

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
    public Adress getAdressById(int adressId){
        Adress adress = new Adress();
        try {
            Connection con = dbUtil.getConnection();
            String sql = "SELECT * FROM Adress WHERE idAdress = ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, adressId);
            preparedStatement.executeQuery();

            ResultSet rs = preparedStatement.getResultSet();
            if (rs.next()) {
                adress.setCity(rs.getString("city"));
                adress.setPostCode(rs.getString("postCode"));
                adress.setStreet(rs.getString("street"));
                adress.setBuildNumber(rs.getString("buildNumer"));
            }
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adress;
    }
}
