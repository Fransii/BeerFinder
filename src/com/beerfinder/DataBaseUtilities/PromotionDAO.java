package com.beerfinder.DataBaseUtilities;

import java.sql.*;

/**
 * Created by franciszekdanes on 15.12.2016.
 */
public class PromotionDAO {
    private DBUtil dbUtil = new DBUtil();
    private StoreDAO storeDAO = new StoreDAO();
    private AdressDAO adressDAO = new AdressDAO();
    private BeerDAO beerDAO = new BeerDAO();

    public boolean addPromotion(String newStartDate, String newEndDate, int newIdUser,
                                String newCoordX, String newCoordY, String newStoreName,
                                String newBeerName, String newBeerCapacity, String newBeerPackage,
                                String newBeerPrice, String newCity, String newPostCode,
                                String newStreet, String newBuildNumber){

        int idStore;
        int idBeer;
        int idAdress;

        //Add adress and get id
        idAdress = adressDAO.addAdress(newCity,newPostCode,newStreet,newBuildNumber);
        //Add store and get id
        idStore = storeDAO.addStore(newCoordX,newCoordY,idAdress,newStoreName);
        //Add beer and get id
        idBeer = beerDAO.addBeer(newBeerCapacity,newBeerName,newBeerPackage,newBeerPrice);
        //Add promotion


        try {
            Connection con = dbUtil.getConnection();
            String sql = "INSERT INTO Promotion VALUES (NULL,?,?,?,?,?)";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1,newStartDate);
            preparedStatement.setString(2,newEndDate);
            preparedStatement.setInt(3,idStore);
            preparedStatement.setInt(4,idBeer);
            preparedStatement.setInt(5,newIdUser);
            preparedStatement.executeUpdate();

            preparedStatement.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
