import UIKit

/* ARRAY
print("----ARRAYS----")
print("""
THere are the characteristic of an Array:
1. It is ordered.
2. Supports duplicated items.
3. Each item has a position (index). \n
""")
*/

//Definning an Array: emply and with data

// var arrayName: [Type] = [Value1, Value2, ...]

var emptyArray: [Int] = []
var gradesArray: [Int] = [100, 89, 99]
var names: [String] = ["Fernanda", "Will", "Roy"]

// Let's print the array using iterpolation
print("This is an empty array: emptyArray -> \(emptyArray)")

// This is a JavaScript: console.log( ` This is a long text and ${variable} `}

// Print the gradesArray and the names to verify the order
print("This is an Array of integer values: gradesArray -> \(gradesArray)")
print("This is an Array of strings: names -> \(names)")

/*SET
print("----SETS----"
print("""
These are the characteristics of the sets:
1. It is an unordered collection.
2. Items don't have a position.
3. Duplicates are not allowed. \n
""")
*/

// Defining sets: empty and with data
// var setName: Set<Type> = [values...]

var emptySet = Set<Int>()
var gradesSet: Set<Int> = [100, 89, 99]

print("This is an empty set: emptySet -> \(emptySet)")
print ("This is a Set of integer values: gradeSet -> \(gradesSet)")
print("An Array is ordered -> [100, 89, 99] -> Output: \(gradesArray) | A Set is unordered -> [100, 89, 00] -> Output: \(gradesSet)")

// DICTIONARY
/*print(" ----Dictionary----")
print("""
These are the characteristics of the dictionaries:
1. Unordered.
2. Collection of key-value pairs.
3. Each key must be Unique, but the value can be duplicated. 
"""?
*/

// Defining dictionaries
// var dictionaryName: [keyType: valueType] = [key1: value1, key2: value2, ...)

var emptyDictionary: [String: Int] = [:]
var gradesDictionary: [String: Int] = ["Fernanda": 100, "Will": 89, "Roy": 99]

// Let's print the values
print("This is an empty dictionary: emptyDictionary -> \(emptyDictionary)")
print("This is a dictionary of String keys and Int values: gradesDictionary -> \(gradesDictionary)")
