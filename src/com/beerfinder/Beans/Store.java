package com.beerfinder.Beans;

/**
 * Created by franciszekdanes on 16.12.2016.
 */
public class Store {
   private String coordX;
    private String coordY;
    private Adress adress;
    private String name;

    public Store() {
    }

    public Store(String coordX, String coordY, Adress adress, String name) {
        this.coordX = coordX;
        this.coordY = coordY;
        this.adress = adress;
        this.name = name;
    }

    public String getCoordX() {
        return coordX;
    }

    public void setCoordX(String coordX) {
        this.coordX = coordX;
    }

    public String getCoordY() {
        return coordY;
    }

    public void setCoordY(String getCoordY) {
        this.coordY = getCoordY;
    }

    public Adress getAdress() {
        return adress;
    }

    public void setAdress(Adress adress) {
        this.adress = adress;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
