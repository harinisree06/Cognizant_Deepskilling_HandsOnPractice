package com.library;

import org.springframework.stereotype.Service;

@Service
public class BookService {

    private BookRepository repository;

    // Constructor Injection
    public BookService(BookRepository repository) {
        this.repository = repository;
        System.out.println("Constructor Injection Executed");
    }

    // Setter Injection
    public void setRepository(BookRepository repository) {
        this.repository = repository;
        System.out.println("Setter Injection Executed");
    }

    public void displayService() {
        System.out.println("Book Service is Working.");
        repository.displayRepository();
    }
}