package com.beerfinder.Beans;

/**
 * Created by franciszekdanes on 16.12.2016.
 */
public class UserCredibility {
    private User user;

    public UserCredibility() {
    }

    public UserCredibility(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
