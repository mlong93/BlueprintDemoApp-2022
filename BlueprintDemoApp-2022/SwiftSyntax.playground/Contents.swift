import UIKit

// ******************* //
// Declaring variables
// ******************* //

// **** SYNTAX **** //
// Static typing is when the user explicitly defines the type of the variable at declaration.
// let constant name: type = expression
let var4: Float = 1.0

// Inferred typing is when the editor interprets what type the variable is.
let var1 = 5
let var2 = "blueprint"

// 'let' indicates a constant, so var5 must be set to a value at declaration
let var5: UILabel // ERROR
let var6: UILabel = UILabel() // valid
let var7 = UILabel()

// var's are mutable and initialized later
var var3 = "mutable"
var var8: String


// ********** //
// Data Types //
// ********** //
// Tuples //
let myTuple = ("blueprint", 2021)

/* Tuple Methods */
myTuple[0]  // access element at index
// Arrays //
let myFirstArray = ["blueprint", 2021] // ERROR
var mySecondArray: [Any] = ["blueprint", 2021]
let emptyArray: [Int] = []
let emptyArray2: Array<Double> = Array() // similar to Java
let digitCounts = Array(repeating: 0, count: 10) //intializes array of 0s with length 10
/* Array Methods */
mySecondArray.isEmpty // checks if empty
mySecondArray.count   // length of array
mySecondArray.first   // get first element of array
mySecondArray.last    // get last element of array
mySecondArray.append("new element") // appends item to end of array
mySecondArray.append(contentsOf: ["a", "b"]) // appends multiple elements to end of array
mySecondArray.insert("Swift", at: 1) // inserts item at specified index
mySecondArray.remove(at: 1) // removes element at index
mySecondArray.removeLast()  // remove last element
mySecondArray[0]            // get element at index 0
mySecondArray[0...2]        // gets subarray of elements, inclusive
emptyArray2.reduce(0, { x, y in x + y }) // produces a single value from the elements of an entire sequence
emptyArray.map{$0 * 10}                  // applies the function to each element ($0) in the array
/* Iterating */
for i in 0...mySecondArray.count {
    print(mySecondArray[i])
}

for element in mySecondArray {
    print(element)
}

/* Other Array Methods */
/*
 concatentation: a = b + c
 flatmap: removes all nil's from array
 filter: removes all elements satisfying a condition
 */

// Sets //
// Sets are used to test efficiently for membership when order doesn't matter. Think of it as hashing but without the mapping part.
let mySet: Set = ["start hacking", "mobile dev (iOS)", "mobile dev (Android)", "web dev beginner", "web dev advanced"]
let set2: Set = ["start hacking", "a", "Swift", "test"]

/* Set methods */
mySet.contains("test")    // does your set contain an element
mySet.isSubset(of: set2)  // test if your set is a subset
mySet.union(set2)         // join with another set
mySet.intersection(set2)  // get intersection of this set with other set
// You can also use any nonmutating sequence or collection methods with a set
// Dictionaries //
// Dictionaries are hashmaps. They can map one element to another.
// EX: What if I wanted to store an array of names for each class? In this case, the class (name or id) would be a key and would point to an array of student names stored somewhere. Typing myDict[classname] would allow you to access that class.
let myDict: Dictionary<String, Int> = [:]
let myDict2 = [Int: UILabel]()

// EX (continued)
var myClass = [
    "mobile dev (iOS)": ["Mindy", "Katherine", "Nat"],
    "mobile dev (Android)": ["Arun", "Darren", "Anna", "Angela", "Vishruti"],
    "web dev beginner": ["Jianna", "Justin"],
    "web dev advanced": ["weblab"]
]
let instructors = myClass["mobile dev (iOS)"] // instructors = ["Arun", "Darren", "Anna", "Angela", "Vishruti"]
// Typealiases: alternate name for existing type //
typealias CustomType = [UUID:People] // Assume we have a class or struct People

// ********* //
// Optionals //
// ********* //
// An optional is either an unwrapped value or nil. That means that it will either have a value or be null.
// How do we access a value that can be nil though? This is called *unwrapping*.
// Optionals are used in situations when a value may not exist - like when an operation may fail or return nothing
// By default they are set to nil
var myImage: UIImage?   // ? is the same as `var myImage: UIImage? = nil`
var mySlider: UISlider! // ! is the force unwrap operator. If the value is nil (not by default), the program will be terminated during runtime (unless you catch it)
// Unwrapping optionals
var unwrappedImage = UIImage()
var unwrappedSlider = UISlider()
func unwrapper() {
    
    // Option 1 (recommended)
    guard let unwrappedImage = myImage else {
        print("Unwrap failed! ):")
        return
    }
    print("Unwrap success!")
    
    // Option 2
    if let unwrappedImage = myImage {
        print("Unwrap success! \(unwrappedImage)")
    }
    
    // Option 3
    if mySlider != nil {
        unwrappedSlider = mySlider
        print("Unwrap success! \(unwrappedSlider)")
    }
}


// *************** //
// Basic functions //
// *************** //
// func name(parameters) -> (return type) { function }
func myVar(param: String) -> String {
    var v: String
    v = param
    return v
}

print(myVar(param: var2))


// ************** //
// Error Handling //
// ************** //
func checkVar(v: String) throws {
    //..
}

do {
    try checkVar(v: var2)
} catch {
    print("Something went wrong!")
}


// ************************* //
// Enums, classes, & structs //
// ************************* //
/* Enum: Think of this as a dropdown menu of options */
enum Track {
    case startHacking, mobileiOS, mobileAndroid, webdevBeginner, webdevAdvanced
}

/* Struct */
struct Hacker {
    let name: String
    let id: Int
    let track: Track
    var isCheckedIn: Bool = false
    
    // Mutating functions changes the values of the struct- internally, the old Hacker is replaced by a new Hacker with a different isCheckedIn value.
    mutating func checkIn() {
        isCheckedIn = true
    }
}

/* Class */
class Hackathon {
    let name: String = ""
    let location: String = ""
    let host: String = ""
    let date: Date = Date()
    var participants: [Hacker] = []
    
    func getParticipants() -> Int {
        return participants.count
    }
    
    func updateParticipants(hackers: [Hacker]) {
        participants += hackers
    }
}


// Both class and struct types can define properties, methods, initializers, and conform to protocols.
// Classes can inherit from each other and is a reference type - instances of a class are accessed through references.
// Struct is a value type and, in a way, immutable. Each instance of a struct is independent of another.
/* CONCEPT CHECK
 
 class X {
 
    private var name: String?
    
    func setName(n: String) {
        name = n
    }
    
    func getName() -> String {
        return name
    }
 
 }
 
 let a = X()
 a.setName("hi")
 let b = a
 a.setName("bye")
 
 // What will b's name be?
 b.getName() -> "bye"
 
 // What if X were a struct?
 b.getName() -> "hi"
 
*/

/* EXAMPLE USE */
let hacker = Hacker(name: "Mindy", id: 1, track: .mobileiOS)
let hackathon = Hackathon()
hackathon.updateParticipants(hackers: [hacker])

print(hackathon.participants)
