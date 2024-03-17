import Foundation

//1. დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: "ანა”, "აირევი ივერია”, "მადამ”)

func isPalindome(name: String) -> Bool{
    return name == String(name.reversed())
}

print(isPalindome(name: "აირევი ივერია"))


//2. დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.


func numberSquarer(numbers: [Double]) -> [Double]{
    var squaredNumbers = [Double]()
    for number in numbers{
        squaredNumbers.append(number * number)
    }
    print(squaredNumbers)
    
    return squaredNumbers
}

numberSquarer(numbers: [3, 4.123, 99.99])


//3.დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.

var filterEvenNumbers: ([Int]) -> ([Int]) = { numbers in
    var newArray = [Int]()
    for number in numbers{
        if number % 2 == 0{
            newArray.append(number)
        }
    }
    return newArray
}

print(filterEvenNumbers([1,2,3,4,5,6,7,8,9]))


//4. დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.

func sumOfArray(numbers: [Int], closure: @escaping ([Int]) -> (Int)){
    var sum = 0
    DispatchQueue.global().asyncAfter(deadline: .now()+5){
        sum = closure(numbers)
        print("დაიბეჭდა 5 წამის შემდეგ \(sum)")
    }

}

var myClosure: ([Int]) -> (Int) = { numbers in
    var calculatedSum = 0
    for number in numbers {
        calculatedSum += number
    }
    return calculatedSum
}

sumOfArray(numbers: [4,5,6,7], closure: myClosure)


//5. შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი

var phoneBook = [String: Int]() // შექმნა

phoneBook = [
    "Akaki" : 599999999,
    "Aleksandre" : 599888888,
    "Anastasia" : 599777777,
    "Achiko" : 599666666,
    "Andro" : 599555555,
    "Ana" : 599444444,
    "Archili" : 599333333,
    "Aleko" : 599222222,
    "Argelodi" : 599111111
] // გადაწერა

phoneBook["Ararati"] = 599000000 // დამატება

print(phoneBook["Ana"]!) // მოძებნა+დაბეჭდვა + force unwrap

phoneBook["Aleko"] = nil // წაშლა


//6. დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.

let myDictionary = [
    "D" : 4,
    "A" : 1,
    "C" : 3,
    "E" : 5,
    "B" : 2,
    "Akaki": 999
]

func sortDictionary(dict:[String: Int])->([String]){
    let sortedKeys = dict.keys.sorted()
    return sortedKeys
}

print(sortDictionary(dict: myDictionary))


//7.შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.

var myDoubleArray = [-2.3, 4.5, 6.52, 8.999, -3.4,]
var biggestNumber = myDoubleArray[0]

for double in myDoubleArray {
    if(double > biggestNumber){
        biggestNumber = double
    }
}

print(biggestNumber)

//მოცემულია Dictionary სადაც წარმოდგენილია ლელა წურწუმიას სიმღერებისა და მათი ხანგრძლივობა(წმ) მონაცემები:

let lelaWhatMovementIsThis: [String: Int] = [
    "ღამის სიჩუმე გაფანტე": 235,
    "ვიხსენებ ყველაფერს თავიდან": 219,
    "სულელი წვიმა": 231,
    "ალალ მე": 231,
    "იდუმალი ღამე": 221,
    "ჩუმად ნათქვამი": 199,
    "თეთრი ქარავანი": 221,
    "ძველი ვერხვები": 193
]

//optional 1. დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში

func totalSongLength(dict: [String: Int]){
    var result = 0
    
    for num in dict{
        result += num.value
    }

    print("ჯამური ხანგრძლივობა \(result / 60)წთ \(result % 60)წმ")
}

totalSongLength(dict: lelaWhatMovementIsThis)

//optional 2. დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.

func shortestAndLongest(dict: [String: Int]){
    var longestSongName = dict.keys.randomElement()
    var shortestSongName = dict.keys.randomElement()
    
    for song in dict {
        if(song.value > dict[longestSongName!]!){ // double force unwrap
            longestSongName = song.key
        }
        if(song.value < dict[shortestSongName!]!){
            shortestSongName = song.key
        }
    }
    
    print("ყველაზე გრძელი სიმღერა - \(longestSongName!)")
    print("ყველაზე მოკლე სიმღერა - \(shortestSongName!)")
}

shortestAndLongest(dict: lelaWhatMovementIsThis)


//optional 3. დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას

func averageSongLength(dict: [String: Int]) {
    var songsLengthAverage = 0
    
    for songLength in dict{
        songsLengthAverage += songLength.value
    }
    
    songsLengthAverage = songsLengthAverage / dict.count
    
    print("სიმღერების საშუალო ხანგრძლივობა - \(songsLengthAverage)")
    
}

averageSongLength(dict: lelaWhatMovementIsThis)

//optional 4. დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს

func randomValue(dict: [String: Int]){
    print(dict.keys.randomElement()!)
}

randomValue(dict: lelaWhatMovementIsThis)
