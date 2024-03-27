import Foundation

//1.შევქმნათ Class Book.
//
//Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//Designated Init.
//Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
//Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.

class Book {
    
    var bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func hasBeenBorrowed(){
        self.isBorrowed = true
    }
    
    func hasBeenReturned(){
        self.isBorrowed = false
    }
}

//2.შევქმნათ Class Owner
//
//Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
//Designated Init.
//Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
//Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.


class Owner{
    var ownerId: Int
    var name: String
    var borrowedBooks: [Book]
    
    init(ownerId: Int, name: String, borrowedBooks: [Book]) {
        self.ownerId = ownerId
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func borrowBook(book: Book){
        if book.isBorrowed{
            print("ეს წიგნი უკვე ნათხოვარია\n")
            return
        }
        book.hasBeenBorrowed()
        borrowedBooks.append(book)
    }
    
    func returnBook(book: Book){
        for (index, borrowedBook) in borrowedBooks.enumerated() { 
            if borrowedBook.bookID == book.bookID {
                book.hasBeenReturned()
                borrowedBooks.remove(at: index)
                return
            }
        }
        

        print("ეს წიგნი უკვე დაბრუნებულია, ან არ არსებობს\n")
        
    }
}


//3.შევქმნათ Class Library
//
//Properties: Books Array, Owners Array.
//Designated Init.
//Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
//Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
//Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
//Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
//Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
//Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
//Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.


class Library {
    var booksArray: [Book]
    var ownersArray: [Owner]
    
    init(booksArray: [Book], ownersArray: [Owner]) {
        self.booksArray = booksArray
        self.ownersArray = ownersArray
    }
    
    func addBookToLibrary(book: Book){
        booksArray.append(book)
        print("ბიბლიოთეკაში დაემატა ახალი წიგნი - \(book.author)-ის, \(book.title). (ID - \(book.bookID))")
    }
    
    func addOwnerToLibrary(owner: Owner){
        ownersArray.append(owner)
        print("ბიბლიოთეკაში დაემატა ახალი მომხმარებელი - \(owner.name). (ID - \(owner.ownerId))")
    }
    
    func getAllAvailableBooks() -> [Book] {
        booksArray.filter { !$0.isBorrowed }
    }
    
    func getAllBorroweBooks() -> [Book] {
        booksArray.filter { $0.isBorrowed }
    }
    
    func getOwnerWithId(ownerId: Int) -> Owner?{
        return ownersArray.first { owner in
            owner.ownerId == ownerId
        }
    }
    
    func getBorrowedBooksWithOwner(ownerId: Int) -> [Book]{
        let owner = getOwnerWithId(ownerId: ownerId)
        return owner!.borrowedBooks
    }
    
    func giveBookToOwner(ownerId: Int, bookId: Int){
        let availableBooks = getAllAvailableBooks()
        guard let owner = getOwnerWithId(ownerId: ownerId) else {
                print("მომხმარებელი შესაბამისი ID-თ (\(ownerId)) არ არსებობს\n")
                return
            }
        
        var bookToBorrow: Book?
        
        for book in availableBooks {
            if book.bookID == bookId{
                bookToBorrow = book
                break
            }
        }
        
        if let book = bookToBorrow {
            owner.borrowBook(book: book)
            print("\(owner.name) (ID - \(owner.ownerId)) - მომხმარებელმა წაიღო - \(book.title) (ID - \(book.bookID)) \n")
        } else {
            print("წიგნი შესაბამისი ID-თ (\(bookId)) არ არსებობს, ან წაღებულია\n")
        }
    }
    
    func returnBookBackToLibrary(ownerId: Int, bookId: Int){
        guard let owner = getOwnerWithId(ownerId: ownerId) else {
                print("მომხმარებელი შესაბამისი ID-თ (\(ownerId)) არ არსებობს\n")
                return
            }
        guard let bookIndex = owner.borrowedBooks.firstIndex(where: { $0.bookID == bookId }) else {
                    print("წიგნი ID-თ \(bookId), ვერ მოიძებნა \(owner.name)-ს ნათხოვარ წიგნებში.\n")
                    return
            }

        let bookToReturn = owner.borrowedBooks[bookIndex]
        owner.returnBook(book: bookToReturn)
        print("მომხმარებელმა - \(owner.name) (ID - \(owner.ownerId)) დააბრუნა - \(bookToReturn.title) (ID - \(bookToReturn.bookID))\n")

    }
    
    func printAllAvailableBooks(){
        let available = getAllAvailableBooks()
        if available.isEmpty{
            print("ამ მომენტისთვის ბიბლიოთეკაში წიგნები არ გვაქვს\n")
        }else{
            print("ბიბლიოთეკაში არსებული წიგნები:")
            print("|--- წიგნი ---|--- ავტორი ---|--- ID ---|")
            available.forEach({ book in
                print("|---\(book.title)---|---\(book.author)---|---\(book.bookID)---|")
            })
            print()
        }
    }
    
