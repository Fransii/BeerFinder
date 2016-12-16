package com.beerfinder.DataBaseUtilities;

import com.beerfinder.Beans.Promotion;

import java.sql.*;
import java.util.ArrayList;

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
    public Promotion getPromotionById(int id){
        Promotion promotion = new Promotion();
        StoreDAO storeDAO = new StoreDAO();
        UserDAO userDAO = new UserDAO();
        BeerDAO beerDAO = new BeerDAO();

        try {
            Connection connection = dbUtil.getConnection();
            String sql = "Select * FROM Promotion WHERE idPromotion = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1,id);
            statement.executeQuery();
            ResultSet resultSet = statement.getResultSet();

            while(resultSet.next()){
                promotion = new Promotion(
                        resultSet.getInt("idPromotion"),
                        resultSet.getString("startDate"),
                        resultSet.getString("endDate"),
                        beerDAO.getBeerById(resultSet.getInt("idBeer")),
                        storeDAO.getStoreById(resultSet.getInt("idStore")),
                        userDAO.getUserById(resultSet.getInt("idUser"))
                );
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return promotion;
    }
    public ArrayList<Promotion> getAllPromotions(){
        ArrayList<Promotion> arrayList = new ArrayList<Promotion>();
        StoreDAO storeDAO = new StoreDAO();
        UserDAO userDAO = new UserDAO();
        BeerDAO beerDAO = new BeerDAO();

        try {
            Connection connection = dbUtil.getConnection();
            String sql = "Select * from Promotion;";
            Statement statement = connection.createStatement();
            statement.executeQuery(sql);
            ResultSet resultSet = statement.getResultSet();

            while(resultSet.next()){
                arrayList.add(new Promotion(
                        resultSet.getInt("idPromotion"),
                        resultSet.getString("startDate"),
                        resultSet.getString("endDate"),
                        beerDAO.getBeerById(resultSet.getInt("idBeer")),
                        storeDAO.getStoreById(resultSet.getInt("idStore")),
                        userDAO.getUserById(resultSet.getInt("idUser"))
                ));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return arrayList;
    }
}
