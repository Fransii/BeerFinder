package com.beerfinder.DataBaseUtilities;

import com.beerfinder.Beans.Beer;
import com.beerfinder.Beans.Store;

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
    public Store getStoreById(int storeId){
        AdressDAO adressDAO = new AdressDAO();
        Store store = new Store();
        try {
            Connection con = dbUtil.getConnection();
            String sql = "SELECT * FROM Store WHERE idStore = ?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, storeId);
            preparedStatement.executeQuery();

            ResultSet rs = preparedStatement.getResultSet();
            if (rs.next()) {
              store.setCoordX(rs.getString("coordX"));
                store.setCoordY(rs.getString("coordY"));
                store.setAdress(adressDAO.getAdressById(rs.getInt("idAdress")));
                store.setName(rs.getString("name"));
            }
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return store;
    }
}
