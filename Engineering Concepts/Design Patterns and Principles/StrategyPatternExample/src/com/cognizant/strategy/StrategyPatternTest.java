package com.cognizant.strategy;

public class StrategyPatternTest {

    public static void main(String[] args) {

        PaymentContext paymentContext = new PaymentContext();

        System.out.println("Credit Card Payment");

        paymentContext.setPaymentStrategy(new CreditCardPayment());

        paymentContext.executePayment(2500);

        System.out.println();

        System.out.println("PayPal Payment");

        paymentContext.setPaymentStrategy(new PayPalPayment());

        paymentContext.executePayment(1800);

    }

}