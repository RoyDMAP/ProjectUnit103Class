//
//  Assignment 3.swift
//  ProjectUnit103
//
//  Created by Roy Dimapilis on 7/21/25.
//

import SwiftUI
import Foundation

struct Student: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var grades: [Int]
    
    var average: Double {
        guard !grades.isEmpty else { return 0.0 }
        return Double(grades.reduce(0, +)) / Double(grades.count)
    }
    
    var isPassing: Bool {
        return average >= 60.0
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Assignment_3: View {
    @State private var students = [
        Student(name: "Alice", grades: [85, 90, 78]),
        Student(name: "Bob", grades: [92, 88, 95]),
        Student(name: "Charlie", grades: [76, 82, 79]),
        Student(name: "Diana", grades: [94, 96, 91]),
        Student(name: "Emma", grades: [88, 84, 90])
    ]
    
    @State private var isAscending = true
    @State private var newName = ""
    @State private var newGrades = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var topStudent: Student? {
        students.max { $0.average < $1.average }
    }
    
    var sortedStudents: [Student] {
        students.sorted { student1, student2 in
            return isAscending ? student1.average < student2.average : student1.average > student2.average
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Top student display
                if let topStudent = topStudent {
                    VStack(spacing: 8) {
                        HStack {
                            Image(systemName: "trophy.fill")
                                .foregroundColor(.yellow)
                                .font(.title2)
                            Text("Top Student: \(topStudent.name)")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.title2)
                        }
                        Text("Highest Average: \(String(format: "%.1f", topStudent.average))")
                            .font(.subheadline)
                            .foregroundColor(.orange)
                    }
                    .padding()
                    .background(Color.yellow.opacity(0.1))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.top)
                }
                
                // Sorting button
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isAscending.toggle()
                    }
                }) {
                    HStack {
                        Image(systemName: isAscending ? "arrow.up" : "arrow.down")
                        Text("Sort by Average (\(isAscending ? "Low to High" : "High to Low"))")
                        Image(systemName: "arrow.up.arrow.down.circle.fill")
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                .padding()
                
                // Student List
                List {
                    ForEach(sortedStudents) { student in
                        StudentRowView(student: student)
                    }
                    .onDelete(perform: deleteStudent)
                }
                .listStyle(DefaultListStyle())
                
                // Add Student Section
                VStack(spacing: 12) {
                    Divider()
                    
                    Text("Add New Student")
                        .font(.headline)
                        .padding(.top)
                    
                    VStack(spacing: 10) {
                        TextField("Student Name", text: $newName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Grades (comma separated): 85,90,78", text: $newGrades)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numbersAndPunctuation)
                        
                        Button("Add Student") {
                            addStudent()
                        }
                        .disabled(newName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(newName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? Color.gray : Color.green)
                        .cornerRadius(10)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
            }
            .navigationTitle("Student Grades")
            .navigationBarTitleDisplayMode(.large)
        }
        .alert("Input Error", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }
    
    func addStudent() {
        let trimmedName = newName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Validate name
        if trimmedName.isEmpty {
            showAlert("Please enter a student name.")
            return
        }
        
        // Check for duplicate names
        if students.contains(where: { $0.name.lowercased() == trimmedName.lowercased() }) {
            showAlert("A student with this name already exists.")
            return
        }
        
        // Parse grades
        let gradesString = newGrades.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !gradesString.isEmpty else {
            showAlert("Please enter at least one grade.")
            return
        }
        
        let gradeComponents = gradesString.components(separatedBy: ",")
        var validGrades: [Int] = []
        
        for component in gradeComponents {
            let trimmed = component.trimmingCharacters(in: .whitespacesAndNewlines)
            if let grade = Int(trimmed), grade >= 0, grade <= 100 {
                validGrades.append(grade)
            }
        }
        
        // Validate grades
        guard !validGrades.isEmpty else {
            showAlert("Please enter valid grades (0-100, separated by commas).")
            return
        }
        
        // Add the student
        let newStudent = Student(name: trimmedName, grades: validGrades)
        students.append(newStudent)
        
        // Clear fields
        newName = ""
        newGrades = ""
    }
    
    func deleteStudent(at offsets: IndexSet) {
        // Get the students to delete based on sorted order
        let studentsToDelete = offsets.map { sortedStudents[$0] }
        
        // Remove from the original array
        students.removeAll { student in
            studentsToDelete.contains { $0.id == student.id }
        }
    }
    
    func showAlert(_ message: String) {
        alertMessage = message
        showingAlert = true
    }
}

struct StudentRowView: View {
    let student: Student
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(student.name)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text("Grades: \(student.grades.map { String($0) }.joined(separator: ", "))")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Text("Average: \(String(format: "%.1f", student.average))")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .fontWeight(.medium)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Image(systemName: student.isPassing ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .font(.system(size: 14))
                    Text(student.isPassing ? "Passing" : "Failing")
                        .font(.caption)
                        .fontWeight(.medium)
                }
                .foregroundColor(student.isPassing ? .green : .red)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    Assignment_3()
}
