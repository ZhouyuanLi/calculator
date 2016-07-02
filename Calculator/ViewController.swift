//
//  ViewController.swift
//  Calculator
//
//  Created by Minjie Li on 6/28/16.
//  Copyright © 2016 Minjie Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTypingNumber = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingNumber == false {
            display.text = digit
            userIsInTheMiddleOfTypingNumber = true
        } else {
            display.text = display.text! + digit
        }
        print("digit = \(digit)")
    }
    
    @IBAction func operate(sender: UIButton) {
        
    }
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingNumber = false
        operandStack.append(displayValue)
        print(operandStack)
    }
    
    var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
            userIsInTheMiddleOfTypingNumber = false
        }
        
    }
}

