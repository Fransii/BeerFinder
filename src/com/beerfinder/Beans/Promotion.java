package com.beerfinder.Beans;

/**
 * Created by franciszekdanes on 16.12.2016.
 */
public class Promotion {

    private int promotionId;
    private String startDate;
    private String endDate;
    private Beer beer;
    private Store store;
    private User user;

    public Promotion() {
    }

    public Promotion(int promotionId, String startDate, String endDate, Beer beer, Store store, User user) {
        this.promotionId = promotionId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.beer = beer;
        this.store = store;
        this.user = user;
    }

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Beer getBeer() {
        return beer;
    }

    public void setBeer(Beer beer) {
        this.beer = beer;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
