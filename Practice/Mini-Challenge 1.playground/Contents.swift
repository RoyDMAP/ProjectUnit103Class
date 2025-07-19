import UIKit
//Challenge 1

var registeredNames: [String] = ["DJ", "RJ", "TJ"]
var gradesArray: [Int] = [100, 95, 99]

print("This is an Array of integer values: gradesArray -> \(gradesArray)")
print("These are our registered Students: registeredNames -> \(registeredNames)")

var gradesDictionary: [String: Int] = ["DJ": 100, "RJ": 95, "TJ": 99]

print("This is a dictionary of String keys and Int values: gradesDictionary -> \(gradesDictionary)")

var coursesNames: [String] = ["Math 101", "Science 101", "English"]
print("The second courses is: \(coursesNames[1])")

// for(let i=0; i<courseNames.lenght; i++)
for i in 1..<5 {
    print("Index: \(i)")
}

//Challenge 2

// Array
var bookTitles: [String] = ["The Alchemist", "To Kill a Mockingbird", "1984"]
print("The book titles: bookTitles -> \(bookTitles)")

//Set
var isbnNumbers: Set<String> = ["978-0134610993", "9780060935467", "9780571059307"]
print("The Set of ISBN numbers: isbnNumbers -> \(isbnNumbers)")

//Dictionary
var bookPrices: [String: Double] = ["The Alchemist": 49.99, "To Kill a Mockingbird": 39.99, "1984": 29.99]
print("The book prices: bookPrices -> \(bookPrices)")

// Array
var purchaseOrder: [String] = ["To Kill a Mockingbird", "1984", "Swift Essentials"]
print("The list of purchase order: purchaseOrder -> \(purchaseOrder)")


//Print test
print("The list of purchase order: purchaseOrder -> \(purchaseOrder)")


