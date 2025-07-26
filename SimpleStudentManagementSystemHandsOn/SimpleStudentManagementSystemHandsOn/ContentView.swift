//
//  ContentView.swift
//  SimpleStudentManagementSystemHandsOn
//
//  Created by Roy Dimapilis on 7/26/25.
//


// We want to create to create a simple application to manage the students registered on a course, their grades and we want to include sorting by grade and alphabetical sort

import SwiftUI

struct ContentView: View {
    @StateObject private var course = Course()
    
    @State var name: String = ""
    @State var grades: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Course Average: \(course.courseAverage, specifier: "%.2f")")
                        .font(.headline).font(.title2)
                        .padding()
                    
                    List {
                        ForEach(course.students) { student in 
                        VStack {
                            Text(student.name)
                            Text("Average: \(student.average)")
                        }
                     }
                  }
                }
                VStack {
                    TextField("Ramses", text: $name )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Grades (100, 80, 70)", text: $grades)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Add Student") {
                        let parsedGrades: [Double] = grades
                            .split(separator: ",")
                            .compactMap {Double($0.trimmingCharacters(in: .whitespaces))}
                        
                        course.addStudent(name: name, grades: parsedGrades)
                        
                        name = ""
                        grades = ""
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                }
            }
            .padding()
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Sort by Grade") {}
                }
            }
        }
        .navigationTitle("Student Management System").padding()
    }
}

#Preview {
    ContentView()
}
