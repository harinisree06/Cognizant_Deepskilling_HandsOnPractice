package com.cognizant.adapter;

public class StripeGateway {

    public void makeTransaction(double amount) {

        System.out.println("Payment of Rs." + amount + " processed using Stripe.");

    }

}