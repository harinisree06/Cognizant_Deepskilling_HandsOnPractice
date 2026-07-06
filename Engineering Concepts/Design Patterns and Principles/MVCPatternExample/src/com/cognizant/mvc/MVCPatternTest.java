package com.cognizant.mvc;

public class MVCPatternTest {

    public static void main(String[] args) {

        Student model = new Student("Harini", "101", "A");

        StudentView view = new StudentView();

        StudentController controller =
                new StudentController(model, view);

        System.out.println("Initial Student Details");

        controller.updateView();

        System.out.println();

        System.out.println("Updating Student Details");

        controller.setStudentName("Harini Sree");
        controller.setStudentGrade("A+");

        System.out.println();

        controller.updateView();

    }

}