package com.cognizant.inventory;

import java.util.HashMap;

public class Inventory {

    private HashMap<Integer, Product> inventory = new HashMap<>();

    // Add Product
    public void addProduct(Product product) {

        inventory.put(product.getProductId(), product);

        System.out.println("Product Added Successfully.\n");

    }

    // Update Product
    public void updateProduct(int id, int quantity, double price) {

        Product product = inventory.get(id);

        if (product != null) {

            product.setQuantity(quantity);
            product.setPrice(price);

            System.out.println("Product Updated Successfully.\n");

        } else {

            System.out.println("Product Not Found.\n");

        }

    }

    // Delete Product
    public void deleteProduct(int id) {

        if (inventory.remove(id) != null) {

            System.out.println("Product Deleted Successfully.\n");

        } else {

            System.out.println("Product Not Found.\n");

        }

    }

    // Display Inventory
    public void displayInventory() {

        if (inventory.isEmpty()) {

            System.out.println("Inventory is Empty.");

            return;

        }

        for (Product product : inventory.values()) {

            System.out.println(product);

            System.out.println("-------------------------");

        }

    }

}