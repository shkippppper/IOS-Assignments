import Foundation

//1. შექმენით სამი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ნამრავლი.

var fact1: Int = 1
var fact2: Int = 2
var fact3: Int = 3

print(fact1 * fact2 * fact3)


//2. შექმენით int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა და შეამოწმეთ ეს რიცხვი ლუწია თუ კენტი ტერნარი ოპერატორით.

var intNum: Int = 273

print(intNum % 2 == 0 ? "ლუწია" : "კენტია" )


//3. შექმენით optional String-ის ტიპის და მიანიჭეთ თქვენი სახელის მნიშვნელობა. If let-ის მეშვეობით გაუკეთეთ unwrap და მნიშვნელობა დაპრინტეთ

var myName: String? = "აკაკი"

if let myName{
    print(myName)
}


//4. შექმენით ცვლადი სახელად isRaining ბულეანის ტიპის და მიანიჭეთ თქვენთვის სასურველი მნიშვნელობა. If-else-ის მეშვეობით შეამოწმეთ თუ მნიშვნელობა მიიღებს true მნიშვნელობას დაბეჭდეთ “ქოლგის წაღება არ დამავიწყდეს”, სხვა შემთხვევაში “დღეს ქოლგა არ დამჭირდება”.

var isRaining: Bool = false

if isRaining{
    print("ქოლგის წაღება არ დამავიწყდეს")
}else{
    print("დღეს ქოლგა არ დამჭირდება")
}


//5. შექმენით ორი int ტიპის ცვლადი a & b და მიანიჭეთ სასურველი რიცხვები. If-else-ით შეამოწმეთ თუ a მეტია b-ზე დაბეჭდეთ “a მეტია”,  სხვა შემთხვევაში “b მეტია”

var a: Int = 233
var b: Int = 32

if a > b{
    print("a მეტია")
}else{
    print("b მეტია")
}


//6. შექმენით მუდმივა Character ტიპის და მიანიჭეთ თქვენი სახელის პირველი ასოს მნიშვნელობა.

let char: Character = "A"


//7. მოცემულია ორნიშნა რიცხვი, გაიგეთ არის თუ არა ერთიდაიმავე ციფრისგან შემდგარი

var denom: Int = 48

print(denom % 10 == denom / 10 ? "ორნიშნა რიცხვში ციფრები ერთიდაიგივეა" : "ორნიშნა რიცხვში ციფრები სხვადასხვაა")


//8. აიღეთ ცვლადი numberOfMonths მიანიჭეთ მნიშვნელობა და იმის მიხედვით თუ მერამდენე თვეა დაბეჭდეთ ის (გაზაფხული, ზაფხული, შემოდგომა, ზამთარი) შესაბამისად.

let numberOfMonths: UInt8 = 12

if numberOfMonths < 1 || numberOfMonths > 12 {
    print("ეს თვე არ არსერბობს")
} else if numberOfMonths <= 2 || numberOfMonths == 12 {
    print("ზამთარი")
} else if numberOfMonths <= 5 {
    print("გაზაფხული")
} else if numberOfMonths <= 8 {
    print("ზაფხული")
} else {
    print("შემოდგომა")
}

//9. შექმენით მთელი რიცხვის მქონე ცვლადი. თუ ეს ცვლადი იყოფა 3-ზე, დაბეჭდეთ “იყოფა 3-ზე”, თუ ეს ცვლადი იყოფა 4-ზე დაბეჭდეთ “იყოფა 4-ზე”, თუ იყოფა ორივეზე დაბეჭდეთ “იყოფა 3-ზე და 4-ზე”

var randomNumber: Int = 60

if randomNumber % 3 == 0 {
    
    print(randomNumber % 4 == 0 ? "იყოფა 3-ზე და 4-ზე" : "იყოფა 3-ზე")
    
}else if randomNumber % 4 == 0 {
    
    print("იყოფა 4-ზე")
    
}else{
    
    print("არ იყოფა არც 3-ზე და არც 4-ზე")
    
}


//10. შექმენით ორი რიცხვითი ცვლადი num1, num2 და რაიმე String ტიპის ცვლადი რომელსაც ტერნარული ოპერატორის საშუალებით მიანიჭებთ “თანაბრად დაშორებულია ნულიდან” / “არ არის თანაბრად დაშორებული ნულიდან” შესაბამის მნიშვნელობას რომელსაც აკმაყოფილებს მოცემული ორი ცვლადი

var num1: Double = 5.8
var num2: Double = -5.8

//var statement: String = abs(num1) == abs(num2) ? "თანაბრად დაშორებულია ნულიდან" : "არ არის თანაბრად დაშორებული ნულიდან"

var statement: String = num1 * num1 == num2 * num2 ? "თანაბრად დაშორებულია ნულიდან" : "არ არის თანაბრად დაშორებული ნულიდან"

print(statement)

