package com.cognizant.adapter;

public class AdapterPatternTest {

    public static void main(String[] args) {

        PaymentProcessor paypal = new PayPalAdapter();
        paypal.processPayment(1500);

        PaymentProcessor stripe = new StripeAdapter();
        stripe.processPayment(2500);

    }

}