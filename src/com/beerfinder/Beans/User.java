package com.beerfinder.Beans;

/**
 * Created by franciszekdanes on 14.12.2016.
 */
public class User {
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private UserCredibility userCredibility;

    public User() {
    }

    public User(String firstName, String lastName, String email, String password, UserCredibility userCredibility) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.userCredibility = userCredibility;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserCredibility getUserCredibility() {
        return userCredibility;
    }

    public void setUserCredibility(UserCredibility userCredibility) {
        this.userCredibility = userCredibility;
    }
}
