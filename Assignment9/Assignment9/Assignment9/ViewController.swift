//
//  ViewController.swift
//  Assignment9
//
//  Created by Akaki Titberidze on 03.04.24.
//

import UIKit

class ViewController: UIViewController {

    //უმცირესი საერთო ჯერადი LCM
    //უდიდესი საერთო გამყოფი GCD
    
    var number1: Int = 0
    var number2: Int = 0
    var isGCD: Bool = false
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var switchController: UISwitch!
    @IBAction func firstNumber(_ sender: Any) {
        print(123)
    }
    
    @IBAction func switchMode(_ sender: UISwitch) {
        isGCD = !isGCD
        if isGCD {
            mainLabel.text = "უდიდესი საერთო გამყოფი"
        }else{
            mainLabel.text = "უმცირესი საერთო ჯერადი"
        }
    }
    
    @IBAction func num1Input(_ sender: UITextField) {
        if let input = sender.text{
            number1 = Int(input) ?? 0
        }
    }
    
    @IBAction func num2Input(_ sender: UITextField) {
        if let input = sender.text{
            number2 = Int(input) ?? 0
        }
    }
    
    @IBAction func calcButton(_ sender: UIButton) {
        var result: Int
        if isGCD {
            result = calculateGCD(num1: number1, num2: number2)
        } else {
            result = calculateLCM(num1: number1, num2: number2)
        }
        
        answerLabel.text = "პასუხი: \(result)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "უმცირესი საერთო ჯერადი"
        answerLabel.text = "პასუხი:"
    }

    
    func calculateLCM(num1: Int, num2: Int) -> Int{
        var greater = max(num1, num2)
        
        if num1 == 0 || num2 == 0 {
            return 1
        }
        
        while true{
            if (greater % num1 == 0) && (greater % num2 == 0){
                return greater
            }
            greater += 1
        }
    }
    
    func calculateGCD(num1: Int, num2: Int) -> Int{
        var temp = 0
        var maxNum = max(num1, num2)
        var minNum = min(num1, num2)
        
        // euclid algorithm
        while minNum != 0 {
            temp = maxNum
            maxNum = minNum
            minNum = temp % maxNum
        }
        
        return maxNum
    }
    
}