    func printAllBorrowedBooks(){
        let borrowed = getAllBorroweBooks()
        if borrowed.isEmpty{
            print("ამ მომენტისთვის ბიბლიოთეკაში წიგნები არ გვაქვს\n")
        }else{
            print("ნათხოვარი წიგნები:")
            print("|--- წიგნი ---|--- ავტორი ---|--- ID ---|")
            borrowed.forEach({ book in
                print("|---\(book.title)---|---\(book.author)---|---\(book.bookID)---|")
            })
            print()
        }
    }
    
    func printOwnersBorrowedBooks(ownerId: Int){
        guard let owner = getOwnerWithId(ownerId: ownerId) else {
                print("მომხმარებელი შესაბამისი ID-თ (\(ownerId)) არ არსებობს\n")
                return
            }
        let books = getBorrowedBooksWithOwner(ownerId: ownerId)
        print("მომხმარებელი - \(owner.name)-ს (ID - \(owner.ownerId)) ნათხოვარი წიგნები:")
        books.forEach({book in
            print("\(book.author)-ს \(book.title). (ID - \(book.bookID))")
        })
        print()
    }
    
}

//4.გავაკეთოთ ბიბლიოთეკის სიმულაცია.
//
//შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
//დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
//წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
//დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.


var book1 = Book(bookID: 1001, title: "წიგნი 1", author: "ავტორი 1", isBorrowed: false)
var book2 = Book(bookID: 1002, title: "წიგნი 2", author: "ავტორი 2", isBorrowed: false)
var book3 = Book(bookID: 1003, title: "წიგნი 3", author: "ავტორი 3", isBorrowed: false)
var book4 = Book(bookID: 1004, title: "წიგნი 4", author: "ავტორი 4", isBorrowed: false)
var book5 = Book(bookID: 1005, title: "წიგნი 5", author: "ავტორი 5", isBorrowed: false)
var book6 = Book(bookID: 1006, title: "წიგნი 6", author: "ავტორი 6", isBorrowed: false)

var owner1 = Owner(ownerId: 101, name: "აკაკი", borrowedBooks: [])
var owner2 = Owner(ownerId: 102, name: "ალექსანდრე", borrowedBooks: [])
var owner3 = Owner(ownerId: 103, name: "ანა", borrowedBooks: [])

var library = Library(booksArray: [], ownersArray: [])

var newBooksArray = [book1, book2, book3, book4, book5, book6]
var newOwnersArray = [owner1, owner2, owner3]

for book in newBooksArray{
    library.addBookToLibrary(book: book)
}

for owner in newOwnersArray{
    library.addOwnerToLibrary(owner: owner)
}

library.giveBookToOwner(ownerId: 101, bookId: 1001)
library.giveBookToOwner(ownerId: 101, bookId: 1002)
library.giveBookToOwner(ownerId: 101, bookId: 1003)
library.giveBookToOwner(ownerId: 103, bookId: 1004)
library.giveBookToOwner(ownerId: 103, bookId: 1005)
library.giveBookToOwner(ownerId: 103, bookId: 1006)
library.giveBookToOwner(ownerId: 100, bookId: 1001) //error არ არსებობს მომხმარებელი ამ აიდით
library.giveBookToOwner(ownerId: 101, bookId: 2001) //error არ არსებობს წიგნი ამ აიდით

library.returnBookBackToLibrary(ownerId: 101, bookId: 1001)
library.returnBookBackToLibrary(ownerId: 103, bookId: 1006)
library.returnBookBackToLibrary(ownerId: 101, bookId: 1001) //error აღარ აქვს ეგ წიგნი
library.returnBookBackToLibrary(ownerId: 100, bookId: 1001) //error არ არსებობს ეგ მომხმარებელი

library.printAllAvailableBooks()
library.printAllBorrowedBooks()
library.printOwnersBorrowedBooks(ownerId: 101)

library.getOwnerWithId(ownerId: 1)

// ბევრი ფუნქციონალის დამატება შეიძლებოდა მაგალითად დუპლიკატების detection, როგორც წიგნებზე ისე იუზერებზე, ძირითადად ალბათ exception-ები აკლია ბევრგან, მარა დრო არალი :დ

// optional
//შექმენით კლასი გამონათქვამების გენერატორი, სადაც განმარტავთ გამონათქვამს-ს რომელიც იქნება სტრინგებისგან შემდგარი კოლექცია. შექმენით მეთოდი სადაც დააბრუნებთ შერჩევითად სხვადასხვა ჯოუქს და დაბეჭდავთ მას, ასევე ჩაამატეთ მეთოდი, რომელიც ჩასვამს ან ამოაკლებს გამონათქვამს სიიდან. მოცემული გაქვთ “ქილერ” გამონათქვამების სია:
//
//დავინახე თუ არა მივხვდი, რომ – ” დევიღუპე. ”
//
//ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად
//
//სულის ტკივილამდე ვტკივილობ….
//
//იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ
//
//არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ
//
//ფულის წვიმა რომ მოდიოდეს ნისიების რვეული დამეცემა თავზე
//
//თქვენ მოჰკალით ძერა?
//
//ბებიააა... ბებია... ოლია მათხოვარი მევიდა...
//
//მზე აღარ ამოდის ჩაგვიჭრეს


var killerSayings = [
    "დავინახე თუ არა მივხვდი, რომ – ” დევიღუპე. ”",
    "ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად",
    "სულის ტკივილამდე ვტკივილობ….",
    "იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ",
    "არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ",
    "ფულის წვიმა რომ მოდიოდეს ნისიების რვეული დამეცემა თავზე",
    "თქვენ მოჰკალით ძერა?",
    "ბებიააა... ბებია... ოლია მათხოვარი მევიდა...",
    "მზე აღარ ამოდის ჩაგვიჭრეს"
]
//
//class sayingsGenerator {
//    var sayings = [String]()
//    
//    init(sayings: [String] = [String]()) {
//        self.sayings = sayings
//    }
//    
//    func getRandomSaying() -> String{
//        return sayings.randomElement() ?? "ERROR - მონაცემთა ბაზა ცარიელია"
//    }
//    
//    func addSaying(newSaying: String, add: Bool){
//        if add{
//            sayings.append(newSaying)
//        }else{
//            
//        }
//        print("დაემატა ახალი გამონათქვამი - \(newSaying)")
//    }
//}
//
//var sayingClass = sayingsGenerator()
//
//killerSayings.forEach({saying in
//    sayingClass.addSaying(newSaying: saying, add: true)
//    sayingClass.addSaying(newSaying: saying, add: false)
//})
//
//sayingClass.addSaying(newSaying: "რაქენი გუდუნა ეს")
//
//print(sayingClass.getRandomSaying())
//

class QuoteGenerator {
    var quotesWithMeanings: [String: String]
    
