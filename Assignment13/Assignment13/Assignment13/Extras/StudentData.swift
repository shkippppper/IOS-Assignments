//
//  StudentInformation.swift
//  Assignment13
//
//  Created by Akaki Titberidze on 12.04.24.
//

import UIKit

let maleImages = ["male1", "male2", "male3", "male4"]
let femaleImages = ["female1", "female2", "female3", "female4"]

enum Gender: String {
    case male = "Male"
    case female = "Female"
}

func randomEmojiToString()->String{
    let emojiRanges = [
        0x1F601...0x1F64F,
        0x2702...0x27B0,
        0x1F680...0x1F6C0,
        0x1F170...0x1F251,
    ]
    let randomRange = emojiRanges.randomElement()
    guard let ascii = randomRange?.randomElement() else { return "x" }
    let emoji = UnicodeScalar(ascii)?.description
    return emoji ?? "y"
}

func generateEmail(name: String)->String{
    let nameParts = name.split(separator: " ").map(String.init)
    let reversedParts = nameParts.reversed()
    let transformedName = reversedParts.map { $0.capitalized }.joined(separator: ".")
    return "\(transformedName)@tbcacademy.edu.ge"
}

func generateRandomCoordinate() -> String {
    let latitude = Double.random(in: -90.0...90.0)
    let longitude = Double.random(in: -180.0...180.0)
    
    return String(format: "%.4f, %.4f", latitude, longitude) // format to 4 digits
}

class StudentInformation {
    var fullName: String
    var age: Int
    var gender: Gender
    var hobby: String
    var profileImage: UIImage
    var randomEmoji: String
    var email: String
    var favNumb: String
    var geoLocation: String
    var codingMonths: String
    
    init(fullName: String, age: Int, gender: Gender, hobby: String) {
        self.fullName = fullName
        self.age = age
        self.gender = gender
        self.hobby = hobby
        self.randomEmoji = randomEmojiToString()
        if gender == .male {
            let randomImage = maleImages.randomElement() ?? "male1"
            self.profileImage = UIImage(named: randomImage) ?? UIImage(named: "male1")!
        } else {
            let randomImage = femaleImages.randomElement() ?? "female1"
            self.profileImage = UIImage(named: randomImage) ?? UIImage(named: "female1")!
        }
        self.email = generateEmail(name: fullName)
        self.favNumb = String(Int.random(in: 0...10000))
        self.geoLocation = generateRandomCoordinate()
        self.codingMonths = String(Int.random(in: 0...120))
    }
}

class StudentData {


    var students = [
        StudentInformation(fullName: "nodar ghachava", age: 28, gender: .male, hobby: "hiking in the caucasus mountains"),
        StudentInformation(fullName: "elene donadze", age: 21, gender: .female, hobby: "collecting vintage georgian jewelry"),
        StudentInformation(fullName: "temuri chitashvili", age: 26, gender: .male, hobby: "developing open source software"),
        StudentInformation(fullName: "irina datoshvili", age: 24, gender: .female, hobby: "practicing aerial silk dancing"),
        StudentInformation(fullName: "tornike elyanishvili", age: 27, gender: .male, hobby: "playing classical guitar"),
        StudentInformation(fullName: "ana ioramashvili", age: 22, gender: .female, hobby: "writing short fantasy stories"),
        StudentInformation(fullName: "nini bardavelidze", age: 23, gender: .female, hobby: "studying marine biology"),
        StudentInformation(fullName: "barbare tepnadze", age: 25, gender: .female, hobby: "exploring minimalist baking"),
        StudentInformation(fullName: "mariam sreseli", age: 20, gender: .female, hobby: "learning new languages"),
        StudentInformation(fullName: "valeri mekhashishvili", age: 30, gender: .male, hobby: "competitive chess playing"),
        StudentInformation(fullName: "zuka papuashvili", age: 24, gender: .male, hobby: "restoring classic cars"),
        StudentInformation(fullName: "nutsa beriashvili", age: 24, gender: .female, hobby: "curating modern art exhibitions"),
        StudentInformation(fullName: "luka kharatishvili", age: 28, gender: .male, hobby: "documentary filmmaking"),
        StudentInformation(fullName: "data robakidze", age: 27, gender: .male, hobby: "urban gardening"),
        StudentInformation(fullName: "nika kakhniashvili", age: 29, gender: .male, hobby: "skydiving"),
        StudentInformation(fullName: "sandro gelashvili", age: 25, gender: .male, hobby: "digital music production"),
        StudentInformation(fullName: "ana namgaladze", age: 21, gender: .female, hobby: "photographing street fashion"),
        StudentInformation(fullName: "bakar kharabadze", age: 30, gender: .male, hobby: "mountain biking"),
        StudentInformation(fullName: "archil menabde", age: 27, gender: .male, hobby: "crafting handmade pottery"),
        StudentInformation(fullName: "tamuna kakhidze", age: 22, gender: .female, hobby: "volunteering at animal shelters"),
        StudentInformation(fullName: "giorgi michitashvili", age: 23, gender: .male, hobby: "bird watching"),
        StudentInformation(fullName: "salome topuria", age: 23, gender: .female, hobby: "yoga and meditation"),
        StudentInformation(fullName: "luka gujejiani", age: 29, gender: .male, hobby: "competitive video gaming"),
        StudentInformation(fullName: "gega tatulishvili", age: 26, gender: .male, hobby: "exploring virtual reality tech"),
        StudentInformation(fullName: "raisa badalova", age: 24, gender: .female, hobby: "ballet dancing"),
        StudentInformation(fullName: "aleksandre saroiani", age: 28, gender: .male, hobby: "astronomy and telescope making"),
        StudentInformation(fullName: "begi kopaliani", age: 29, gender: .male, hobby: "collecting rare vinyl records"),
        StudentInformation(fullName: "akaki titberidze", age: 26, gender: .male, hobby: "kayaking in whitewater rivers"),
        StudentInformation(fullName: "sandro kupatadze", age: 27, gender: .male, hobby: "scuba diving in the black sea"),
        StudentInformation(fullName: "gvantsa gvagvalia", age: 22, gender: .female, hobby: "organic gardening"),
        StudentInformation(fullName: "vano kvakhadze", age: 24, gender: .male, hobby: "studying quantum physics")
    ]

}
