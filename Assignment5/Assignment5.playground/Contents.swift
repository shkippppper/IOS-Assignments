import Foundation

//1.შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.

enum WeekDay {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

func checkIfWorkDay(weekDay: WeekDay){
    switch weekDay{
    case .monday:
        print("\(WeekDay.monday) სამუშაო დღეა")
    case .tuesday:
        print("\(WeekDay.tuesday) სამუშაო დღეა")
    case .wednesday:
        print("\(WeekDay.wednesday) სამუშაო დღეა")
    case .thursday:
        print("\(WeekDay.thursday) სამუშაო დღეა")
    case .friday:
        print("\(WeekDay.friday) სამუშაო დღეა")
    case .saturday:
        print("\(WeekDay.saturday) დასვენების დღეა")
    case .sunday:
        print("\(WeekDay.sunday) დასვენების დღეა")
    }
}

checkIfWorkDay(weekDay: .monday)
checkIfWorkDay(weekDay: .saturday)


//2.შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს

enum GialaSquad{
    case TsigroviManto
    case MoshishvlebuliMkerdi
    case TuGapatio
    
    var monthlyCost:Int { //computed
        switch self {
        case .TsigroviManto:
            return 8300
        case .MoshishvlebuliMkerdi:
            return 5200
        case .TuGapatio:
            return 2100
        }
        
    }
    
