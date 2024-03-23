import Foundation
//
//1)  დაწერეთ ფუნქცია რომელიც იღებს 2 პარამეტრს(სტრინგებს), და აბრუნებს Boolean ს თუ ეს ორი სტრინგი შედგება ერთიდაიგივე ასოებისგან, რიგითობას მნიშვნელობა არ აქვს.
//დიდ და პატარა ასოებსაც ვითვალისწინებთ.
//
// მაგ:
// "abc" და "bca" დააბრუნებს true
// "Abc" და "abc" აბრუნებს false. A და a სხვადასხვად ითვლება!

//take1: brute force + break on find
func isSameString(str1: String, str2: String)->(Bool){
    if(str1.count != str2.count){
        return false
    }
    
    for char in str1{
        var isCharUsed = false
        for secondChar in str2{
            if char == secondChar{
                isCharUsed = true
                break
            }
        }
        
        if !isCharUsed{
            return false
        }
    }
    return true
}

print(isSameString(str1: "abc", str2: "cba"))


//2) დაწერეთ ფუნქცია რომელიც მიიღებს და დააბრუნებს სტრინგს სადაც ზედმეტ სფეისებს მოაშორებს.
// 
//  მაგ:
//  "A[space][space][space]B[space][space]C" დააბრუნებს "A[space]B[space]C"
//  "[space][space][space]a" დააბრუნებს "[space]a" ანუ 1 სფეისი ყოველთვის რჩება, ამ შემთხვევაში წინაც.

func removeExtraSpace(string: String) -> String{
    var result = ""
    var spaceFound = false
    
    for char in string {
        if char == " " {
            if !spaceFound {
                result += String(char)
                spaceFound = true
            }
        } else {
            result += String(char)
            spaceFound = false
        }
    }
    
    return result
}

print(removeExtraSpace(string: "      a d a   d    "))



//3) დაწერეთ ფუნქცია რომელიც იღებს სტრინგს(ეს სტრინგი მოიცავს ასევე ციფრებს), გაფილტრეთ/მოაშორეთ ასოები და დარჩენილი ციფრების ჯამს აბრუნებთ.
// 
// მაგ:
// “a1b2c3” აბრუნებს 6  ანუ(1+2+3)
// “asdf10b20c30” აბრუნებს 60 ს  (10 + 20 + 30) და ა შ.

func sumInString(string: String) -> Int{
    
    var newNumber = ""
    var numbersList = [Int]()
    var result = 0
    
    for char in string{
        if char.isNumber{
            newNumber += String(char)
        }else{
            numbersList.append(Int(newNumber) ?? 0)
            newNumber = ""
        }
        
    }
    print(numbersList)
    numbersList.append(Int(newNumber) ?? 0)
    
    result = numbersList.reduce(0, +)
    
    return result
}

print(sumInString(string: "asdf10b20c30c3"))
