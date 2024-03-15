import Foundation

//print-ის ფუნქცია თვალსაჩინოებისთვის

func customPrint(exercise: String, action: () ->Void){
    print("ამოცანა: \(exercise)")
    print("-------------------------")
    action()
    print("\n")
}

//1. while ციკლის გამოყენებით, 1-დან 20-მდე დაბეჭდეთ ყველა კენტი რიცხვის ნამრავლი.

var i = 1
var oddProduct = 1

var firstTask = {
    while i <= 20 {
        
        oddProduct *= i % 2 != 0 ? i : 1
        
        print(oddProduct)
        
        i += 1
    }
}

customPrint(exercise: "1", action: firstTask)


//2. შექმენით String ტიპის ცვლადი და ციკლის გამოყენებით შემოაბრუნეთ ის, მაგ: თუ გვაქვს “Test” უნდა მივიღოთ “tseT”

var initialString = "Test"
var reversedString = ""

for char in initialString{
    reversedString = String(char) + reversedString
}

let secondTask = {
    print("\(initialString) -> \(reversedString)")
}
customPrint(exercise: "2", action: secondTask)

//3. while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."

var lightIndex = 0

let thirdTask = {
    while lightIndex < 12{
        
        switch lightIndex % 3{
        case 0:
            print("🔴")
        case 1:
            print("🌕")
        case 2:
            print("🟢")
        default:
            break
        }
        
        lightIndex += 1
    }
}

customPrint(exercise: "3", action: thirdTask)



//4. Taylor Swift-ის კონცერტის ბილეთები იყიდება, თუმცა რაოდენობა ძალიან შეზღუდულია. While loop-ის მეშვეობით შექმენით ბილეთების გაყიდვის სიმულაცია და ყოველ გაყიდულ ბილეთზე დაბეჭდეთ “ბილეთი გაყიდულია, დარჩენილია მხოლოდ X რაოდენობა”, მანამ სანამ ბილეთების რაოდენობა მიაღწევს 0-ს, რის შემდეგაც ბეჭდავთ - “ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე”

var ticketsRemaining = 20

let fourthTask = {
    while ticketsRemaining > 0{
        ticketsRemaining -= 1
        
        if(ticketsRemaining == 0){
            print("ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე")
        }else{
            print("ბილეთი გაყიდულია, დარჩენილია მხოლოდ \(ticketsRemaining) რაოდენობა")
        }
    }
}

customPrint(exercise: "4", action: fourthTask)



//5. ექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)

let myArray = ["a","b","c","a"]
let myArray1 = [1,5,8,1]
let myArray2 = ["asd","abc","asd"]

var hasDuplicates = false

for item in myArray{
    var duplicateCount = 0
    
    for otherItem in myArray{
        duplicateCount += item == otherItem ? 1 : 0
    }
    
    hasDuplicates = duplicateCount > 1
}

let fifthTask = {
    print(hasDuplicates ? "array შეიცავს მსგავს ელემენტებს" : "array-ში ყველა ელემენტი განსხვავებულია")
}

customPrint(exercise: "5", action: fifthTask)


//6. დაწერეთ ქლოჟერი რომელიც გამოითვლის ორი რიცხვის სხვაობას და დააბრუნებს მიღებულ მნიშვნელობას

let twoNumberDifference: (Double,Double) -> (Double) = { x,y in
    return x - y
}

let sixthTask = {
    print(twoNumberDifference(3.123, 2.111))
}

customPrint(exercise: "5", action: sixthTask)


//7. დაწერეთ ფუნქცია, რომელსაც გადააწვდით String ტიპის პარამეტრს. დაითვალეთ ამ პარამეტრში თანხმოვნების რაოდენობა და დაბეჭდეთ ის.

func numberOfVowels(myString: String) -> Int{
    var count = 0
    
    let vowels = ["ა","ე","ი","ო","უ"]
    for char in myString {
        count += vowels.contains(String(char)) ? 1 : 0
    }

    return count
}

let seventhTask = {
    print(numberOfVowels(myString: "აბგდევზთიკლმნოპჟრსტუფქღყშჩცძწჭხჯჰ"))
}


// OPTIONAL:
//1. შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array.

let num1 = [8, 4, 9, 9, 0, 2]
let num2 = [1, 0, 9, 2, 3, 7, 0, 1]
let num3 = num1 + num2

let bubbleSort: ([Int]) -> [Int] = { array in
    var sortedArray = array
    let n = sortedArray.count
    
    for i in 0..<n {
        for j in 1..<n { //start at 1 for j-1 exception
            if sortedArray[j-1] > sortedArray[j] {
                let temp = sortedArray[j-1]
                sortedArray[j-1] = sortedArray[j]
                sortedArray[j] = temp
            }
        }
    }
    
    return sortedArray
}
let optionalTaskeOne = {
    print(bubbleSort(num3))
}

customPrint(exercise: "optional-1", action: optionalTaskeOne)

//2. დაწერეთ ფუნქცია, რომელსაც გადააწვდით int ტიპის პარამეტრს. გამოითვალეთ ამ პარამეტრის ფაქტორიალი და დაბეჭდეთ

let toFactor = 10

func factorialCounter(num: Int) -> Int{
    var numCopy = num
    var result = 1
    
    while numCopy > 0 {
        result *= numCopy
        numCopy -= 1
    }
    
    return result
}

let optionalTaskTwo = {
    print("\(toFactor)-ის ფაქტორიალი არის \(factorialCounter(num: toFactor))")
}

customPrint(exercise: "optional-2", action: optionalTaskTwo)

//3.შექმენით Int-ების array, შეავსეთ ის 0-იდან 10-ის ჩათვლით რიცხვებით. loop-ის  გამოყენებით დაშალეთ ეს array 2 array-იდ. ერთში გადაიტანეთ კენტი რიცხვები, მეორეში კი ლუწი რიცხვები, დაბეჭდეთ ორივე მიღებული array.

let newArray = [0,1,2,3,4,5,6,7,8,9,10]

func sortArray(array: [Int]) -> ([Int], [Int]){
    var oddNumbers: [Int] = []
    var evenNumbers: [Int] = []
    
    for number in newArray {
        if(number % 2 == 0){
            evenNumbers.append(number)
        }else{
            oddNumbers.append(number)
        }
    }
    return (evenNumbers, oddNumbers)
}

let bothArrays = sortArray(array: newArray)

let optionalTaskThree = {
    print("\(bothArrays.0) ლუწები")
    print("\(bothArrays.1) კენტები")
}


customPrint(exercise: "optional-3", action: optionalTaskThree)