    func printPrice(){
        print("\(self)-ს დონის თვიური გადასახადი არის \(monthlyCost)💵")
    }
}

var mySubscriptionLevel = GialaSquad.TsigroviManto
mySubscriptionLevel.printPrice()
mySubscriptionLevel = .MoshishvlebuliMkerdi
mySubscriptionLevel.printPrice()
mySubscriptionLevel = .TuGapatio
mySubscriptionLevel.printPrice()


//3.შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.

enum Weather {
    case Sunny(Celsius: Int)
    case Cloudy(Celsius: Int)
    case Rainy(Celsius: Int)
    case Snowy(Celsius: Int)
}

func reccomendClothing(weather: Weather){
    switch weather{
    case .Sunny(let celsius):
        if celsius > 20 {
            print("მაიკა, შორტი, შლოპანცები, სათვალეები")
        }else{
            print("ჰუდი, შარვალი, ბოტასები, სათვალეები")
        }
    case .Cloudy(let celsius):
        if celsius > 20{
            print("მაიკა, შორტი, ბოტასები, ზონწიკი")
        }else{
            print("ჰუდი, შარვალი, ბოტასები, ზონწიკი")
        }
    case .Rainy(let celsius):
        if celsius > 20{
            print("მაიკა, შორტი, ბოტასები, ზონწიკი")
        }else{
            print("ჰუდი, შარვალი, ბოტასები, ზონწიკი")
        }
    case .Snowy(let celsius):
        if celsius > -5{
            print("კომბინიზონი, ქვედა კომბინიზონი, ზედა კომბინიზონი, ყველა კომბინიზონი")
        }else{
            print("დარჩი სახში")
        }
    }
}

var currentWeather = Weather.Snowy(Celsius: 0)
reccomendClothing(weather: currentWeather)


//4.შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.

struct Kanye{
    var album: String
    var releaseYear: UInt
}

var myArray = [Kanye]()

myArray = [
    Kanye.init(album: "The College Dropout", releaseYear: 2004),
    Kanye.init(album: "Late Registration ", releaseYear: 2005),
    Kanye.init(album: "Graduation", releaseYear: 2007),
    Kanye.init(album: "808s & Heartbreak", releaseYear: 2008),
    Kanye.init(album: "My Beautiful Dark Twisted Fantasy ", releaseYear: 2010),
    Kanye.init(album: "Watch the Throne", releaseYear: 2011),
    Kanye.init(album: "Good Music Cruel Summer ", releaseYear: 2012),
    Kanye.init(album: "Yeezus", releaseYear: 2013)
]

func returnAllAlbumsBeforeYear(albums: [Kanye], yearToCheck: UInt) -> [String]{
    var filteredAlbums = [String]()
    for album in albums {
        if (album.releaseYear > yearToCheck){
            filteredAlbums.append(album.album)
        }
    }
    
    return filteredAlbums
}

print(returnAllAlbumsBeforeYear(albums: myArray, yearToCheck: 2008))


//5.შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა
struct lazyPropertyWrapper {
    lazy var cachedData: String = {
        return "lazy initialized"
    }()
}

let getClosure: () -> Void = {
    var instance = lazyPropertyWrapper()
    print(instance.cachedData)
}
    
getClosure()
    
//Optional:



//ბარბარემ გადაწყვიტა პროგრამირებასთან ერთად დამატებითი სამსახური დაეწყო და ტაროს სამკითხაო ჯიხური გახსნა. მისი სახელი უცებ გავარდა და ქართველი ვარსკვლავების ყურამდეც მივიდა. ერთ დღეს მას ჯიხურში ძალიან ნაცნობი სახეები გამოეცხადა, ბედინა და შავი პრინცი. პროფესიონალმა ნათელმხილველმა გაშალა კარტი და დაიწყო მათ მომავალში ხელების ფათური. ბარბარეს ტაროს დასტა საკმაოდ უნიკალურია, ის მხოლოდ 12 კარტს შეიცავს - Star, Empress, Tower, Hanged Man, Chariot, Moon, Hierophant, Devil, Lovers, Wheel of Fortune, Fool, Magician და მათ აღწერებს -



//* Star: წარმოადგენს იმედს, შთაგონებას და სულიერ ხელმძღვანელობას. ეს ნიშნავს განახლებას, ოპტიმიზმს და მომავლის რწმენას.
//
//* Empress: განასახიერებს აღზრდას, სიუხვეს და დედობრივ ინსტინქტებს. ის წარმოადგენს ნაყოფიერებას, კრეატიულობას და ჰარმონიას ურთიერთობებში.
//
//* Tower: ნიშნავს უეცარ ცვლილებას, ქაოსს და განადგურებას. ის წარმოადგენს აჯანყებას, გამოცხადებას და ძველი სტრუქტურების ნგრევას ახალი წამოწყებისთვის.
//
//* Hanged Man: წარმოადგენს მსხვერპლს, დანებებას და გაშვებას. ეს ნიშნავს შეჩერების, ახალი პერსპექტივების მოპოვებისა და თვითრეფლექსიის პერიოდს.
//
//* Chariot: განასახიერებს ნებისყოფას, მონდომებას და გამარჯვებას. ის წარმოადგენს საკუთარ ცხოვრებაზე კონტროლის აღებას, მიზნების მიღწევას და დაბრკოლებების გადალახვას ფოკუსირებისა და სწრაფვის გზით.
//
//* Moon: აღნიშნავს ინტუიციას, ილუზიას და ქვეცნობიერ აზრებს. ის წარმოადგენს გაურკვევლობას, დაბნეულობას და აუცილებლობას, ენდოთ საკუთარ ინსტინქტებს უცნობისკენ ნავიგაციის დროს.
//
//* Hierophant: წარმოადგენს ტრადიციას, შესაბამისობას და სულიერ ხელმძღვანელობას. ეს ნიშნავს სიბრძნის ძიებას დამკვიდრებული რწმენებისგან, ინსტიტუტებისა და მენტორებისგან.
//
//* Devil: განასახიერებს ცდუნებას, მონობასა და მატერიალიზმს. ის წარმოადგენს ადამიანის ბუნების ბნელ ასპექტებს, დამოკიდებულებას და შემზღუდველი რწმენებისა და ჩვევებისგან თავის დაღწევის აუცილებლობას.
//
//* Lovers: აღნიშნავს პარტნიორობას, არჩევანს და ჰარმონიას. ის წარმოადგენს სიყვარულს, მიზიდულობას და გადაწყვეტილების მიღების აუცილებლობას ღირებულებებზე და სხვებთან კავშირებზე დაყრდნობით.
//
//* Wheel of Fortune: წარმოადგენს ბედს, ციკლებს და მოულოდნელ ცვლილებებს. ეს ნიშნავს იღბალს, შესაძლებლობებს და ცხოვრებისეული მოგზაურობის აღმავლობასა და ვარდნას, გვახსენებს, რომ ცვლილება გარდაუვალია.
//
//* Fool: განასახიერებს უდანაშაულობას, სპონტანურობას და ახალ წამოწყებებს. ეს წარმოადგენს რწმენის ნახტომს, თავგადასავლების მიღებას და სამყაროს ხელმძღვანელობისადმი ნდობას.
//
//* Magician: აღნიშნავს გამოვლინებას, ძალას და პოტენციალს. ის წარმოადგენს კრეატიულობას, უნარს და უნარს, იდეები რეალობად გარდაქმნას ორიენტირებული განზრახვისა და მოქმედების გზით.
//
//
//
//შექმენით Enum სახელად TarotCard და განსაზღვრეთ მასში 12 კარტის ქეისი.
//
//შექმენით სტატიკური მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტს შერჩევითად
//
//შექმენით მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტის აღწერას string-ის სახით
//
//შექმენით სტრუქტურა სახელად TarotReading. გაუწერეთ ფროფერთიები წარსული, აწმყო და მომავალი. გაუკეთეთ ინიციალიზაცია ამ ფროპერთიებს რათა მათ მიიღონ შერჩევითი ტაროს კარტის აღწერის მნიშვნელობა.
//
//შექმენით მეთოდი TarotReading-ში, რომელიც დაბეჭდავს ამ სამ არჩეულ ტაროს კარტს.
//

enum TarotCard: String, CaseIterable {
    case Star = "წარმოადგენს იმედს, შთაგონებას და სულიერ ხელმძღვანელობას. ეს ნიშნავს განახლებას, ოპტიმიზმს და მომავლის რწმენას."
    case Empress = "განასახიერებს აღზრდას, სიუხვეს და დედობრივ ინსტინქტებს. ის წარმოადგენს ნაყოფიერებას, კრეატიულობას და ჰარმონიას ურთიერთობებში."
    case Tower = "ნიშნავს უეცარ ცვლილებას, ქაოსს და განადგურებას. ის წარმოადგენს აჯანყებას, გამოცხადებას და ძველი სტრუქტურების ნგრევას ახალი წამოწყებისთვის."
    case HangedMan = "წარმოადგენს მსხვერპლს, დანებებას და გაშვებას. ეს ნიშნავს შეჩერების, ახალი პერსპექტივების მოპოვებისა და თვითრეფლექსიის პერიოდს."
    case Chariot = "განასახიერებს ნებისყოფას, მონდომებას და გამარჯვებას. ის წარმოადგენს საკუთარ ცხოვრებაზე კონტროლის აღებას, მიზნების მიღწევას და დაბრკოლებების გადალახვას ფოკუსირებისა და სწრაფვის გზით."
    case Moon = "აღნიშნავს ინტუიციას, ილუზიას და ქვეცნობიერ აზრებს. ის წარმოადგენს გაურკვევლობას, დაბნეულობას და აუცილებლობას, ენდოთ საკუთარ ინსტინქტებს უცნობისკენ ნავიგაციის დროს."
    case Hierophant = "წარმოადგენს ტრადიციას, შესაბამისობას და სულიერ ხელმძღვანელობას. ეს ნიშნავს სიბრძნის ძიებას დამკვიდრებული რწმენებისგან, ინსტიტუტებისა და მენტორებისგან."
    case Devil = "განასახიერებს ცდუნებას, მონობასა და მატერიალიზმს. ის წარმოადგენს ადამიანის ბუნების ბნელ ასპექტებს, დამოკიდებულებას და შემზღუდველი რწმენებისა და ჩვევებისგან თავის დაღწევის აუცილებლობას."
    case Lovers = "აღნიშნავს პარტნიორობას, არჩევანს და ჰარმონიას. ის წარმოადგენს სიყვარულს, მიზიდულობას და გადაწყვეტილების მიღების აუცილებლობას ღირებულებებზე და სხვებთან კავშირებზე დაყრდნობით."
    case WheelOfFortune = "წარმოადგენს ბედს, ციკლებს და მოულოდნელ ცვლილებებს. ეს ნიშნავს იღბალს, შესაძლებლობებს და ცხოვრებისეული მოგზაურობის აღმავლობასა და ვარდნას, გვახსენებს, რომ ცვლილება გარდაუვალია."
    case Fool = "განასახიერებს უდანაშაულობას, სპონტანურობას და ახალ წამოწყებებს. ეს წარმოადგენს რწმენის ნახტომს, თავგადასავლების მიღებას და სამყაროს ხელმძღვანელობისადმი ნდობას."
    case Magician = "აღნიშნავს გამოვლინებას, ძალას და პოტენციალს. ის წარმოადგენს კრეატიულობას, უნარს და უნარს, იდეები რეალობად გარდაქმნას ორიენტირებული განზრახვისა და მოქმედების გზით."
    
