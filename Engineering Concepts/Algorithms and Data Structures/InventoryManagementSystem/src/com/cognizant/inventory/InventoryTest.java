package com.cognizant.inventory;

public class InventoryTest {

    public static void main(String[] args) {

        Inventory inventory = new Inventory();

        Product p1 = new Product(101, "Laptop", 10, 65000);

        Product p2 = new Product(102, "Mouse", 50, 800);

        Product p3 = new Product(103, "Keyboard", 30, 1500);

        // Add Products
        inventory.addProduct(p1);
        inventory.addProduct(p2);
        inventory.addProduct(p3);

        System.out.println("Inventory After Adding Products");

        inventory.displayInventory();

        // Update Product
        inventory.updateProduct(102, 60, 900);

        System.out.println("\nInventory After Updating Product");

        inventory.displayInventory();

        // Delete Product
        inventory.deleteProduct(101);

        System.out.println("\nInventory After Deleting Product");

        inventory.displayInventory();

    }

}