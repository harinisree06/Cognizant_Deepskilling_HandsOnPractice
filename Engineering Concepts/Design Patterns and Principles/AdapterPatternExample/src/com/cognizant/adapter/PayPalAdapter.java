package com.cognizant.adapter;

public class PayPalAdapter implements PaymentProcessor {

    private PayPalGateway paypalGateway;

    public PayPalAdapter() {

        paypalGateway = new PayPalGateway();

    }

    @Override
    public void processPayment(double amount) {

        paypalGateway.sendPayment(amount);

    }

}