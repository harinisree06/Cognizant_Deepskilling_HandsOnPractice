package com.cognizant.builder;

public class Computer {

    private String cpu;
    private int ram;
    private int storage;
    private String graphicsCard;
    private boolean bluetooth;
    private boolean wifi;

    private Computer(Builder builder) {
        this.cpu = builder.cpu;
        this.ram = builder.ram;
        this.storage = builder.storage;
        this.graphicsCard = builder.graphicsCard;
        this.bluetooth = builder.bluetooth;
        this.wifi = builder.wifi;
    }

    public void displayConfiguration() {

        System.out.println("Computer Configuration");
        System.out.println("-----------------------");
        System.out.println("CPU : " + cpu);
        System.out.println("RAM : " + ram + " GB");
        System.out.println("Storage : " + storage + " GB");
        System.out.println("Graphics Card : " + graphicsCard);
        System.out.println("Bluetooth : " + bluetooth);
        System.out.println("WiFi : " + wifi);
        System.out.println();
    }

    public static class Builder {

        private String cpu;
        private int ram;
        private int storage;
        private String graphicsCard;
        private boolean bluetooth;
        private boolean wifi;

        public Builder setCPU(String cpu) {
            this.cpu = cpu;
            return this;
        }

        public Builder setRAM(int ram) {
            this.ram = ram;
            return this;
        }

        public Builder setStorage(int storage) {
            this.storage = storage;
            return this;
        }

        public Builder setGraphicsCard(String graphicsCard) {
            this.graphicsCard = graphicsCard;
            return this;
        }

        public Builder setBluetooth(boolean bluetooth) {
            this.bluetooth = bluetooth;
            return this;
        }

        public Builder setWiFi(boolean wifi) {
            this.wifi = wifi;
            return this;
        }

        public Computer build() {
            return new Computer(this);
        }
    }
}