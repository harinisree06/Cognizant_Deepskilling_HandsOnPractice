package com.cognizant.observer;

public class ObserverPatternTest {

    public static void main(String[] args) {

        StockMarket stockMarket = new StockMarket();

        Observer mobileApp = new MobileApp("Harini");

        Observer webApp = new WebApp("Admin");

        stockMarket.registerObserver(mobileApp);

        stockMarket.registerObserver(webApp);

        System.out.println("Stock Price Updated");

        stockMarket.setStock("TCS", 3850.50);

        System.out.println();

        System.out.println("Removing Mobile Observer");

        stockMarket.removeObserver(mobileApp);

        stockMarket.setStock("Infosys", 1620.75);

    }

}