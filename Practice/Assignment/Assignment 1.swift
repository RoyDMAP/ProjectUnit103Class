//
//  Assignment 1.swift
//  ProjectUnit103
//
//  Created by Roy Dimapilis on 7/21/25.
//

import SwiftUI

struct Assignment_1: View {
    let students: [String] = ["Alice", "Bob", "Charlie", "Diana", "Emma"]
    
    let studentGrades: [String: [Int]] = [
        "Alice": [85, 90, 78],
        "Bob": [92, 88, 95],
        "Charlie": [76, 82, 79],
        "Diana": [94, 96, 91],
        "Emma": [88, 84, 90]
    ]
    
    var body: some View {
        VStack {
            Text("Student Record Summary")
                .font(.title)
            
            ForEach(students, id: \.self) { student in
                if let grades = studentGrades[student] {
                    let average = Double(grades.reduce(0, +)) / Double(grades.count)
                    
                    VStack {
                        Text("Student: \(student)")
                        Text("Grades: \(grades.map { String($0) })")
                        Text("Average: \(String(format: "%.2f", average))")
                    }
                    .padding()
                }
            }
            
            // Display top student
            let topStudent = students.max { student1, student2 in
                let avg1 = Double(studentGrades[student1]?.reduce(0, +) ?? 0) / Double(studentGrades[student1]?.count ?? 1)
                let avg2 = Double(studentGrades[student2]?.reduce(0, +) ?? 0) / Double(studentGrades[student2]?.count ?? 1)
                return avg1 < avg2
            }
            
            if let topStudent = topStudent,
               let grades = studentGrades[topStudent] {
                let topAverage = Double(grades.reduce(0, +)) / Double(grades.count)
                Text("Top Student: \(topStudent) - \(String(format: "%.2f", topAverage))")
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    Assignment_1()
}
