//
//  Assignment 3.swift
//  ProjectUnit103
//
//  Created by Roy Dimapilis on 7/21/25.
//

import SwiftUI

struct Assignment1: View {
    @State private var students: [String] = ["Alice", "Bob", "Charlie", "Diana", "Emma"]
    
    @State private var studentGrades: [String: [Int]] = [
        "Alice": [85, 90, 78],
        "Bob": [92, 88, 95],
        "Charlie": [76, 82, 79],
        "Diana": [94, 96, 91],
        "Emma": [88, 84, 90]
    ]
    
    @State private var sortAscending = false
    
    // Course average
    private var courseAverage: Double {
        let allGrades = studentGrades.values.flatMap { $0 }
        return Double(allGrades.reduce(0, +)) / Double(allGrades.count)
    }
    
    // Sorted students
    private var sortedStudents: [String] {
        return students.sorted { student1, student2 in
            let avg1 = averageFor(student1)
            let avg2 = averageFor(student2)
            return sortAscending ? avg1 < avg2 : avg1 > avg2
        }
    }
    
    var body: some View {
        VStack {
            // Course Average
            Text("Course Average: \(String(format: "%.2f", courseAverage))")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            // Sort Button
            Button(sortAscending ? "Sort: Low to High ↑" : "Sort: High to Low ↓") {
                sortAscending.toggle()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Text("Student Record Summary")
                .font(.title)
            
            ForEach(sortedStudents, id: \.self) { student in
                if let grades = studentGrades[student] {
                    let average = averageFor(student)
                    
                    VStack {
                        Text("Student: \(student)")
                        Text("Grades: \(grades.map { String($0) })")
                        Text("Average: \(String(format: "%.2f", average))")
                        
                        // Simple grade editor
                        Button("Edit Grades") {
                            // Add 5 points to first grade as example
                            if !grades.isEmpty {
                                studentGrades[student]?[0] += 5
                            }
                        }
                        .font(.caption)
                        .foregroundColor(.blue)
                    }
                    .padding()
                }
            }
            
            // Top student
            if let topStudent = sortedStudents.first,
               let grades = studentGrades[topStudent] {
                let topAverage = averageFor(topStudent)
                Text("Top Student: \(topStudent) - \(String(format: "%.2f", topAverage))")
                    .fontWeight(.bold)
                    .padding()
            }
        }
    }
    
    private func averageFor(_ student: String) -> Double {
        guard let grades = studentGrades[student], !grades.isEmpty else { return 0.0 }
        return Double(grades.reduce(0, +)) / Double(grades.count)
    }
}

#Preview {
    Assignment_1()
}
