package com.beerfinder.DataBaseUtilities;

import com.beerfinder.Beans.User;

import java.sql.*;

/**
 * Created by franciszekdanes on 14.12.2016.
 */
public class UserDAO {
    private DBUtil dbUtil = new DBUtil();

    public boolean addUser(String firstName,String lastName, String email, String password){
        if(!isEmailUsed(email)) {
            try {
                Connection con = dbUtil.getConnection();
                String sql = "INSERT INTO User VALUES (NULL,?,?,?,?,NULL)";
                PreparedStatement preparedStatement = con.prepareStatement(sql);
                preparedStatement.setString(1,firstName);
                preparedStatement.setString(2,lastName);
                preparedStatement.setString(3,email);
                preparedStatement.setString(4,password);
                preparedStatement.executeUpdate();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }
        }else
            return false;
    }

    public boolean isEmailUsed(String newEmail){
        try {
            Connection con = dbUtil.getConnection();
            String sql = "SELECT * FROM User WHERE email = ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1,newEmail);
            ResultSet resultSet;
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                return true;
            }else
            {
                return false;
            }

        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean isUserValid(String email, String password){
        try {
            Connection con = dbUtil.getConnection();
            String sql = "SELECT * FROM User WHERE password = ? AND email= ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, password);
            preparedStatement.setString(2, email);
            ResultSet resultSet;
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                resultSet.close();
                return true;
            } else {
                resultSet.close();
                return false;
            }
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    public int getUserId(String email){
        int id = 0;
        try {
            Connection con = dbUtil.getConnection();
            String sql = "SELECT idUser FROM User WHERE email= ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.executeQuery();

            ResultSet rs = preparedStatement.getResultSet();
            if(rs.next()) {
                id = rs.getInt(1);
            }
            preparedStatement.close();
            return id;
        } catch (SQLException e) {
            e.printStackTrace();
            return id;
        }
    }
}

















