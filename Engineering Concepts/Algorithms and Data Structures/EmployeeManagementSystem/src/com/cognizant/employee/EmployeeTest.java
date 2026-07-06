package com.cognizant.employee;

public class EmployeeTest {

    public static void main(String[] args) {

        EmployeeManagement management = new EmployeeManagement(10);

        management.addEmployee(new Employee(101, "Harini", "Software Engineer", 65000));

        management.addEmployee(new Employee(102, "Rahul", "Tester", 50000));

        management.addEmployee(new Employee(103, "Priya", "Developer", 70000));

        management.traverseEmployees();

        System.out.println();

        management.searchEmployee(102);

        System.out.println();

        management.deleteEmployee(102);

        System.out.println();

        management.traverseEmployees();

    }

}