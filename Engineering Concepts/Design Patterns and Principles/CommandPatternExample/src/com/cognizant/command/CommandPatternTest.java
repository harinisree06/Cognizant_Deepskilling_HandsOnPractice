package com.cognizant.command;

public class CommandPatternTest {

    public static void main(String[] args) {

        Light light = new Light();

        Command lightOn = new LightOnCommand(light);

        Command lightOff = new LightOffCommand(light);

        RemoteControl remote = new RemoteControl();

        System.out.println("Turning ON the light");

        remote.setCommand(lightOn);

        remote.pressButton();

        System.out.println();

        System.out.println("Turning OFF the light");

        remote.setCommand(lightOff);

        remote.pressButton();

    }

}