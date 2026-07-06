package com.cognizant.employee;

public class EmployeeManagement {

    private Employee[] employees;
    private int count;

    public EmployeeManagement(int size) {

        employees = new Employee[size];
        count = 0;

    }

    // Add Employee
    public void addEmployee(Employee employee) {

        if (count < employees.length) {

            employees[count] = employee;
            count++;

            System.out.println("Employee Added Successfully.\n");

        } else {

            System.out.println("Employee Array is Full.\n");

        }

    }

    // Search Employee
    public void searchEmployee(int id) {

        for (int i = 0; i < count; i++) {

            if (employees[i].getEmployeeId() == id) {

                System.out.println("Employee Found\n");
                System.out.println(employees[i]);
                return;

            }

        }

        System.out.println("Employee Not Found.\n");

    }

    // Traverse Employees
    public void traverseEmployees() {

        System.out.println("Employee Records\n");

        for (int i = 0; i < count; i++) {

            System.out.println(employees[i]);
            System.out.println("-----------------------");

        }

    }

    // Delete Employee
    public void deleteEmployee(int id) {

        int index = -1;

        for (int i = 0; i < count; i++) {

            if (employees[i].getEmployeeId() == id) {

                index = i;
                break;

            }

        }

        if (index == -1) {

            System.out.println("Employee Not Found.\n");
            return;

        }

        for (int i = index; i < count - 1; i++) {

            employees[i] = employees[i + 1];

        }

        employees[count - 1] = null;
        count--;

        System.out.println("Employee Deleted Successfully.\n");

    }

}