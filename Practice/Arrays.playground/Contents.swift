import UIKit

let fruits: [String] = ["Banana", "Orange", "Apple"]

print("The first fruit is: ", fruits[0])
print("The second fruit is: ", fruits[1])
print("The third fruit is: ", fruits[2])

// Travel arrays
for fruit in fruits {
    print(fruit)
}

//enumerated()
for (indes, fruit) in fruits.enumerated(){
    print("\n The \(index) fruit is: \(fruit)")
}

// Last and the first item
print("The first item is: ", fruits.first)
print("The last item is: ", fruits.last)

// ?? is called nil-coalescing operator -> Define a default value
print(fruits.first ?? "There is no information")

// Searching in the array
// Are there any apples
print(fruits.contains("apple"))
print(fruits.contains("Apple"))

// Removing an item
// print(fruits.remove(at: 0)) -> It can't be removed from a let array

var fruitsList: [String] = ["Banna", "Orange", "Apple"]

// Remove by index
print("The removed item is: ", fruitsList.remove(at: 0)) // Return the removed item
print("The list of fruits now contains: ", fruitsList)

// Remove all items
print("The fruits list contains: ", fruitsList.removeAll())

// Add one item at time
fruitsList.append("Mango")
print("The new list is: ", fruitsList)

// Add multiple items
fruitsList.append(contentsOf: ["Banana", "Naranja", "Mandarina", "Papaya"])
print(fruitsList)

// Sorting

let ascendingOrderFruits = fruitsList.sorted()
print(ascendingOrderFruits)

// Reversed
let descendingOrderFruits = fruitsList.sorted(by: >)
print(descendingOrderFruits)

