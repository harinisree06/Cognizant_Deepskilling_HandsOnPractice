package com.cognizant.decorator;

public class DecoratorPatternTest {

    public static void main(String[] args) {

        System.out.println("Email Notification");
        Notifier emailNotifier = new EmailNotifier();
        emailNotifier.send("Welcome!");

        System.out.println();

        System.out.println("Email + SMS Notification");
        Notifier smsNotifier = new SMSNotifierDecorator(new EmailNotifier());
        smsNotifier.send("Welcome!");

        System.out.println();

        System.out.println("Email + SMS + Slack Notification");
        Notifier allNotifier = new SlackNotifierDecorator(
                                    new SMSNotifierDecorator(
                                        new EmailNotifier()));

        allNotifier.send("Welcome!");

    }

}