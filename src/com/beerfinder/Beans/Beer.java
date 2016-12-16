package com.beerfinder.Beans;

/**
 * Created by franciszekdanes on 16.12.2016.
 */
public class Beer {
    private String name;
    private String capacity;
    private String beerPackage;
    private String price;

    public Beer() {
    }

    public Beer(String name, String capacity, String beerPackage, String price) {
        this.name = name;
        this.capacity = capacity;
        this.beerPackage = beerPackage;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getBeerPackage() {
        return beerPackage;
    }

    public void setBeerPackage(String beerPackage) {
        this.beerPackage = beerPackage;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
