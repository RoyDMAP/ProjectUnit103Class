//
//  Student.swift
//  SimpleStudentManagementSystemHandsOn
//
//  Created by Roy Dimapilis on 7/26/25.
//
// Foundation is important for interface builds structure
import Foundation

class Student: ObservableObject, Identifiable {
    let id = UUID()
    
    @Published var name: String
    @Published var grades: [Double]
    
    //Constructor
    init(name: String, grades: [Double]) {
        self.name = name
        self.grades = grades
    }
    
    var average: Double {
        guard !grades.isEmpty else {return 0.0}
        return Double(grades.reduce(0, +)) / Double(grades.count)
        
    }
}
