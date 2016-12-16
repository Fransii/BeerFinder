package com.beerfinder.Beans;

/**
 * Created by franciszekdanes on 16.12.2016.
 */
public class Adress {
    private String city;
    private String postCode;
    private String street;
    private String buildNumber;

    public Adress() {
    }

    public Adress(String city, String postCode, String street, String buildNumber) {
        this.city = city;
        this.postCode = postCode;
        this.street = street;
        this.buildNumber = buildNumber;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getBuildNumber() {
        return buildNumber;
    }

    public void setBuildNumber(String buildNumber) {
        this.buildNumber = buildNumber;
    }
}
