package com.cognizant.library;

import java.util.Arrays;
import java.util.Comparator;

public class LibraryTest {

    public static void main(String[] args) {

        Book[] books = {

                new Book(101, "Java Programming", "James Gosling"),
                new Book(102, "Data Structures", "Mark Allen"),
                new Book(103, "Operating Systems", "Abraham Silberschatz"),
                new Book(104, "Computer Networks", "Andrew Tanenbaum"),
                new Book(105, "Database Systems", "Raghu Ramakrishnan")

        };

        // Linear Search

        System.out.println("LINEAR SEARCH\n");

        Book result1 = LibrarySearch.linearSearch(books, "Data Structures");

        if (result1 != null)

            System.out.println(result1);

        else

            System.out.println("Book Not Found");

        // Sort array before Binary Search

        Arrays.sort(books, Comparator.comparing(Book::getTitle));

        System.out.println("\nBINARY SEARCH\n");

        Book result2 = LibrarySearch.binarySearch(books, "Data Structures");

        if (result2 != null)

            System.out.println(result2);

        else

            System.out.println("Book Not Found");

    }

}