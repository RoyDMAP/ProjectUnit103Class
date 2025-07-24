//
//  Assignment 2.swift
//  ProjectUnit103
//
//  Created by Roy Dimapilis on 7/21/25.
//

import SwiftUI

struct assignment: View {
    @State private var students = [
        ("Alice", [85, 90, 78]),
        ("Bob", [92, 88, 95]),
        ("Charlie", [76, 82, 79]),
        ("Diana", [94, 96, 91]),
        ("Emma", [88, 84, 90])
    ]
    
    @State private var isAscending = true
    @State private var newName = ""
    @State private var newGrades = ""
    
    func average(for grades: [Int]) -> Double {
        Double(grades.reduce(0, +)) / Double(grades.count)
    }
    
    var sortedStudents: [(String, [Int])] {
        students.sorted { student1, student2 in
            let avg1 = average(for: student1.1)
            let avg2 = average(for: student2.1)
            return isAscending ? avg1 < avg2 : avg1 > avg2
        }
    }
    
    var body: some View {
        VStack {
            // Title at the header
            Text("Student Grades")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            // Sorting button
            Button(action: {
                isAscending.toggle()
            }) {
                HStack {
                    Image(systemName: isAscending ? "arrow.up" : "arrow.down")
                    Text("Sort by Average")
                    Image(systemName: "arrow.up.arrow.down.circle.fill")
                }
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding()
            
            // Student List
            List(sortedStudents, id: \.0) { student in
                VStack(alignment: .leading, spacing: 4) {
                    Text(student.0)
                        .font(.headline)
                    Text("Grades: \(student.1.map { String($0) }.joined(separator: ", "))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Grade Average: \(String(format: "%.1f", average(for: student.1)))")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .padding(.vertical, 2)
            }
            
            // Add Student Section
            VStack {
                TextField("Name", text: $newName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Grades: 85,90,78", text: $newGrades)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Add Student") {
                    addStudent()
                }
                .disabled(newName.isEmpty)
            }
            .padding()
        }
    }
    
    func addStudent() {
        let grades = newGrades.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        students.append((newName, grades.isEmpty ? [0] : grades))
        newName = ""
        newGrades = ""
    }
}

#Preview {
    assignment()
}
