package com.techlabs.model;

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {

		public static List<Student> getStudents(){
			List<Student> students = new ArrayList<Student>();
			students.add(new Student(1,"Suyash","Awasthy","suyash@abc"));
			students.add(new Student(2,"Shivansh","Sondhi","shivansh@abc"));
			students.add(new Student(3,"Rachit","Singh","rachit@abc"));
			students.add(new Student(4,"Yash","Garg","yash@abc"));
		
			return students;
		}
}