    static func randomTarot() -> TarotCard {
        return self.allCases.randomElement()!
    }
    
    func getTarotDefinition() -> String{
        return self.rawValue
    }
}

struct TarotReading {
    var pastTarot: TarotCard
    var presentTarot: TarotCard
    var futureTarot: TarotCard
    
    init(){
        self.pastTarot = TarotCard.randomTarot()
        self.presentTarot = TarotCard.randomTarot()
        self.futureTarot = TarotCard.randomTarot()
        var iter = 0
        while self.pastTarot == self.presentTarot || self.presentTarot == self.futureTarot || self.pastTarot == self.futureTarot{
//            print( self.pastTarot, self.presentTarot, self.futureTarot)
            self.presentTarot = TarotCard.randomTarot()
            self.futureTarot = TarotCard.randomTarot()
        }
    }
    
    func ReadTarot(){
        print()
        print("წარსულის კარტია - \(pastTarot) და ის \(pastTarot.getTarotDefinition()) \n")
        print("აწმყოს კარტია - \(presentTarot) და ის \(presentTarot.getTarotDefinition())\n")
        print("მომავლის კარტია - \(futureTarot) და ის \(futureTarot.getTarotDefinition())\n")
    }
}

var myTarotReading = TarotReading.init()

myTarotReading.ReadTarot()
