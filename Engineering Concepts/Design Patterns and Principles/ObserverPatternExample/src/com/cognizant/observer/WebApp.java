package com.cognizant.observer;

public class WebApp implements Observer {

    private String userName;

    public WebApp(String userName) {

        this.userName = userName;

    }

    @Override
    public void update(String stockName, double stockPrice) {

        System.out.println(userName +
                " received Web Notification: "
                + stockName + " price is Rs." + stockPrice);

    }

}