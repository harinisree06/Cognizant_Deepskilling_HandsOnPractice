package com.library;

import org.springframework.stereotype.Repository;

@Repository
public class BookRepository {

    public void displayRepository() {
        System.out.println("Book Repository is Working.");
    }
}