import Foundation


//1.შექმენით ენამი Gender სადაც იქნება 2 გენდერი (გენდერზე არ გამომეკიდოთ, თუ გინდათ მეტი ჩაამატეთ)
enum Gender {
    case AttackHelicopter, FeAttackHelicopter, Amirani
}

//2.შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender

protocol SuperBeing {
    var name: String { get }
    var strength: Int { get }
    var speed: Int { get }
    var weakness: String { get }
    var gender: Gender { get }
}


//3.SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა

extension SuperBeing {
    var strength: Int {
        return 20
    }
    
    var speed: Int {
        return 30
    }
}

//4.შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.
//5.გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String
//6.გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და დაბეჭდავს - “‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).
//7.გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს -“‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”)
//8.გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String
//9.გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს -“ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)
//10.გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს -“‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად “გელა” აღმოჩნდა)


class SuperHero: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    var strength: Int
    var speed: Int
    var outfitColor: String
    var equipment: String
    var vehicle: String
    
    init(name: String, weakness: String, gender: Gender, strength: Int, speed: Int, outfitColor: String, equipment: String, vehicle: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.strength = strength
        self.speed = speed
        self.outfitColor = outfitColor
        self.equipment = equipment
        self.vehicle = vehicle
    }
    
    func rescue(injured: String) {
        print("\(name) არ შეუშინდა სახიფათო სიტუაციას და \(injured) გადაარჩინა სიკვდილს \n")
    }
    
    func combat(superVillain: SuperVillain) {
        print("\(name) შეერკინა და დაამარცხა \(superVillain.name) \n")
    }
}


class SuperVillain: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    var strength: Int
    var speed: Int
    var evilScheme: String
    var obsession: String
    var rivalry: String
    
    init(name: String, weakness: String, gender: Gender, strength: Int, speed: Int, evilScheme: String, obsession: String, rivalry: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.strength = strength
        self.speed = speed
        self.evilScheme = evilScheme
        self.obsession = obsession
        self.rivalry = rivalry
    }
    
    func attack(superHero: SuperHero) {
        print("\(name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(superHero.name) მის შეჩერებას თუ შეძლებს \n")
    }
    
    func experimentation(subject: String){
        print("\(name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(subject) აღმოჩნდა \n")
    }
}

//11.შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან

var amirani = SuperHero(name: "ამირანი", weakness: "ღმერთების დაუმორჩილებლობა", gender: Gender.Amirani, strength: 99999, speed: 99999, outfitColor: "კანისფერი", equipment: "ფარ-ხმალი", vehicle: "ცხენი")

var batman = SuperHero(name: "ბეტმენი", weakness: "ღამურები", gender: Gender.AttackHelicopter, strength: 10, speed: 20, outfitColor: "შავი", equipment: "ფულეე💵💸", vehicle: "ბეტმობილი")

var flash = SuperHero(name: "ფლეში", weakness: "ექსტრემალური ტემპერატურა", gender: Gender.AttackHelicopter, strength: 20, speed: 999, outfitColor: "წითელი", equipment: "დამცავი სამოსი", vehicle: "პიშკომ")

var wonderWoman = SuperHero(name: "Wonder Woman", weakness: "ათაქჰელიკოპტერები(კაცები)", gender: Gender.FeAttackHelicopter, strength: 30, speed: 20, outfitColor: "ოქროსფერი", equipment: "მათრახი", vehicle: "ცხენი")

var spiderMan = SuperHero(name: "ადამიანი ობობა", weakness: "ეთილქლორიდი და წყალი", gender: Gender.FeAttackHelicopter, strength: 50, speed: 30, outfitColor: "წითელი", equipment: "ქსელმტყორცნი", vehicle: "მეტრო")


// ----------

var mogalate = SuperVillain(name: "მოღალატე", weakness: "ავლადიდება", gender: Gender.AttackHelicopter, strength: 0, speed: 20, evilScheme: "ქართველებს მეზარბაზნეები არ ჰყავთ", obsession: "ავლადიდება", rivalry: "ქართველი ერი")

var devi = SuperVillain(name: "დევი", weakness: "ნაცარქექია", gender: Gender.AttackHelicopter, strength: 123, speed: 2, evilScheme: "შეჭამოს ყველაფერი", obsession: "ჭამა", rivalry: "ნაცარქექია")

var loki = SuperVillain(name: "ლოკი", weakness: "ზედმეტი თვითდაჯერებულობა", gender: Gender.AttackHelicopter, strength: 20, speed: 30, evilScheme: "ქაოსი", obsession: "ძალაუფლება", rivalry: "თორი")

var harleyQuinn = SuperVillain(name: "ჰარლი ქვინი", weakness: "ჯოკერზე დამოკიდებულება", gender: Gender.FeAttackHelicopter, strength: 30, speed: 40, evilScheme: "ანარქია", obsession: "ჯოკერი", rivalry: "ბეტმენი")

var thanos = SuperVillain(name: "თანოსი", weakness: "ქედმაღლობა", gender: Gender.AttackHelicopter, strength: 300, speed: 20, evilScheme: "სამყაროს ბალანსი", obsession: "სამყაროს ბალანსი", rivalry: "შურისმაძიებლები")

spiderMan.rescue(injured: "გელა")
amirani.combat(superVillain: mogalate)

harleyQuinn.attack(superHero: spiderMan)
thanos.experimentation(subject: "გელა")



//Optional:

//1.დაწერეთ ჯენერიკ ფუნქცია compareSwiftness რომელიც იღებს მხოლოდ ორ პარამეტრს პირველ და მეორე სუპერგმირებს რომლებიც დაქვემდებარებულები იქნებიან SuperBeing პროტოკოლზე, ფუნქცია უნდა აბრუნებდეს სტრინგს
//2.ფუნქციის ბადიში შეამოწმეთ speed მნიშვნელობები ორივე სუპერგმირის
//3.დააბრუნეთ სტრინგი აღწერით თუ რომელი სუპერგმირია უფრო სწრაფი (გაითვალისწინეთ ისიც თუ სიჩქარეები ერთმანეთის ტოლია)

func compareSwiftness(_ subject1: SuperBeing,_ subject2: SuperBeing) -> String {
    var result: String = ""

    if subject1.speed > subject2.speed {
        result = "\(subject1.name) უფრო სწრაფია ვიდრე \(subject2.name)"
    } else if subject1.speed < subject2.speed {
        result = "\(subject2.name) უფრო სწრაფია ვიდრე \(subject1.name)"
    } else {
        result = "სუპერარსებების სიჩქარეები ტოლია"
    }
    
    print(result)
    return result
}

compareSwiftness(amirani, wonderWoman) // superhero - superhero
compareSwiftness(batman, devi)         // superhero - supervillain
compareSwiftness(harleyQuinn, flash)   // supervillain - superhero
compareSwiftness(thanos, mogalate)     // supervillain - suppervillain
