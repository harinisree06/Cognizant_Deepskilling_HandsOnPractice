package com.cognizant.decorator;

public class SMSNotifierDecorator extends NotifierDecorator {

    public SMSNotifierDecorator(Notifier notifier) {

        super(notifier);

    }

    @Override
    public void send(String message) {

        notifier.send(message);
        System.out.println("Sending SMS: " + message);

    }

}