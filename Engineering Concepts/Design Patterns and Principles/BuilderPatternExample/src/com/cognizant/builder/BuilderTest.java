package com.cognizant.builder;

public class BuilderTest {

    public static void main(String[] args) {

        Computer gamingPC = new Computer.Builder()
                .setCPU("Intel Core i9")
                .setRAM(32)
                .setStorage(1000)
                .setGraphicsCard("NVIDIA RTX 4080")
                .setBluetooth(true)
                .setWiFi(true)
                .build();

        Computer officePC = new Computer.Builder()
                .setCPU("Intel Core i5")
                .setRAM(16)
                .setStorage(512)
                .setGraphicsCard("Integrated Graphics")
                .setBluetooth(false)
                .setWiFi(true)
                .build();

        gamingPC.displayConfiguration();
        officePC.displayConfiguration();
    }
}