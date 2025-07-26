//
//  Course.swift
//  SimpleStudentManagementSystemHandsOn
//
//  Created by Roy Dimapilis on 7/26/25.
//

import Foundation

class Course: ObservableObject {
    @Published var students: [Student] = []
    
    var courseAverage: Double {
        let flattenedGrades = students.flatMap{ $0.grades }
        guard !flattenedGrades.isEmpty else { return 0.0 }
        return flattenedGrades.reduce(0, +) / Double(flattenedGrades.count)
    }
    
    func addStudent(name: String, grades: [Double]) {
        let student = Student(name: name, grades: grades)
        students.append(student)
    }
    
    func removeStudent(at offsets: IndexSet) {
        students.remove(atOffsets: offsets)
    }
    
    func sortByName() {
        students.sort { $0.name < $1.name }
    }
    
    func sortByAverage() {
        students.sort { $0.average < $1.average }
    }
}

