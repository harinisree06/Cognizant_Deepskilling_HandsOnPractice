package com.library;

public class BookService {

    private BookRepository repository;

    // Setter Injection
    public void setRepository(BookRepository repository) {
        this.repository = repository;
    }

    public void displayService() {

        System.out.println("Book Service is Working.");

        repository.displayRepository();

    }

}