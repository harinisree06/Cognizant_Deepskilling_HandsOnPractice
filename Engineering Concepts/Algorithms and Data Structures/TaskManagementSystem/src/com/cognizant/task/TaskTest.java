package com.cognizant.task;

public class TaskTest {

    public static void main(String[] args) {

        TaskLinkedList list = new TaskLinkedList();

        list.addTask(101, "Design UI", "Pending");
        list.addTask(102, "Develop Backend", "In Progress");
        list.addTask(103, "Testing", "Pending");

        System.out.println("All Tasks\n");

        list.traverseTasks();

        System.out.println();

        list.searchTask(102);

        System.out.println();

        list.deleteTask(102);

        System.out.println("Tasks After Deletion\n");

        list.traverseTasks();

    }

}