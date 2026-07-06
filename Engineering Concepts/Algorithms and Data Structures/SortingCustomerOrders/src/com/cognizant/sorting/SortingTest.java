package com.cognizant.sorting;

public class SortingTest {

    public static void main(String[] args) {

        Order[] orders1 = {

                new Order(101, "Harini", 3500),
                new Order(102, "Priya", 1200),
                new Order(103, "Rahul", 7800),
                new Order(104, "Kavin", 2500),
                new Order(105, "Sneha", 5600)

        };

        System.out.println("Orders Before Bubble Sort\n");

        SortingOperations.display(orders1);

        SortingOperations.bubbleSort(orders1);

        System.out.println("Orders After Bubble Sort\n");

        SortingOperations.display(orders1);

        System.out.println();

        Order[] orders2 = {

                new Order(101, "Harini", 3500),
                new Order(102, "Priya", 1200),
                new Order(103, "Rahul", 7800),
                new Order(104, "Kavin", 2500),
                new Order(105, "Sneha", 5600)

        };

        System.out.println("Orders Before Quick Sort\n");

        SortingOperations.display(orders2);

        SortingOperations.quickSort(orders2, 0, orders2.length - 1);

        System.out.println("Orders After Quick Sort\n");

        SortingOperations.display(orders2);

    }

}