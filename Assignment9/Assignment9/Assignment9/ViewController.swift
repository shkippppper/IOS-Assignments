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
    
    @IBOutlet weak var calculateButtonUI: UIButton!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var switchController: UISwitch!
    
    
    @IBAction func switchMode(_ sender: UISwitch) {
        isGCD = !isGCD
        if isGCD {
            calculateButtonUI.backgroundColor = UIColor.systemBlue
            calculateButtonUI.layer.borderColor = UIColor.systemBlue.cgColor
            mainLabel.text = "უდიდესი საერთო გამყოფი"
        }else{
            calculateButtonUI.backgroundColor = UIColor.systemGreen
            calculateButtonUI.layer.borderColor = UIColor.systemGreen.cgColor
            mainLabel.text = "უმცირესი საერთო ჯერადი"
        }
    }
    
    @IBAction func num1Input(_ sender: UITextField) {
        if let input = sender.text, Int(input) != nil {
            number1 = Int(input) ?? 0
            sender.layer.borderWidth = 0
            buttonOutlet.isEnabled = true
            buttonOutlet.alpha = 1
        } else {
            sender.layer.borderWidth = 1
            sender.layer.borderColor = UIColor.red.cgColor
            buttonOutlet.isEnabled = false
            buttonOutlet.alpha = 0.5
        }
    }
    
    @IBAction func num2Input(_ sender: UITextField) {
        if let input = sender.text, Int(input) != nil {
            number2 = Int(input) ?? 0
            sender.layer.borderWidth = 0
            buttonOutlet.isEnabled = true
            buttonOutlet.alpha = 1
        } else {
            sender.layer.borderWidth = 1
            sender.layer.borderColor = UIColor.red.cgColor
            buttonOutlet.isEnabled = false
            buttonOutlet.alpha = 0.5
        }
    }
    
    @IBAction func calcButton(_ sender: UIButton) {
        var result: Int
        if isGCD {
            buttonOutlet.isEnabled = false
            buttonOutlet.alpha = 0.5
            result = calculateGCD(num1: number1, num2: number2)
            buttonOutlet.isEnabled = true
            buttonOutlet.alpha = 1
        } else {
            buttonOutlet.isEnabled = false
            buttonOutlet.alpha = 0.5
            result = calculateLCM(num1: number1, num2: number2)
            buttonOutlet.isEnabled = true
            buttonOutlet.alpha = 1
        }
        
        answerLabel.text = "პასუხი: \(result)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "უმცირესი საერთო ჯერადი"
        answerLabel.text = "პასუხი:"
        calculateButtonUI.layer.cornerRadius = 5
        calculateButtonUI.backgroundColor = UIColor.systemGreen
        calculateButtonUI.layer.borderColor = UIColor.systemGreen.cgColor
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