    init(quotes: [String], meanings: [String]) {
        var quotesWithMeanings = [String: String] ()
        for (index, quote) in quotes.enumerated() {
            quotesWithMeanings[quote] = meanings[index]
        }
        self.quotesWithMeanings = quotesWithMeanings
    }
    
    func selectQuote() {
        if quotesWithMeanings.isEmpty {
            print("ver moidzebna")
        } else {
            let randomIndex = Int.random(in: 0..<quotesWithMeanings.count)
            let selectedQuote = Array(quotesWithMeanings.keys)[randomIndex]
            let selectedMeaning = quotesWithMeanings[selectedQuote] ?? ""
            print("'\(selectedQuote)' meaning: \(selectedMeaning)))")
        }
    }
    func addQuote(quote:String, meaning:String) {
        quotesWithMeanings[quote] = meaning
    }
    func removeQuote(quote: String) {
        quotesWithMeanings.removeValue(forKey: quote)
    }
}
 
let quotesArray = ["დავინახე თუ არა მივხვდი, რომ – ” დევიღუპე","ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად", "სულის ტკივილამდე ვტკივილობ","იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ", "არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ", "ფულის წვიმა რომ მოდიოდეს ნისიების რვეული დამეცემა თავზე", "თქვენ მოჰკალით ძერა?", "ბებიააა... ბებია... ოლია მათხოვარი მევიდა...", "მზე აღარ ამოდის ჩაგვიჭრეს"]
let meaningsArray = ["შემიყვარდა", "მეგრელია", "მართლა შევღონდი", "იმედი ბოლოს კვდებაო, ჩათვალე ბოლოა", "იდეალური ჩემი თავი მეზარება", "იღბლიანი ბორბალი", "შიგ გულში მოახვედრა😉","ტფუი ეშმაკს", "🌚"]
let quotesGenerator = QuoteGenerator(quotes: quotesArray, meanings: meaningsArray)
quotesGenerator.selectQuote()
quotesGenerator.addQuote(quote: "გაიხარე გენაცვალე მეჩქარეცფკიდჯსბნციჯდ", meaning: "მომწყდი თავიდან")
quotesGenerator.removeQuote(quote: "გაიხარე გენაცვალე მეჩქარეცფკიდჯსბნციჯდ")
