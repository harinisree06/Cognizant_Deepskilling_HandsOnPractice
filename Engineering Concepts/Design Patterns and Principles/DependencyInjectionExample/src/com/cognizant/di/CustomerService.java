package com.cognizant.di;

public class CustomerService {

    private CustomerRepository customerRepository;

    public CustomerService(CustomerRepository customerRepository) {

        this.customerRepository = customerRepository;

    }

    public void getCustomerDetails(int id) {

        System.out.println(customerRepository.findCustomerById(id));

    }

}